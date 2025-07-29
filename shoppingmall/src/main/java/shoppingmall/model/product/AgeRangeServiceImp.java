package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AgeRangeServiceImp implements AgeRangeService{
	@Autowired
	AgeRangeService ageRangeService;
	
	@Override
	public List selectAll() {
		return ageRangeService.selectAll();
	}
	
}
