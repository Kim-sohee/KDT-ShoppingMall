package shoppingmall.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Member;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.util.PasswordUtil;

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

		/* 홈페이지 회원인 경우 */
		if(member.getSns_provider()==null) { 
			String salt = PasswordUtil.generateSalt();
			
			//전송된 파라미터와 salt를 섞어 password의 hash값 만들기
			String hashedPassword = PasswordUtil.hashPassword(member.getPassword(), salt);
			
			//Member 모델에 덮어쓰기
			member.setSalt(salt);
			member.setPassword(hashedPassword);
		}
		memberDAO.insert(member);
		
		/* 가입 완료 후 이메일 발송하기 */
		
	}
	
	@Override
	public Member login(Member member) {
		return null;
	}
}
