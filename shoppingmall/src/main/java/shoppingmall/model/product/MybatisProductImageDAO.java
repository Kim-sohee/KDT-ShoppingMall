package shoppingmall.model.product;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.ProductImage;
import shoppingmall.exception.ProductImageDeleteException;
import shoppingmall.exception.ProductImageInsertException;

@Repository
public class MybatisProductImageDAO implements ProductImageDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insert(ProductImage productImage) throws ProductImageInsertException {
		try {
			int result = sqlSessionTemplate.insert("ProductImage.insert", productImage);		
			if(result < 1) {
				throw new ProductImageInsertException("이미지 등록 실패"+ productImage.getFileName());
			}
		} catch (Exception e) {
			throw new ProductImageInsertException(e);
		}
	}

	@Override
	public void deletByProductId(int product_id) throws ProductImageDeleteException {
		try {
			int result = sqlSessionTemplate.delete("ProductImage.deleteByProductId", product_id);
		} catch (Exception e) {
			throw new ProductImageDeleteException(e);
		}
	}
}

