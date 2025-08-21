package shoppingmall.exception;

public class ProductGetTotalCountException extends RuntimeException{
	public ProductGetTotalCountException(String msg) {
		super(msg);
	}
	
	public ProductGetTotalCountException(Throwable e) {
		super(e);
	}
	
	public ProductGetTotalCountException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
