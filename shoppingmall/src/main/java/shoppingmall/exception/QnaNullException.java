package shoppingmall.exception;

public class QnaNullException extends RuntimeException{
	public QnaNullException(String msg) {
		super(msg);
	}
	
	public QnaNullException(Throwable e) {
		super(e);
	}
	
	public QnaNullException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
