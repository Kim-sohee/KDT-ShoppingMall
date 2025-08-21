package shoppingmall.exception;

public class OrderDetailNotFoundException extends RuntimeException{
	public OrderDetailNotFoundException(String msg) {
		super(msg);
	}
	
	public OrderDetailNotFoundException(Throwable e) {
		super(e);
	}
	
	public OrderDetailNotFoundException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
