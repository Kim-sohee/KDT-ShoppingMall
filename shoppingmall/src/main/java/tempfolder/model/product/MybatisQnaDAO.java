package shoppingmall.model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Qna;
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
	public void delete(int qna_id) {
		sqlSessionTemplate.delete("Qna.delete",qna_id);
	}

	@Override
	public int qnaCount(int product_id) {
		int result = sqlSessionTemplate.selectOne("Qna.countQna", product_id);
		return result;
	}
	
}
