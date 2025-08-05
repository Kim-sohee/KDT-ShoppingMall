package shoppingmall.model.product;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Qna;
import shoppingmall.exception.QnAAdminUpdateException;
import shoppingmall.exception.QnASelectException;
import shoppingmall.exception.QnaNullException;

@Repository
public class MybatisQnaDAO implements QnaDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Qna> selectAll() throws QnaNullException {
		List result = sqlSessionTemplate.selectList("Qna.selectAll");
		if(result.size() < 1) {
			throw new QnaNullException("QNA가 비어있습니다.");
		}
		return result;
	}
	
	@Override
	public List<Qna> selectAllOrderBy() throws QnASelectException {
		try {
			List<Qna> result = sqlSessionTemplate.selectList("Qna.selectAllOrderBy");
			if(result == null) {
				result = new ArrayList<>();
			}
			return result;
		} catch (Exception e) {
			throw new QnASelectException(e);
		}
	}
	
	@Override
	public List<Qna> selectByMemberId(int member_id) throws QnASelectException {
		try {
			return sqlSessionTemplate.selectList("Qna.selectQnaByMemberId", member_id);
		} catch (Exception e) {
			throw new QnASelectException(e);
		}
	}

	@Override
	public Qna select(int qna_id) throws QnaNullException{
		Qna result = sqlSessionTemplate.selectOne("Qna.select",qna_id);
		if (result == null ) {
			throw new QnaNullException("QNA 선택 불가");
		}
		return result;
	}

	@Override
	public void insert(Qna qna)  throws QnaNullException{
		int result = sqlSessionTemplate.insert("Qna.insert",qna);
		if (result <1 ) {
			throw new QnaNullException("QNA 선택 불가");
		}
		
	}

	@Override
	public void update(Qna qna) throws QnaNullException{
		int reuslt = sqlSessionTemplate.update("Qna.update",qna);
		
		if (reuslt <1 ) {
			throw new QnaNullException("QNA 선택 불가");
		}
	}
	
	@Override
	public void updateFromAdmin(Qna qna) throws QnAAdminUpdateException {
		try {
			int result = sqlSessionTemplate.update("Qna.updateFromAdmin", qna);
			if(result < 1) {
				throw new QnAAdminUpdateException("QnA Update 실패");
			}
		} catch (Exception e) {
			throw new QnAAdminUpdateException(e);
		}
	}

	@Override
	public void delete(int qna_id) {
		sqlSessionTemplate.delete("Qna.delete",qna_id);
	}

	@Override
	public int qnaCount(int product_id) {
		int result = sqlSessionTemplate.selectOne("Qna.countQna", product_id);
		return result;
	}

	@Override
	public List<Qna> selectByProductId(int product_id) {
		List<Qna> result = sqlSessionTemplate.selectList("Qna.selectByProductId",product_id);
		return result;
	}
	
	@Override
	public int totalRecord() {
		return sqlSessionTemplate.selectOne("Qna.totalRecord");
	}
	
}
