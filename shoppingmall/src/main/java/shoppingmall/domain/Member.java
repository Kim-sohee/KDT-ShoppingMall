package shoppingmall.domain;

import java.util.List;

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
	private String joined_at;				//회원가입일자
	private int point_remained;				//회원의 잔여포인트
	private String default_address; 		//기본배송지
	
	List<Review> reviewList;				//자식인 review를 collection 객체인 List로 보유한다.
	List<Qna> qnaList;						//자식인 qna를 collection 객체인 List로 보유한다.
	List<Delivery> deliveryList;			//자식인 delivery를 collection 객체인 List로 보유한다.
}
