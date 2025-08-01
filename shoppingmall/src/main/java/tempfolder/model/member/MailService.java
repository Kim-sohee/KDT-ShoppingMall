package shoppingmall.model.member;

import shoppingmall.domain.Member;

public interface MailService {
	public void sendJoinMail(Member member);
	public void sendFindMail(Member member, String type);
}
