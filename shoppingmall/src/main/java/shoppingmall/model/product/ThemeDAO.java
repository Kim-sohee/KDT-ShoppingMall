package shoppingmall.model.product;

import java.util.List;

import shoppingmall.domain.Theme;

public interface ThemeDAO {
	public List<Theme> selectAll();
	public Theme selectThemeByName(String theme_name);
}
