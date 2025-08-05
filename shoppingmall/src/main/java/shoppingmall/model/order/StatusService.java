package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.Status;

public interface StatusService {
	public List<Status> selectAll();
}
