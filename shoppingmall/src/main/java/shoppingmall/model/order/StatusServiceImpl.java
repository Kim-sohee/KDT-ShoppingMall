package shoppingmall.model.order;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shoppingmall.domain.Status;

@Service
public class StatusServiceImpl implements StatusService {
	
	@Autowired
	private StatusDAO statusDAO;
	
	public List<Status> selectAll() {
		return statusDAO.selectAll();
	}
}
