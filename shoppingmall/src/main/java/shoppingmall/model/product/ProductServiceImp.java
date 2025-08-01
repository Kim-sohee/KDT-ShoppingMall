package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Product;

@Service
public class ProductServiceImp implements ProductService{
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List selectAll() {
		return productDAO.selectAll();
	}

	@Override
	public Product select(int product_id) {
		return productDAO.select(product_id);
	}

	@Override
	public List selectProductByFilter(Product product) {
		return productDAO.selectProductByFilter(product);
	}
	
	@Override
	public List selectProductSearchName(String product_name) {
		return productDAO.selectProductSearchName(product_name);
	}
	
}
