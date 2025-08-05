package shoppingmall.domain;

import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Data
public class Qna {
   
	private int qna_id;
	private String title;
	private String content;
	private String comment_member; 
	private String comment;
	private int is_commented;
	
	 @ManyToOne
	 @JsonBackReference("member-qnas")
	private Member member;
	private Product product;
}
