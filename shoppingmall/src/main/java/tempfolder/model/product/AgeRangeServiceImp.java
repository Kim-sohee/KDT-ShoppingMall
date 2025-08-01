package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AgeRangeServiceImp implements AgeRangeService{
	@Autowired
	AgeRangeDAO ageRangeDAO;
	
	@Override
	public List selectAll() {
		return ageRangeDAO.selectAll();
	}
}
