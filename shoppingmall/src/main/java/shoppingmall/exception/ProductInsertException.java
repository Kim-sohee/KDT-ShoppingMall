package shoppingmall.exception;

public class ProductInsertException extends RuntimeException{
	public ProductInsertException(String msg) {
		super(msg);
	}
	
	public ProductInsertException(Throwable e) {
		super(e);
	}
	
	public ProductInsertException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
