package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Qna;

public interface QnaDAO {
	public List<Qna> selectAll();
	public Qna select(int qna_id);
	public void insert(Qna qna);
	public void update(Qna qna);
	public void delete(int qna_id);
	
	public int qnaCount(int product_id);
}
