package shoppingmall.domain;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

//상품에 관한 모델
@Data
public class Product {
	private int product_id;
	private String product_name;
	private int price;
	private int discount_rate;
	private int product_quantity = 0;
	private String description;
	private String regdate;
	private int play_time;
	private List<ProductImage> productImages = new ArrayList<>();
	private List<Review> reviews;
	
	private Theme theme;
	private PlayerRange playerRange;
	private AgeRange ageRange;
	private Difficulty difficulty;
	
	//상품의 할인가 계산(DB컬럼은 아님)
	@Transient
	public int getSalePrice() {
		return price - (price * discount_rate/100);
	}
}
