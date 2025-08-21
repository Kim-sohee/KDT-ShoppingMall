package shoppingmall.exception;

public class LoginFailedException extends RuntimeException{
	public LoginFailedException(String msg) {
		super(msg);
	}
	
	public LoginFailedException(Throwable e) {
		super(e);
	}
	
	public LoginFailedException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
