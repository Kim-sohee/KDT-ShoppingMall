package shoppingmall.exception;

public class QnASelectException extends RuntimeException{
	public QnASelectException(String msg) {
		super(msg);
	}
	
	public QnASelectException(Throwable e) {
		super(e);
	}
	
	public QnASelectException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
