package shoppingmall.domain;

import lombok.Data;

@Data
public class Member {
	private int member_id;
	private String member_name;
	private String id;
	private String password;
	private String salt;
	private String email;
	private String sns_provider;			//소셜로그인 플랫폼
	private String phone;
	private String joined_at;						//회원가입일자
	private int point_remained;			//회원의 잔여포인트
	private String default_address; 	//기본배송지
}
