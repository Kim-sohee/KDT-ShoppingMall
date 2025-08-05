package shoppingmall.model.member;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.domain.OrderSummary;
import shoppingmall.exception.CartException;
import shoppingmall.exception.DeliveryDeleteException;
import shoppingmall.exception.LoginFailedException;
import shoppingmall.exception.MemberDeleteException;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.exception.MemberRemoveException;
import shoppingmall.exception.MemberUpdateException;
import shoppingmall.exception.OrderDetailNotFoundException;
import shoppingmall.exception.OrderSummaryDeleteException;
import shoppingmall.exception.PasswordHashingException;
import shoppingmall.exception.QnaUpdateException;
import shoppingmall.exception.ReturnsNotFoundException;
import shoppingmall.exception.ReviewUpdateException;
import shoppingmall.model.order.CartDAO;
import shoppingmall.model.order.DeliveryDAO;
import shoppingmall.model.order.OrderDetailDAO;
import shoppingmall.model.order.OrderSummaryDAO;
import shoppingmall.model.order.ReturnsDAO;
import shoppingmall.model.product.QnaDAO;
import shoppingmall.model.product.ReviewDAO;
import shoppingmall.util.PasswordUtil;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	//회원 가입 관련 DAO
	@Autowired
	private MailService mailService;
	
	//회원 삭제 관련 DAO
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	@Autowired
	private ReturnsDAO returnsDAO;
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;
	@Autowired
	private DeliveryDAO deliveryDAO;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<Member> selectAll() {
		return memberDAO.selectAll();
	}
	
	@Override
	public Member select(int memberId) {
		return memberDAO.select(memberId);
	}
	
	@Override
	public Member selectWithDelivery(int memberId) {
		return memberDAO.selectWithDelivery(memberId);
	}

	@Override
	public Member selectById(String id) {
		return memberDAO.selectById(id);
	}

	@Override
	public Member getChildList(int member_id, Timestamp startDate, Timestamp endDate) throws MemberNotFoundException{
		return memberDAO.getChildList(member_id, startDate, endDate);
	}
	
	@Override
	public void regist(Member member) throws MemberRegistException {
		
		//가입 폼에 입력한 이메일을 통해 회원을 조회하여 이미 가입되어 있는지 체크
		Member existingMember = memberDAO.selectByEmail(member.getEmail());
		
		if(existingMember != null) { //이미 가입된 회원이라면 가입 실패
			throw new MemberRegistException("이미 등록된 회원입니다.");
		} else {
			String salt = PasswordUtil.generateSalt();
			
			//전송된 파라미터와 salt를 섞어 password의 hash값 만들기
			String hashedPassword = PasswordUtil.hashPassword(member.getPassword(), salt);
			
			//Member 모델에 덮어쓰기
			member.setSalt(salt);
			member.setPassword(hashedPassword);
		}
		memberDAO.insert(member);
		log.debug("회원가입 성공!");
		
		//가입 완료 후 이메일 발송하기
		mailService.sendJoinMail(member);
		log.debug("메일전송 완료!");
	}
	
	@Override
	public Member login(Member member) throws LoginFailedException {
		
		try {
			Member existingMember = memberDAO.selectById(member.getId()); 
			
			//홈페이지 회원 로그인 시도
			if(member.getSns_provider() == null) { 
				if(existingMember == null) {
	                throw new LoginFailedException("존재하지 않는 회원입니다.");
	            }
				
				String existingSalt = existingMember.getSalt(); //회원의 salt
				String forLoginPassword = PasswordUtil.hashPassword(member.getPassword(), existingSalt); //로그인 시도 비밀번호와 기존 salt 조합
				member.setPassword(forLoginPassword);
				
				Member loggedInMember = memberDAO.login(member);
				log.debug("로그인 성공, 접속한 회원은 "+loggedInMember);
				
				if(loggedInMember == null) {
	                throw new LoginFailedException("비밀번호가 일치하지 않습니다.");
	            }
				return loggedInMember;
				
			} else { 
				//SNS 회원 로그인 시도
				log.debug("sns_provider: " + member.getSns_provider() + ", id: " + member.getId());
				
				if(existingMember == null) {
					memberDAO.insert(member); //SNS로 최초 로그인 시 회원가입
					log.debug("sns회원 가입 성공!");
					mailService.sendJoinMail(member); //가입 완료 후 이메일 발송하기
					log.debug("메일전송 완료!");
					
					return member; //로그인 시도
					
				} else {
					//한 번이라도 로그인했던 SNS 회원은 바로 로그인
					Member snsLoggedInMember = memberDAO.snsLogin(member);
					log.debug("로그인 성공, 접속한 회원은 "+snsLoggedInMember);
					return snsLoggedInMember;
				}
				
			}
		} catch (PasswordHashingException | MemberNotFoundException | MemberRegistException e) {
			throw new LoginFailedException("로그인 중 예외 발생: " + e.getMessage(), e);
		}
	}
	
	@Override
	public void edit(Member member, String password, String phone) throws MemberUpdateException, MemberNotFoundException {
		String hashedPassword = PasswordUtil.hashPassword(password, member.getSalt());
		
		if(password.length()<8 || password.length()>16) {
			throw new MemberUpdateException("회원정보 수정에 실패하였습니다.\n비밀번호는 8~16자로 입력해주세요.");
		} 
		if (phone.length() > 0 && !phone.matches("^\\d{3,4}-\\d{3,4}-\\d{4}$")) { // 정규표현식: 숫자3자리 - 숫자3~4자리 - 숫자4자리
	        throw new MemberUpdateException("전화번호 형식이 올바르지 않습니다. 예: 010-1234-5678");
	    }
		if (member.getPassword().equals(hashedPassword) && member.getPhone().equals(phone)) {
			throw new MemberNotFoundException("변경된 내역이 없습니다.");
		} 
		
		//변경 사항 반영
	    member.setPassword(hashedPassword);
	    member.setPhone(phone);

	    //DB에 업데이트
	    memberDAO.update(member);
	}
	
	@Override
	@Transactional
	public void remove(int member_id) throws MemberRemoveException { //review와 qna는 삭제되지 않음을 명시하였음
		
		try {
			//1. 해당 회원의 주문 요약 삭제
			//1-1. member_id를 통해 orderSummary 찾은 후, orderDetailDAO 및 returnsDAO에 넘기기
			List<OrderSummary> orderSummaryList = orderSummaryDAO.selectByMember(memberDAO.selectByMemberId(member_id));
			log.debug("orderSummary 조회 성공: "+orderSummaryList);
			
			//1-2. order_summary의 자식 테이블 먼저 삭제
			for(OrderSummary orderSummary : orderSummaryList) {
				int order_summary_id = orderSummary.getOrder_summary_id();
				log.debug("order_summary_id는" +order_summary_id);
				orderDetailDAO.deleteByOrderSummaryId(order_summary_id);
				log.debug("orderDetail 삭제 성공");
				returnsDAO.deleteByOrderSummaryId(order_summary_id); // 존재하는 경우
				log.debug("returns 삭제 성공");
			}
			//1-3. order_summary 삭제
			orderSummaryDAO.deleteByMemberId(member_id);
			log.debug("orderSummary 삭제 성공");
			
			//2. 해당 회원의 배송지 삭제
			deliveryDAO.deleteByMemberId(member_id);
			log.debug("delivery 삭제 성공");
			
			//3. 해당 회원의 장바구니 삭제
			cartDAO.deleteByMemberId(member_id);
			log.debug("Cart 삭제 성공");
			
			//4. 해당 회원의 리뷰 및 QNA에 연결된 FK(member_id) 끊기
			qnaDAO.setMemberIdNull(member_id);
			log.debug("qna fk연결 해제 성공");
			reviewDAO.setMemberIdNull(member_id);
			log.debug("review fk연결 해제 성공");
			
			//5. 회원 삭제
			memberDAO.delete(member_id);
			log.debug("Member 삭제 성공");

		} catch (OrderDetailNotFoundException | ReturnsNotFoundException | OrderSummaryDeleteException 
					 | DeliveryDeleteException | CartException | QnaUpdateException | ReviewUpdateException | MemberDeleteException e) {
			log.error("회원 삭제 중 오류", e);
			throw new MemberRemoveException("회원 삭제 실패");
		} 
		
	}
	
}
