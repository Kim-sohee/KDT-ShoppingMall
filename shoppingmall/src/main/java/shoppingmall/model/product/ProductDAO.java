package shoppingmall.model.product;
import java.util.List;

import shoppingmall.domain.Product;
import shoppingmall.domain.Theme;

public interface ProductDAO {
	public List selectAll();	//모두 조회
	public Product select(int product_id);	//한 건 조회
	public List selectProductByFilter(Product product);	//필터링 한 상품 모두 조회
	public List selectProductSearchName(String product_name);	//이름으로 검색한 상품 모두 조회
	public void insert(Product product); //상품등록
	public void update(Product product); //	상품 업데이트
	public int totalCount(); //총 상품갯수
	public int totalCount(Theme theme); //테마 기준으로 총 상품갯수
	public List selectByPage(int pageSize, int offset); //페이지 별로 상품 가져오기
	public List selectByThemeWithPage(int theme_id, int pageSize, int offset); // 카테고리&페이지 기준으로 상품가져오기
	public List<Product> selectTopProductByNames(List<String> names);	//베스트 셀러 이름으로 상품 정보 가져오기
}