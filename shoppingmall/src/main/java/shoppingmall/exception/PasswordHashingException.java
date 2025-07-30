package shoppingmall.exception;

public class PasswordHashingException extends RuntimeException {
	public PasswordHashingException(String msg) {
		super(msg);
	}
	
	public PasswordHashingException(Throwable e) {
		super(e);
	}
	
	public PasswordHashingException(String msg, Throwable e) {
		super(msg, e);
	}
}
