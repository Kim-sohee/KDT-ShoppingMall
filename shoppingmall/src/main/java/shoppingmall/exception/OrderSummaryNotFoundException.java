package shoppingmall.exception;

public class OrderSummaryNotFoundException extends RuntimeException{
	public OrderSummaryNotFoundException(String msg) {
		super(msg);
	}
	
	public OrderSummaryNotFoundException(Throwable e) {
		super(e);
	}
	
	public OrderSummaryNotFoundException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
