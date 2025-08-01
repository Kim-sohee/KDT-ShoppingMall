package shoppingmall.model.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Product;
import shoppingmall.domain.Theme;
import shoppingmall.exception.ProductException;
import shoppingmall.exception.ProductGetTotalCountException;
import shoppingmall.exception.ProductInsertException;
import shoppingmall.exception.ProductUpdateException;

@Repository
public class MybatisProductDAO implements ProductDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Product.selectAll");
	}

	@Override
	public Product select(int product_id) {
		return sqlSessionTemplate.selectOne("Product.select", product_id);
	}

	@Override
	public List selectProductByFilter(Product product) {
		return sqlSessionTemplate.selectList("Product.selectProductByFilter", product);
	}

	@Override
	public void insert(Product product) throws ProductInsertException {
		try {
			int result = sqlSessionTemplate.insert("Product.insert", product);
			if (result < 1) {
				throw new ProductInsertException("상품 등록 실패");
			}
		} catch (Exception e) {
			throw new ProductInsertException("상품 등록 실패", e);
		}
	}
	
	@Override
	public void update(Product product) throws ProductUpdateException {
		try {
			int result = sqlSessionTemplate.update("Product.update", product);
			if(result < 1) {
				throw new ProductUpdateException("상품 업데이트 실패");
			}
		} catch (Exception e) {
			throw new ProductUpdateException(e);
		}
	}

	@Override
	public int totalCount() throws ProductGetTotalCountException {
		int result = 0;
		try {
			result = sqlSessionTemplate.selectOne("Product.totalCount");
		} catch (Exception e) {
			throw new ProductGetTotalCountException(e);
		}
		return result;
	}

	@Override
	public int totalCount(Theme theme) {
		int result = 0;
		try {
			result = sqlSessionTemplate.selectOne("Product.totalCountByThemeId", theme);
		} catch (Exception e) {
			throw new ProductGetTotalCountException(e);
		}
		return result;
	}

	@Override
	public List selectByPage(int pageSize, int offset) throws ProductException {
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("page_size", pageSize);
			map.put("offset", offset);
			return sqlSessionTemplate.selectList("Product.selectByPage", map);
		} catch (Exception e) {
			throw new ProductException(e);
		}
	}

	@Override
	public List selectByThemeWithPage(int theme_id, int pageSize, int offset) throws ProductException {
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("theme_id", theme_id);
			map.put("page_size", pageSize);
			map.put("offset", offset);
			return sqlSessionTemplate.selectList("Product.selectByThemeWithPage", map);
		} catch (Exception e) {
			throw new ProductException(e);
		}
	}
	
	@Override
	public List selectProductSearchName(String product_name) {
		return sqlSessionTemplate.selectList("Product.selectProductSearchName", product_name);
	}
	
}
