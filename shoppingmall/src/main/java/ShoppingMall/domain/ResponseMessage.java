package shoppingmall.domain;

import lombok.Data;

@Data
public class ResponseMessage<T> {
	private boolean result = true;
	private T data;
	private String errorMessage;
}
