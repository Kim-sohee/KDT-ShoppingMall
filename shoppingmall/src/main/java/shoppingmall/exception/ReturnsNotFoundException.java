package shoppingmall.exception;

public class ReturnsNotFoundException extends RuntimeException{
	public ReturnsNotFoundException(String msg) {
		super(msg);
	}
	
	public ReturnsNotFoundException(Throwable e) {
		super(e);
	}
	
	public ReturnsNotFoundException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
