package shoppingmall.exception;

public class QnAAdminUpdateException extends RuntimeException{
	public QnAAdminUpdateException(String msg) {
		super(msg);
	}
	
	public QnAAdminUpdateException(Throwable e) {
		super(e);
	}
	
	public QnAAdminUpdateException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
