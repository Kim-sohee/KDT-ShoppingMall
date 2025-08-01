package shoppingmall.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

import shoppingmall.model.member.NaverApi20;

/**
 * @author 박유신
 * @category Config
 */


@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"shoppingmall.shop.controller","shoppingmall.util", "shoppingmall.shop.advice"}) //이후 로그인 체크 필요하다면 이곳에 추가해주세요.
@PropertySource("classpath:application-oauth.properties")
public class UserConfig {
	//네이버 id, secret, uri
	@Value("${naver.client-id}")
	private String naver_clientId;

	@Value("${naver.client-secret}")
	private String naver_clientSecret;
	
	@Value("${naver.redirect-uri}")
	private String naver_redirect_uri;
	
	//구글 id, secret, uri
	@Value("${google.client-id}")
	private String google_clientId;

	@Value("${google.client-secret}")
	private String google_clientSecret;
	
	@Value("${google.redirect-uri}")
	private String google_redirect_uri;
	
	
	
	//================= ViewResolver =================
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	//================= 로그인 서비스 전용 객체 등록 =================
	// 로그인 서비스 제공 할 플랫폼 : Naver, Google
	
	// 구글 로그인 관련 서비스 객체 등록
	@Bean
	public OAuth20Service googleAuthService() {
		ServiceBuilder builder = new ServiceBuilder(google_clientId);
		builder.apiSecret(google_clientSecret);
		builder.defaultScope("email profile openid");
		builder.callback(google_redirect_uri);
		return builder.build(GoogleApi20.instance());
	}
	
	// 네이버 로그인 관련 서비스 객체 등록
	@Bean
	public OAuth20Service naverAuthService() {
		//클라이언트 ID와 Secret,CallBack,Access range, Resource Ownre 정의
		ServiceBuilder builder = new ServiceBuilder(naver_clientId);
		builder.apiSecret(naver_clientSecret);
		builder.defaultScope("name email");
		builder.callback(naver_redirect_uri);
		return builder.build(NaverApi20.instance());
	}
}
