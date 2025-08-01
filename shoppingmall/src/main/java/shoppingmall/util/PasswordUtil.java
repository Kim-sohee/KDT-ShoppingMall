package shoppingmall.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.exception.PasswordHashingException;

@Slf4j
@Component
public class PasswordUtil {
	
	//salt 생성
	public static String generateSalt() {
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[16];	// 주로 16바이트 사용 (16~32바이트)
		random.nextBytes(salt); 		//salt 배열을 무작위 바이트로 채운다.
		
		//배열 자체를 사용할 수 없으므로, 문자열로의 변환을 위해 Base64로 호출
		return Base64.getEncoder().encodeToString(salt);
	}
	
	//salt와 password 조합하여 hash값 생성
	public static String hashPassword(String password, String salt) throws PasswordHashingException {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256"); //해시화를 위해 SHA-256 사용
			md.update(salt.getBytes("UTF-8"));
			byte[] hashedPassword = md.digest(password.getBytes("UTF-8"));
			return Base64.getEncoder().encodeToString(hashedPassword);
			
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			throw new PasswordHashingException("비밀번호 해시화 실패", e);
		}
	}
	
}
