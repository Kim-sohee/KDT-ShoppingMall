package shoppingmall.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.util.PasswordUtil;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public Member selectById(String id) {
		return memberDAO.selectById(id);
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
				
				//로그인 시도
				return member;
				
				//가입 완료 후 이메일 발송하기
				
			} else {
				//기존 sns 로그인을 했던 회원은 바로 로그인 시도
				return memberDAO.snsLogin(member);
			}
			
		}
	}
}
