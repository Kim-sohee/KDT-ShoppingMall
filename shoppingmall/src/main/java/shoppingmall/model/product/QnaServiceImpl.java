package shoppingmall.model.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Qna> selectAllOrderBy(int pageSize, int offset) throws QnASelectException {
		Map<String, Object> map = new HashMap<>();
		map.put("page_size", pageSize);
		map.put("offset", offset);
		return qnaDAO.selectAllOrderBy();
	}
	
	@Override
	public List<Qna> selectByMemberId(int memberId) {
		return qnaDAO.selectByMemberId(memberId);
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

	@Override
	public List<Qna> selectByProductId(int product_id) {
		return qnaDAO.selectByProductId(product_id);
	}
	
	@Override
	public int totalRecord() {
		return qnaDAO.totalRecord();
	}
	
}
