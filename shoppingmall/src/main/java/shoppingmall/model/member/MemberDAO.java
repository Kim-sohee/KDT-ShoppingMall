package shoppingmall.model.member;


import java.sql.Timestamp;
import java.util.List;

import shoppingmall.domain.Member;

public interface MemberDAO {
	public Member getChildList(int member_id, Timestamp startDate, Timestamp endDate);				//자식인 Reivew,Qna List를 포함하여 Member 불러오기
	public Member selectById(String id);					//아이디로 회원 조회
	public Member selectByEmail(String email);				//이메일로 회원 조회 (일치 회원 유무 단순 체크용)
	public List<Member> selectAll();
	public Member select(int member_id);					//아이디로 회원 조회
	public Member selectWithDelivery(int member_id);
	public void insert(Member member);						//회원 등록
	public void update(Member member);						//회원 수정
	public void delete(int member_id);						//회원 삭제
	
	public Member login(Member member);						//홈페이지 로그인
	public Member snsLogin(Member member);					//SNS로그인
	public Member findIdAndPwd(String name, String phone);	//아이디, 비밀번호 찾기
}
