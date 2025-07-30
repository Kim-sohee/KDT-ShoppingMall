package shoppingmall.exception;

public class ThemeException extends RuntimeException{
	public ThemeException(String msg) {
		super(msg);
	}
	
	public ThemeException(Throwable e) {
		super(e);
	}
	
	public ThemeException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
