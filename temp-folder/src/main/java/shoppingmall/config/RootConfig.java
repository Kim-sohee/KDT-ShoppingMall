package shoppingmall.config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jndi.JndiTemplate;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
@PropertySource("classpath:application-mail.properties")
@ComponentScan(basePackages = {"shoppingmall.model","shoppingmall.util"})
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
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("shoppingmall/mybatis/mybatis-config.xml")); //mybatis 설정파일 위치
		
		//SqlSessionFactoryBean 에게 사용할 DB를 알려줘야 함
		sqlSessionFactoryBean.setDataSource(dataSource());
		
		return sqlSessionFactoryBean.getObject();
	}

	@Bean 
	public SqlSessionTemplate sqlSessionTemplate() throws Exception{
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	

	/*--------------------------------------------------------------
	이메일 전송 관련 
	--------------------------------------------------------------*/
	@Value("${spring.mail.host}")
	private String mailHost;
	
	@Value("${spring.mail.port}")
	private int mailPort;
	
	@Value("${spring.mail.username}")
	private String username;
	
	@Value("${spring.mail.password}")
	private String password;
	
	@Value("${spring.mail.properties.mail.transport.protocol}")
	private String protocol;
	
	@Value("${spring.mail.properties.mail.smtp.auth}")
	private String auth;
	
	@Value("${spring.mail.properties.mail.smtp.starttls.enable}")
	private String starttlsEnable;
	
	@Bean
	public JavaMailSender setComponent() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		
		mailSender.setHost(mailHost);
		mailSender.setPort(mailPort);
		mailSender.setUsername(username);
		mailSender.setPassword(password);
		mailSender.setJavaMailProperties(getMailProperties());
		mailSender.setDefaultEncoding("UTF-8");
		return mailSender;
	}
	
	private Properties getMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport.protocol", protocol);
		properties.setProperty("mail.smtp.auth", auth);
		properties.setProperty("mail.smtp.starttls.enable", starttlsEnable);
		return properties;
	}
}






