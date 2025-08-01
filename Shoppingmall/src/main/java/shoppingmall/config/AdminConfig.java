package shoppingmall.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"shoppingmall.admin.advice","shoppingmall.admin.controller"})
public class AdminConfig extends WebMvcConfigurerAdapter {

	@Bean
	@Qualifier("baseUrl")
	public String getBaseUrl() {
		return "/shoppingmall";
	}
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		// pom.xml에 추가한 jackson-bind 라이브리의 객체 추가
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		MappingJackson2HttpMessageConverter conveter = new MappingJackson2HttpMessageConverter();
		conveter.setObjectMapper(objectMapper);
		converters.add(conveter);
	}
}
