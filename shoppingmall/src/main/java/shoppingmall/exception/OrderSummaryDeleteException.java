package shoppingmall.exception;

public class OrderSummaryDeleteException extends RuntimeException {
	public OrderSummaryDeleteException(String msg) {
		super(msg);
	}
	
	public OrderSummaryDeleteException(Throwable e) {
		super(e);
	}
	
	public OrderSummaryDeleteException(String msg, Throwable e) {
		super(msg, e);
	}
}
