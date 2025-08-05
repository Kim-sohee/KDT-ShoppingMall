package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Qna;

public interface QnaDAO {
	public List<Qna> selectAll();
	public List<Qna> selectAllOrderBy();
	public Qna select(int qna_id);
	public void insert(Qna qna);
	public void update(Qna qna);
	public void delete(int qna_id);
	public void updateFromAdmin(Qna qna);
	public int qnaCount(int product_id);
	public void setMemberIdNull(int member_id);
	
	//물건 한 건 당 QNA 얻어오기
	public List<Qna> selectByProductId(int product_id);
	public int totalRecord();
	public List<Qna> selectByMemberId(int member_id);
	public int selectByNotCommentedCount();
}
