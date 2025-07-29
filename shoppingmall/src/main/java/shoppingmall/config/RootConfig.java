package shoppingmall.config;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jndi.JndiTemplate;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author 박유신
 * @category Config
 */
//애플리케이션 Scope 수준에서 관리한 빈즈에 대한 설정 파일들..
//Ex... Mybatis...DB

@Configuration  
@EnableTransactionManagement
@ComponentScan(basePackages = {"ShoppingMall.domain","ShoppingMall.util"})
public class RootConfig {
	

	public DataSource dataSource() throws NamingException{
		JndiTemplate jndi=new JndiTemplate();
		return jndi.lookup("java:comp/env/jndi/mysql", DataSource.class);
	}
	
	/*--------------------------------------------------------------
	Mybatis 관련 
	--------------------------------------------------------------*/
	@Bean 
	@Primary
	public PlatformTransactionManager platformTransactionManager(SqlSessionFactory sqlSessionFactory) {
		return new DataSourceTransactionManager(sqlSessionFactory.getConfiguration().getEnvironment().getDataSource());
	}
	
	@Bean 
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("mall/mybatis/mybatis-config.xml")); //mybatis 설정파일 위치
		
		//SqlSessionFactoryBean 에게 사용할 DB를 알려줘야 함
		sqlSessionFactoryBean.setDataSource(dataSource());
		
		return sqlSessionFactoryBean.getObject();
	}

	@Bean 
	public SqlSessionTemplate sqlSessionTemplate() throws Exception{
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	

}







