package shoppingmall.exception;

public class MemberUpdateException extends RuntimeException {
	public MemberUpdateException(String msg) {
		super(msg);
	}
	
	public MemberUpdateException(Throwable e) {
		super(e);
	}
	
	public MemberUpdateException(String msg, Throwable e) {
		super(msg, e);
	}
}
