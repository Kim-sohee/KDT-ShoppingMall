package shoppingmall.model.member;

import java.sql.Timestamp;
import java.util.List;

import shoppingmall.domain.Member;

public interface MemberService {
	public List<Member> selectAll();
	public List<Member> selectByPage(int pageSize, int offset);	
	public Member select(int memberId);
	public Member selectWithDelivery(int memberId);
	public Member selectById(String id);
	public Member getChildList(int member_id, Timestamp startDate, Timestamp endDate);
	public void regist(Member member);
	public void edit(Member member, String password, String phone);
	public void remove(int member_id);
	public Member login(Member member);
	public int totalRecord();
}
