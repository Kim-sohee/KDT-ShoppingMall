package shoppingmall.model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import shoppingmall.domain.Theme;

@Repository("MybatisThemeDAO")
public class MybatisThemeDAO implements ThemeDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Theme> selectAll() {
		return sqlSessionTemplate.selectList("Theme.selectAll");
	}
	
	@Override
	public Theme selectThemeByName(String theme_name) {
		return sqlSessionTemplate.selectOne("Theme.selectThemeByName", theme_name);
	}

}
