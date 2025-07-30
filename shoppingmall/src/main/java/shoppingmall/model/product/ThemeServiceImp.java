package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ThemeServiceImp implements ThemeService{
	@Autowired
	ThemeDAO themeDAO;
	
	@Override
	public List selectAll() {
		return themeDAO.selectAll();
	}
	
}
