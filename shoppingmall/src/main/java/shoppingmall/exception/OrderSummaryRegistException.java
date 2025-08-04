package shoppingmall.exception;

public class OrderSummaryRegistException extends RuntimeException {
	public OrderSummaryRegistException(String msg) {
		super(msg);
	}
	
	public OrderSummaryRegistException(Throwable e) {
		super(e);
	}
	
	public OrderSummaryRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
