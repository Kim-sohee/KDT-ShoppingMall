package shoppingmall.exception;

public class ProductException extends RuntimeException{
	public ProductException(String msg) {
		super(msg);
	}
	
	public ProductException(Throwable e) {
		super(e);
	}
	
	public ProductException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
