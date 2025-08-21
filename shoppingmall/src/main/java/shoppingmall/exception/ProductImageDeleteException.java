package shoppingmall.exception;

public class ProductImageDeleteException extends RuntimeException{
	public ProductImageDeleteException(String msg) {
		super(msg);
	}
	
	public ProductImageDeleteException(Throwable e) {
		super(e);
	}
	
	public ProductImageDeleteException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
