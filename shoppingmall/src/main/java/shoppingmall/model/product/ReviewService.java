package shoppingmall.model.product;

import java.util.List;
import java.util.Map;

import shoppingmall.domain.Review;

public interface ReviewService {
	public List<Review> selectByProductId(int product_id);
	public double AvgRating(int product_id);
	public int CountReview(int product_id);
	Map<Integer, Integer> getRatingDistribution(int product_id);

}
