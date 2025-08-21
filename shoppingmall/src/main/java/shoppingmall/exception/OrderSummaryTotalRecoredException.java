package shoppingmall.exception;

public class OrderSummaryTotalRecoredException extends RuntimeException{
	public OrderSummaryTotalRecoredException(String msg) {
		super(msg);
	}
	
	public OrderSummaryTotalRecoredException(Throwable e) {
		super(e);
	}
	
	public OrderSummaryTotalRecoredException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
