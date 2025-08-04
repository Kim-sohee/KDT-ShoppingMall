package shoppingmall.exception;

public class DeliveryDeleteException extends RuntimeException{
	public DeliveryDeleteException(String msg) {
		super(msg);
	}
	
	public DeliveryDeleteException(Throwable e) {
		super(e);
	}
	
	public DeliveryDeleteException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
