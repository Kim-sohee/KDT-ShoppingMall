package shoppingmall.domain;

import lombok.Data;

@Data
public class Qna {
	private int qna_id;
	private String title;
	private String content;
	private String comment_member; 
	private String comment;
	private int is_commented;
	private Member member;
	private Product product;
}
