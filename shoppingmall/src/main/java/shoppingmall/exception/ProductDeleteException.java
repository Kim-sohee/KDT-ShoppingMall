package shoppingmall.exception;

public class ProductDeleteException extends RuntimeException{
	public ProductDeleteException(String msg) {
		super(msg);
	}
	
	public ProductDeleteException(Throwable e) {
		super(e);
	}
	
	public ProductDeleteException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
