package shoppingmall.shop.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.exception.CartException;
import shoppingmall.exception.DeliveryDeleteException;
import shoppingmall.exception.DeliveryRegistException;
import shoppingmall.exception.DeliveryUpdateException;
import shoppingmall.exception.FileUploadException;
import shoppingmall.exception.MemberNotFoundException;
import shoppingmall.exception.MemberRegistException;
import shoppingmall.exception.MemberRemoveException;
import shoppingmall.exception.MemberUpdateException;
import shoppingmall.exception.OrderDetailNotFoundException;
import shoppingmall.exception.OrderDetailRegistException;
import shoppingmall.exception.OrderSummaryDeleteException;
import shoppingmall.exception.OrderSummaryNotFoundException;
import shoppingmall.exception.OrderSummaryRegistException;
import shoppingmall.exception.PasswordHashingException;
import shoppingmall.exception.ProductException;
import shoppingmall.exception.ProductGetTotalCountException;
import shoppingmall.exception.ProductImageDeleteException;
import shoppingmall.exception.ProductImageInsertException;
import shoppingmall.exception.ProductInsertException;
import shoppingmall.exception.ProductUpdateException;
import shoppingmall.exception.QnaNullException;
import shoppingmall.exception.ReviewAvgNullException;
import shoppingmall.exception.ReviewNullException;
import shoppingmall.exception.StatusNotFoundException;
import shoppingmall.exception.ThemeException;

@Slf4j
@ControllerAdvice(basePackages = {"shoppingmall.shop.controller"})
public class GlobalExceptionAdvice {
	//암호화 오류
    @ExceptionHandler(PasswordHashingException.class)
    public ModelAndView handleHashingEncrypt(PasswordHashingException e) {
        log.error("암호화 오류", e);
        return getErrorMav(e.getMessage());
    }

    //회원 관련 오류
    @ExceptionHandler({MemberNotFoundException.class, MemberRegistException.class, MemberUpdateException.class, MemberRemoveException.class})
    public ModelAndView handleMember(Exception e) {
        log.error("회원 처리 오류", e);
        return getErrorMav(e.getMessage());
    }
    
    //배송지 관련 오류
    @ExceptionHandler({DeliveryRegistException.class, DeliveryUpdateException.class, DeliveryDeleteException.class})
    public ModelAndView handleDelivery(Exception e) {
    	log.error("배송지 처리 오류", e);
    	return getErrorMav(e.getMessage());
    }

    //주문 관련 예외
    @ExceptionHandler({OrderSummaryNotFoundException.class, OrderSummaryRegistException.class ,OrderSummaryDeleteException.class, 
    										OrderDetailNotFoundException.class, OrderDetailRegistException.class, StatusNotFoundException.class})
    public ModelAndView handleOrder(Exception e) {
        log.error("주문 처리 오류", e);
        return getErrorMav(e.getMessage());
    }
    
    //장바구니 관련 예외
    @ExceptionHandler({CartException.class}) 
    public ModelAndView handleCart(Exception e){
    	log.error("장바구니 처리 오류", e);
    	return getErrorMav("장바구니 정보를 처리하는 중 오류가 발생했습니다.");
    }
    
    //장바구니 관련 예외
    @ExceptionHandler({ProductException.class, ProductGetTotalCountException.class, ProductImageInsertException.class, ProductImageDeleteException.class, 
    										ProductInsertException.class, ProductUpdateException.class, FileUploadException.class}) 
    public ModelAndView handleProduct(Exception e){
    	log.error("상품 처리 오류", e);
    	return getErrorMav("상품 정보를 처리하는 중 오류가 발생했습니다.");
    }

    //카테고리 관련 예외
    @ExceptionHandler({ThemeException.class})
    public ModelAndView handleTheme(Exception e) {
    	log.error("카테고리 처리 오류", e);
    	return getErrorMav("카테고리 정보를 처리하는 중 오류가 발생했습니다.");
    }
    
    //리뷰 관련 예외
    @ExceptionHandler({ReviewAvgNullException.class, ReviewNullException.class})
    public ModelAndView handleReview(Exception e) {
    	log.error("리뷰 처리 오류", e);
    	return getErrorMav("리뷰 정보를 처리하는 중 오류가 발생했습니다.");
    }
    
    //Qna 관련 예외
    @ExceptionHandler({QnaNullException.class})
    public ModelAndView handleQna(Exception e) {
    	log.error("Qna 처리 오류", e);
    	return getErrorMav("Qna 정보를 처리하는 중 오류가 발생했습니다.");
    }
    
    
    //기타 예외 (null, IllegalArg 등)
    @ExceptionHandler(Exception.class)
    public ModelAndView handleGeneral(Exception e) {
        log.error("알 수 없는 예외 발생", e);
        return getErrorMav("요청을 처리하는 중 오류가 발생했습니다.");
    }
    
    //에러 페이지 요청 처리
    private ModelAndView getErrorMav(String msg) {
        ModelAndView mav = new ModelAndView("/shop/error/result");
        mav.addObject("msg", msg);
        return mav;
    }
}
