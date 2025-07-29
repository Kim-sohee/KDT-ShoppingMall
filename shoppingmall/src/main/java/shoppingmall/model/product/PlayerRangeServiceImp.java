package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlayerRangeServiceImp implements PlayerRangeService{
	@Autowired
	PlayerRangeService playerRangeService;
	
	@Override
	public List selectAll() {
		return playerRangeService.selectAll();
	}
	
}
