package shoppingmall.exception;

public class ReviewNullException extends RuntimeException{
	public ReviewNullException(String msg) {
		super(msg);
	}
	
	public ReviewNullException(Throwable e) {
		super(e);
	}
	
	public ReviewNullException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
