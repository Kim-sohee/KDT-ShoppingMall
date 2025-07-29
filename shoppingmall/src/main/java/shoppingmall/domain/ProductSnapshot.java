package shoppingmall.domain;

import lombok.Data;

//상품 스냅샷 관한 모델
@Data
public class ProductSnapshot {
	private int product_id;
	private String product_name;
	private int price;
	private int discount_rate;
	private int product_quantity;
	private String description;
	private String regdate;
	private int play_time;
	private String image;
	
	private Theme theme;
	private PlayerRange playerRange;
	private AgeRange ageRange;
	private Difficulty difficulty;
}
