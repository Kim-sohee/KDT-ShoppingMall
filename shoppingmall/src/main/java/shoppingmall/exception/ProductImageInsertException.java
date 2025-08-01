package shoppingmall.exception;

public class ProductImageInsertException extends RuntimeException{
	public ProductImageInsertException(String msg) {
		super(msg);
	}
	
	public ProductImageInsertException(Throwable e) {
		super(e);
	}
	
	public ProductImageInsertException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
