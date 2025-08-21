package shoppingmall.model.order;

import java.util.List;

import shoppingmall.domain.Status;

public interface StatusDAO {
	public List<Status> selectAll();
}
