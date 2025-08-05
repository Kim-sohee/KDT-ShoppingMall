package shoppingmall.exception;

public class StatusUpdateException extends RuntimeException{
	public StatusUpdateException(String msg) {
		super(msg);
	}
	
	public StatusUpdateException(Throwable e) {
		super(e);
	}
	
	public StatusUpdateException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
