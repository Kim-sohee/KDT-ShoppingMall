package shoppingmall.exception;

public class FileUploadException extends RuntimeException{
	public FileUploadException(String msg) {
		super(msg);
	}
	
	public FileUploadException(Throwable e) {
		super(e);
	}
	
	public FileUploadException(String msg, Throwable e) {
		super(msg, e);
	}
	
}
