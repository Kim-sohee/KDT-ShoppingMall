package shoppingmall.model.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ThemeServiceImp implements ThemeService{
	@Autowired
	ThemeService themeService;
	
	@Override
	public List selectAll() {
		return themeService.selectAll();
	}
	
}
