package shoppingmall.model.product;

import java.util.List;
import java.util.Map;

import shoppingmall.domain.Review;

public interface ReviewDAO {
	public List<Review> selectByProductId(int product_id);
	public double AvgRating(int product_id);
	public int selectCountRating(int product_id);
	public Map<Integer, Integer> selectRatingDistribution(int product_id);
	
	public void setMemberIdNull(int member_id);
}
