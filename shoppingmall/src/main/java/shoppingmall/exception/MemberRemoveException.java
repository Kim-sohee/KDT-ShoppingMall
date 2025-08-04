package shoppingmall.exception;

public class MemberRemoveException extends RuntimeException {
	public MemberRemoveException(String msg) {
		super(msg);
	}
	
	public MemberRemoveException(Throwable e) {
		super(e);
	}
	
	public MemberRemoveException(String msg, Throwable e) {
		super(msg, e);
	}
}
