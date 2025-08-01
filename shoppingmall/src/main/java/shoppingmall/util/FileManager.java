package shoppingmall.util;

import java.io.File;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.Product;
import shoppingmall.domain.ProductImage;
import shoppingmall.domain.request.ProductDto;
import shoppingmall.exception.FileUploadException;

//이 객체의 존재가 없다면, 컨트롤러가 '업로드' 라는 모델 영역의 업무를 수행하게 되므로
//업로드 수행을 전담할 수 있는 모델 객체를 정의한다 .
//이 객체는, DAO도 아니며, Service도 아니며, Controller 도 아니므로 , 스프링의 기본 컴포넌트
//이외의 컴포넌트로 등록하면 된다. 
@Component // ComponentScan의 대상이 될 수 있다. 따라서 자동으로 인스턴스 올라온다 
@Slf4j
public class FileManager{
	
	public void save(ProductDto productRegist, String savePath) throws FileUploadException {
		File directory = new File(savePath, "p_" + productRegist.getProduct_id());

		// 디렉토리가 존재하지 않으면 생성
		if (!directory.exists()) {
			directory.mkdirs();
		}
		try {
			for (MultipartFile multipartFile : productRegist.getFiles()) {
				String filename = multipartFile.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".") + 1, filename.length());
				log.debug("확장자 " + ext);

				// 파일명을 유일성을 보장하기 위한 방법은 상당히 많다
				// 해시값, 현재날짜, db pk 값
				long time = System.currentTimeMillis();
				String newName = time + "." + ext;
				ProductImage productImage = new ProductImage();
				productImage.setProductImageId(productRegist.getProduct_id());
				productImage.setFileName(newName);
				productRegist.getProductImages().add(productImage);
				File file = new File(directory.getAbsolutePath(), newName);// 저장될 파일

				multipartFile.transferTo(file);
				log.debug(file.getAbsolutePath());// 업로드된 결과 디렉토리 확인차
				Thread.sleep(10);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new FileUploadException("파일저장 실패", e);
		} // 애플리케이션과 생명을 같이함
	}
	
	public void remove(Product product, String savePath) {
		File directory = new File(savePath, "p_"+product.getProduct_id());
		if(!directory.exists() || !directory.isDirectory()) {
			return;
		}
		
		if(directory.listFiles() == null) {
			return;
		}
		
		for(File file : directory.listFiles()) {
			boolean deleted = file.delete();
			log.debug("{} 파일 삭제 결과 {}", file.getName(), deleted);
		}
		
		boolean deleted = directory.delete();
		log.debug("폴더 삭제 결과 {}", deleted);
		if(deleted == false) {
			log.warn("디렉토리 삭제 실패 : {}",directory.getAbsolutePath());
		}
	}
}





