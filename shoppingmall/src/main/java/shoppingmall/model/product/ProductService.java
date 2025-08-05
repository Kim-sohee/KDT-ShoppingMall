package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Product;
import shoppingmall.domain.Theme;
import shoppingmall.domain.request.ProductDto;

public interface ProductService {
	public List selectAll();
	public Product select(int product_id);
	public List selectProductByFilter(Product product);
	public List selectProductSearchName(String product_name);
	public void regist(ProductDto productDto, String saveImagePath);
	public void update(ProductDto productDto, String saveImagePath);
	public int totalCount();
	public int totalCount(Theme theme);
	public List selectByPage(int pageSize, int currentPage);
	public List selectByThemeWithPage(int themeId, int pageSize, int currentPage);
	public void remove(Product product, String savePath);
}
