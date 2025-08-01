package shoppingmall.model.member;

import shoppingmall.domain.Member;

public interface MemberService {
	public Member selectById(String id);
	public void regist(Member member);
	public Member login(Member member);
}
