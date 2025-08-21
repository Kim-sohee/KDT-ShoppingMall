package shoppingmall.exception;

public class StatusNotFoundException extends RuntimeException {
	public StatusNotFoundException(String msg) {
		super(msg);
	}
	
	public StatusNotFoundException(Throwable e) {
		super(e);
	}
	
	public StatusNotFoundException(String msg, Throwable e) {
		super(msg, e);
	}
}
