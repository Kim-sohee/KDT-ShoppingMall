package shoppingmall.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * @author 박유신
 * @category Config
 */


//Admin 입장에서 보이는 각종 스프링 설정들을 담아놓았습니다.
// ViewResolver, Jackson , Multipart Resolver

@Configuration
@EnableWebMvc
@ComponentScan (basePackages = {"shoppingmall.admin.controller","shoppingmall.util"})
public class AdminConfig {
	//================= ViewResolver =================
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		
		//경로를 바꾸고 싶다면 이곳을 바꾸어주세요.
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		
		return null;
	}
	
	//================= Jackson =================
	/*
	 * 장바구니, 카트, 상품 결과 요청, 주문 요청 처리 등에서 jackson 사용
	 */
	@Bean
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		converters.add(new MappingJackson2HttpMessageConverter());
	}
	
	//================= Multipart Resolver ============
	//multi/form-data 형식 대신 사용
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setMaxUploadSize(10*1024*1024); //파일 용량 조절을 원하시면 여기를 조정해주세요. (N * 1024 *1024) .. (N)M 입니다.
		
		return resolver;
	}
}
