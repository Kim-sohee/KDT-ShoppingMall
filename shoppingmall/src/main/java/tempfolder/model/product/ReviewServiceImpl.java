package shoppingmall.model.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Review;
//현재 가지고 있는 DAO
// selectByProductId - product_id를 기반으로 product에 대한 정보를 가지고 옵니다.
// AvgRating - product_id를 기반으로 해당하는 리뷰에 대한 평점 평균값을 가지고 옵니다.
@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO reviewDAO;
	
	
	@Override
	public List<Review> selectByProductId(int product_id) {
		return reviewDAO.selectByProductId(product_id);
	}


	@Override
	public double AvgRating(int product_id) {
		return reviewDAO.AvgRating(product_id);
	}


	@Override
	public int CountReview(int product_id) {
		return reviewDAO.selectCountRating(product_id);
	}
	
	@Override
	public Map<Integer, Integer> getRatingDistribution(int product_id) {
	    return reviewDAO.selectRatingDistribution(product_id);
	}

}
