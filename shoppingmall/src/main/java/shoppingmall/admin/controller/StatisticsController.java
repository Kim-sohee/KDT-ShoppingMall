package shoppingmall.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import shoppingmall.domain.ResponseMessage;
import shoppingmall.domain.Statistics;
import shoppingmall.model.statistics.StatisticsService;

@Slf4j
@Controller
public class StatisticsController {
	
	@Autowired
	private StatisticsService statisticsService;
	@Autowired
	private ObjectMapper objectMapper;
	
	@GetMapping("/statistics/theme/pastyear")
	@ResponseBody
	public ResponseEntity<ResponseMessage<String>> getStatisticsByThemeFromPastYear(){
		List<Statistics> statistics = statisticsService.getStatisticsByThemeFromPastYear();
		ResponseMessage<String> responseMessage = new ResponseMessage<>();
		try {
			String json = objectMapper.writeValueAsString(statistics);
			log.debug("변환 데이터 : {}",json);
			responseMessage.setResult(true);
			responseMessage.setData(json);
			return ResponseEntity.ok(responseMessage);
		} catch (Exception e) {
			e.printStackTrace();
			responseMessage.setResult(false);
			responseMessage.setErrorMessage(e.getMessage());
			return ResponseEntity.ok(responseMessage);
		}
	}
	
	@GetMapping("/statistics/sales/pastyear")
	@ResponseBody
	public ResponseEntity<ResponseMessage<String>> getStatisticsBySalesFromPastYear(){
		List<Statistics> statistics = statisticsService.getStatisticsBySalesFromPastYear();
		ResponseMessage<String> responseMessage = new ResponseMessage<>();
		try {
			String json = objectMapper.writeValueAsString(statistics);
			log.debug("변환 데이터 : {}",json);
			responseMessage.setResult(true);
			responseMessage.setData(json);
			return ResponseEntity.ok(responseMessage);
		} catch (Exception e) {
			e.printStackTrace();
			responseMessage.setResult(false);
			responseMessage.setErrorMessage(e.getMessage());
			return ResponseEntity.ok(responseMessage);
		}
	}
	
	@GetMapping("/statistics/sales/totalamount")
	@ResponseBody
	public ResponseEntity<ResponseMessage<Integer>> getTotalSaleAmount(){
		int amount = statisticsService.totalSaleAmount();
		ResponseMessage<Integer> responseMessage = new ResponseMessage<>();
		try {
			responseMessage.setResult(true);
			responseMessage.setData(amount);
			return ResponseEntity.ok(responseMessage);
		} catch (Exception e) {
			e.printStackTrace();
			responseMessage.setResult(false);
			responseMessage.setErrorMessage(e.getMessage());
			return ResponseEntity.ok(responseMessage);
		}
	}
}
