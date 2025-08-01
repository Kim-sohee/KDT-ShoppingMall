package shoppingmall.exception;

public class ReviewAvgNullException extends RuntimeException{
	public ReviewAvgNullException(String msg) {
		super(msg);
	}
	
	public ReviewAvgNullException(Throwable e) {
		super(e);
	}
	
	public ReviewAvgNullException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
