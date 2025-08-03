package shoppingmall.exception;

public class ProductUpdateException extends RuntimeException{
	public ProductUpdateException(String msg) {
		super(msg);
	}
	
	public ProductUpdateException(Throwable e) {
		super(e);
	}
	
	public ProductUpdateException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
