package shoppingmall.exception;

public class MemberDeleteException extends RuntimeException {
	public MemberDeleteException(String msg) {
		super(msg);
	}
	
	public MemberDeleteException(Throwable e) {
		super(e);
	}
	
	public MemberDeleteException(String msg, Throwable e) {
		super(msg, e);
	}
}
