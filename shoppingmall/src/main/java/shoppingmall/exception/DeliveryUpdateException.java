package shoppingmall.exception;

public class DeliveryUpdateException extends RuntimeException{
	public DeliveryUpdateException(String msg) {
		super(msg);
	}
	
	public DeliveryUpdateException(Throwable e) {
		super(e);
	}
	
	public DeliveryUpdateException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
