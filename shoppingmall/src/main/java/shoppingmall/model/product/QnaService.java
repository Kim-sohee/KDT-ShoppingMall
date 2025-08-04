package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Qna;

public interface QnaService {
	public List<Qna> selectAll();
	public List<Qna> selectOrderBy();
	public Qna select(int qna_id);
	public void insert(Qna qna);
	public void update(Qna qna);
	public void updateFromAdmin(Qna qna);
	public void delete(int qna_id);
	public int count(int product_id);
	}
