package shoppingmall.model.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Review;
import shoppingmall.exception.ReviewAvgNullException;
import shoppingmall.exception.ReviewNullException;
import shoppingmall.exception.ReviewUpdateException;

@Repository
public class MybatisReviewDAO implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//product_id에 해당하는 전페 리뷰 객체를 불러옵니다.
	@Override

	public List<Review> selectByProductId(int product_id) /*throws ReviewNullException*/{
		List list = sqlSessionTemplate.selectList("Review.selectByProductId",product_id);
		return list;
	}
	
	//특정 제품의 평균을 구해옵니다.
	@Override
	public double AvgRating(int product_id) {
	    Double rating = sqlSessionTemplate.selectOne("Review.selectAvgRating", product_id);
	    return rating != null ? rating : 0.0;
	}
	

	//특정 제품의 리뷰의 개수를 구해옵니다.
	@Override
	public int selectCountRating(int product_id) throws ReviewNullException {
		int count = sqlSessionTemplate.selectOne("Review.selectCountRating",product_id);
		if(count < 0 ) {
			throw new ReviewNullException("상품에 대한 리뷰 집계를 구해올 수 없습니다.");
		}
		return count;
	}
	
	//특정 제품의 리뷰 별점 별 개수를 가지고 옵니다.
	//5점 -1개
	//4점 - 1
	@Override
	public Map<Integer, Integer> selectRatingDistribution(int product_id) {
	    List<Map<String, Object>> list = sqlSessionTemplate.selectList("Review.selectRatingDistribution", product_id);

	    Map<Integer, Integer> resultMap = new HashMap<>();
	    for (Map<String, Object> row : list) {
	        int rating = ((Number) row.get("rating")).intValue();
	        int count = ((Number) row.get("count")).intValue();
	        resultMap.put(rating, count);
	    }
	    return resultMap;
	}
	
	@Override
	public void setMemberIdNull(int member_id) throws ReviewUpdateException {
		try {
			sqlSessionTemplate.update("Review.setReviewMemberIdNull", member_id);
		} catch (Exception e) {
			throw new ReviewUpdateException("리뷰 수정 실패");
		}
	}

}
