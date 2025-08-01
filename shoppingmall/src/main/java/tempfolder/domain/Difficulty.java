package shoppingmall.domain;

import lombok.Data;

//게임 난이도에 대한 모델
@Data
public class Difficulty {
	private int difficulty_id;
	private String game_level;
}
