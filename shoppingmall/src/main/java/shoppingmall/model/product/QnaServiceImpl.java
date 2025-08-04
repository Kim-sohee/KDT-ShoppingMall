package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Qna;
import shoppingmall.exception.QnAAdminUpdateException;
import shoppingmall.exception.QnASelectException;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public List<Qna> selectAll() {
		
		return qnaDAO.selectAll();
	}
	
	@Override
	public List<Qna> selectOrderBy() throws QnASelectException {
		return qnaDAO.selectAllOrderBy();
	}

	@Override
	public Qna select(int qna_id) {
		return qnaDAO.select(qna_id);
	}

	@Override
	public void insert(Qna qna) {
		qnaDAO.insert(qna);
	}

	@Override
	public void update(Qna qna) {
		qnaDAO.update(qna);
		
	}
	
	@Override
	public void updateFromAdmin(Qna qna) throws QnAAdminUpdateException {
		qnaDAO.updateFromAdmin(qna);
	}

	@Override
	public void delete(int qna_id) {
		qnaDAO.delete(qna_id);
	}

	@Override
	public int count(int product_id) {
		return qnaDAO.qnaCount(product_id);
	}
	
}
