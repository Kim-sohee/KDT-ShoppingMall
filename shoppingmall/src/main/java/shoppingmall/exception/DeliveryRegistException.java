package shoppingmall.exception;

public class DeliveryRegistException extends RuntimeException{
	public DeliveryRegistException(String msg) {
		super(msg);
	}
	
	public DeliveryRegistException(Throwable e) {
		super(e);
	}
	
	public DeliveryRegistException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
