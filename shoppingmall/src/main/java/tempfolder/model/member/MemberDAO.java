package shoppingmall.model.member;

import shoppingmall.domain.Member;

public interface MemberDAO {
	public Member selectById(String id);						//아이디로 회원 조회
	public Member selectByEmail(String email);			//이메일로 회원 조회
	public void insert(Member member);						//회원 등록
	public void update(Member member);					//회원 수정
	
	public Member login(Member member);				//홈페이지 로그인
	public Member snsLogin(Member member);			//SNS로그인
	public Member find(String name, String phone);	//아이디, 비밀번호 찾기
}
