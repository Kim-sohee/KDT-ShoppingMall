package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DifficultyServiceImp implements DifficultyService{
	@Autowired
	DifficultyDAO difficultyDAO;
	
	@Override
	public List selectAll() {
		return difficultyDAO.selectAll();
	}
	
}
