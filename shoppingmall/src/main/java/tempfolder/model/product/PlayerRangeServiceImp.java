package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlayerRangeServiceImp implements PlayerRangeService{
	@Autowired
	PlayerRangeDAO playerRangeDAO;
	
	@Override
	public List selectAll() {
		return playerRangeDAO.selectAll();
	}
	
}
