package shoppingmall.model.product;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Product;
import shoppingmall.domain.ProductImage;
import shoppingmall.domain.Theme;
import shoppingmall.domain.request.ProductDto;
import shoppingmall.exception.FileUploadException;
import shoppingmall.exception.ProductException;
import shoppingmall.exception.ProductImageInsertException;
import shoppingmall.exception.ProductInsertException;
import shoppingmall.util.FileManager;

@Slf4j
@Service
public class ProductServiceImp implements ProductService{
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductImageDAO productImageDAO;
	@Autowired
	private FileManager fileManager;

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


	@Override
	@Transactional
	public void regist(ProductDto productDto, String saveImagePath) throws ProductInsertException, ProductImageInsertException, FileUploadException {
		Product product = productDto.toProduct();
		productDAO.insert(product);
		productDto.setProduct_id(product.getProduct_id());

		if(productDto.getFiles() != null) {
			fileManager.save(productDto, saveImagePath);
		}

		for(ProductImage productImage : product.getProductImages()) {
			productImage.setProduct(product);
			productImageDAO.insert(productImage);
		}
	}

	@Override
	@Transactional
	public void update(ProductDto productDto, String saveImagePath) throws ProductInsertException, ProductImageInsertException, FileUploadException {
		Product product = productDto.toProduct();
		productDAO.update(product);

		fileManager.remove(product, saveImagePath);
		productImageDAO.deletByProductId(product.getProduct_id());

		if(productDto.getFiles() != null) {
			fileManager.save(productDto, saveImagePath);
		}

		for(ProductImage productImage : product.getProductImages()) {
			productImage.setProduct(product);
			productImageDAO.insert(productImage);
		}
	}

	@Override
	public int totalCount() {
		return productDAO.totalCount();
	}

	@Override
	public int totalCount(Theme theme) {
		return productDAO.totalCount(theme);
	}

	@Override
	public List selectByPage(int pageSize, int currentPage) throws ProductException {
		int offset = (currentPage - 1) * 10;
		return productDAO.selectByPage(pageSize, offset);
	}

	@Override
	public List selectByThemeWithPage(int themeId, int pageSize, int currentPage) {
		int offset = (currentPage - 1) * 10;
		return productDAO.selectByThemeWithPage(themeId, pageSize, offset);
	}
}
