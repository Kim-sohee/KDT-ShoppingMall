package shoppingmall.model.member;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.exception.CartException;
import shoppingmall.exception.DeliveryDeleteException;
import shoppingmall.exception.MemberDeleteException;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.exception.MemberRemoveException;
import shoppingmall.exception.MemberUpdateException;
import shoppingmall.exception.OrderSummaryDeleteException;
import shoppingmall.model.order.CartDAO;
import shoppingmall.model.order.DeliveryDAO;
import shoppingmall.model.order.OrderSummaryDAO;
import shoppingmall.util.PasswordUtil;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private DeliveryDAO deliveryDAO;
	
	@Override
	public Member selectById(String id) throws MemberNotFoundException{
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
		
		if(existingMember != null) {
			//이미 가입된 회원이라면 가입 실패
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
		
		//가입 완료 후 이메일 발송하기
		mailService.sendJoinMail(member);
	}
	
	@Override
	public Member login(Member member) throws MemberNotFoundException, MemberRegistException {
		Member existingMember = memberDAO.selectById(member.getId()); 
		
		//홈페이지 회원 로그인 시도
		if(member.getSns_provider() == null) { 
			String existingSalt = existingMember.getSalt(); //회원의 salt
			String forLoginPassword = PasswordUtil.hashPassword(member.getPassword(), existingSalt); //로그인 시도 비밀번호와 기존 salt 조합
			member.setPassword(forLoginPassword);
			
			log.debug("로그인 성공, 접속한 회원은 "+member);
			return memberDAO.login(member);
			
		} else { 
			//SNS 회원 로그인 시도
			log.debug("sns_provider: " + member.getSns_provider() + ", id: " + member.getId());
			
			if(existingMember == null) {
				//SNS로 최초 로그인 시 회원가입 후
				memberDAO.insert(member);
				log.debug("sns회원 가입 성공!");
				log.debug("회원 id는 " + member.getId());
				
				//가입 완료 후 이메일 발송하기
				mailService.sendJoinMail(member);
				
				//로그인 시도
				return member;
				
			} else {
				//기존 sns 로그인을 했던 회원은 바로 로그인 시도
				return memberDAO.snsLogin(member);
			}
			
		}
	}
	
	@Override
	public void edit(Member member, String password, String phone) throws MemberUpdateException {
		String hashedPassword = PasswordUtil.hashPassword(password, member.getSalt());
		
		if(password.length()<8 || password.length()>16) {
			throw new MemberUpdateException("회원정보 수정에 실패하였습니다.\n비밀번호는 8~16자로 입력해주세요.");
		} else if (phone.length() > 0) {
		    // 정규표현식: 숫자3자리 - 숫자3~4자리 - 숫자4자리
		    if (!phone.matches("^\\d{3}-\\d{3,4}-\\d{4}$")) {
		        throw new MemberUpdateException("전화번호 형식이 올바르지 않습니다. 예: 010-1234-5678");
		    }
		} else if (member.getPassword().equals(hashedPassword) && member.getPhone().equals(phone)) {
			throw new MemberNotFoundException("변경된 내역이 없습니다.");
		} else {
			memberDAO.update(member);			
		}
	}
	
	@Override
	@Transactional
	public void remove(int member_id) throws MemberRemoveException { //review와 qna는 삭제되지 않음을 명시하였음
		
		try {
			//해당 회원의 주문 요약 삭제
			orderSummaryDAO.deleteByMemberId(member_id);
			
			//해당 회원의 배송지 삭제
			deliveryDAO.deleteByMemberId(member_id);
			
			//해당 회원의 장바구니 삭제
			cartDAO.deleteByMemberId(member_id);
			
			//회원 삭제
			memberDAO.delete(member_id);
		} catch (OrderSummaryDeleteException | DeliveryDeleteException | CartException | MemberDeleteException e) {
			log.error("회원 삭제 중 오류", e);
			throw new MemberRemoveException("회원 삭제 실패");
		} 
		
	}
	
}
