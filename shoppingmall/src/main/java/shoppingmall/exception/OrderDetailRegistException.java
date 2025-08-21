package shoppingmall.exception;

public class OrderDetailRegistException extends RuntimeException{
	public OrderDetailRegistException(String msg) {
		super(msg);
	}
	
	public OrderDetailRegistException(Throwable e) {
		super(e);
	}
	
	public OrderDetailRegistException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
