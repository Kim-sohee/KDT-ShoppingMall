package shoppingmall.exception;

public class QnaUpdateException extends RuntimeException{
	public QnaUpdateException(String msg) {
		super(msg);
	}
	
	public QnaUpdateException(Throwable e) {
		super(e);
	}
	
	public QnaUpdateException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
