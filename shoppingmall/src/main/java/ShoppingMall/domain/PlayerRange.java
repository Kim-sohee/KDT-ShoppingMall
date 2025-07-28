package ShoppingMall.domain;

import lombok.Data;

//인원수에 관한 모델
@Data
public class PlayerRange {
	private int player_range_id;
	private int player_min;
	private int player_max;
}
