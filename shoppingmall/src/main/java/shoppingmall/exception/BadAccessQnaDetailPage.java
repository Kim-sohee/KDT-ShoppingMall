package shoppingmall.exception;

public class BadAccessQnaDetailPage extends RuntimeException{
	public BadAccessQnaDetailPage(String msg) {
		super(msg);
	}
	
	public BadAccessQnaDetailPage(Throwable e) {
		super(e);
	}
	
	public BadAccessQnaDetailPage(String msg, Throwable e) {
		super(msg, e);
	}
	
}
