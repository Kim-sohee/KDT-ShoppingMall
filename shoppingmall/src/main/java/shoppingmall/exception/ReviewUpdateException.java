package shoppingmall.exception;

public class ReviewUpdateException extends RuntimeException{
	public ReviewUpdateException(String msg) {
		super(msg);
	}
	
	public ReviewUpdateException(Throwable e) {
		super(e);
	}
	
	public ReviewUpdateException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
