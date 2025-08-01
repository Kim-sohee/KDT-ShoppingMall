package shoppingmall.util;

import java.text.DecimalFormat;

public class PriceFormat {
	//금액을 콤마로 구분하기 위한 포맷 지정
	//ex) 56000 -> 56,000 로 변경
	public static String productPriceFormat(int amount) {
		DecimalFormat formater = new DecimalFormat("###,###");
		return formater.format(amount);
	}
}
