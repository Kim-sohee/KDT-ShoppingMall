package shoppingmall.domain;

import lombok.Data;

@Data
public class Qna {
	private int qna_id;
	private String qna_title;
	private String qna_content;
	private String comment_member; 
	private String comment;
	private int is_commented;
	private Member member;
	// private Product product_id; product 생성되면 만들기
}
