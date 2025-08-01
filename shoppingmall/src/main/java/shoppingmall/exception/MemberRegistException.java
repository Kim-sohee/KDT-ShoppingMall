package shoppingmall.exception;

public class MemberRegistException extends RuntimeException {
	public MemberRegistException(String msg) {
		super(msg);
	}
	
	public MemberRegistException(Throwable e) {
		super(e);
	}
	
	public MemberRegistException(String msg, Throwable e) {
		super(msg, e);
	}
}
