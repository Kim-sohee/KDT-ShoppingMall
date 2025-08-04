package shoppingmall.model.member;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Member;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.util.PasswordUtil;

@Slf4j
@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private JavaMailSender mailSender;
	
	/*-------------------------------------------------
	  회원가입 완료 메일 전송
	-------------------------------------------------*/
	@Override
	public void sendJoinMail(Member member) {
		String username = member.getMember_name();
		String toEmail = member.getEmail();

		String subject = "보드게임에 오신 것을 환영합니다!";
		String content = "<html><body><h1>안녕하세요 " + username + "님</h1><p>가입을 축하드립니다!</p></body></html>";

		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(toEmail);
			helper.setSubject(subject);
			helper.setText(content, true); // true -> HTML
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		mailSender.send(message);
	}
	
	/*-------------------------------------------------
	  아이디, 비밀번호 찾기 메일 전송
	-------------------------------------------------*/
	@Override
	public void sendFindMail(Member member, String type) throws MemberNotFoundException {
		Member existingMember = null;
		String subject = null;
		String content = null;

		if ("id".equals(type)) {
			// 아이디 찾기
			log.debug("전달받은 회원 정보 " + member);
			existingMember = memberDAO.findIdAndPwd(member.getMember_name(), member.getPhone());
			log.debug("기존 회원이 있는지? " + existingMember);

			subject = "ID찾기 정보";
			content = "<html><body><h1>요청하신 ID는 " + existingMember.getId() + "입니다.</h1></body></html>";

		} else if ("password".equals(type)) {
			// 비밀번호 찾기
			existingMember = memberDAO.selectById(member.getId());

			// 1. 임시비밀번호 생성
			String tempPassword = UUID.randomUUID().toString().substring(0, 8); // 예: 8자리 임시비번
			String salt = existingMember.getSalt();
			String updatePassword = PasswordUtil.hashPassword(tempPassword, salt);

			// 2. DB 업데이트 (암호화해서 저장하는 게 원칙이지만 여기선 생략 가능)
			existingMember.setPassword(updatePassword);
			memberDAO.update(existingMember); // update 쿼리 필요

			subject = "임시 비밀번호 안내";
			content = "<html><body><h1>임시비밀번호는 " + tempPassword + "입니다.</h1><p>로그인 후 비밀번호를 변경해주세요.</p></body></html>";
		}
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(existingMember.getEmail());
			helper.setSubject(subject);
			helper.setText(content, true); // true -> HTML
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		mailSender.send(message);
	}
}
