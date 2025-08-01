package shoppingmall.domain.request;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import shoppingmall.domain.AgeRange;
import shoppingmall.domain.Difficulty;
import shoppingmall.domain.PlayerRange;
import shoppingmall.domain.Product;
import shoppingmall.domain.ProductImage;
import shoppingmall.domain.Theme;

@Data
public class ProductDto {
	private Integer product_id;
	private String product_name;
	private Integer price;
	private Integer discount_rate;
	private Integer product_quantity;
	private String description;
	private Integer play_time;
	private String regdate;
	private Theme theme;
	private PlayerRange playerRange;
	private AgeRange ageRange;
	private Difficulty difficulty;
	private List<MultipartFile> files = new ArrayList<>();
	private List<ProductImage> productImages = new ArrayList<>();
	
	public Product toProduct() {
		Product product = new Product();
		if(product_id != null) {
			product.setProduct_id(product_id);
		}
		product.setProduct_name(product_name);
		product.setPrice(price);
		product.setDiscount_rate(discount_rate);
		product.setProduct_quantity(product_quantity);
		product.setDescription(description);
		product.setPlay_time(play_time);
		product.setRegdate(regdate);
		product.setTheme(theme);
		product.setPlayerRange(playerRange);
		product.setAgeRange(ageRange);
		product.setDifficulty(difficulty);
		product.setProductImages(productImages);
		return product;
	}
}
