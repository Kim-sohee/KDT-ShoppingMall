<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!-- 날짜 선택 양식 시작 -->
<section class="date">
	<div class="date-container">
		<div class="date1">
			<a href="#">15일</a> | <a href="#">3개월</a> | <a href="#">1개월</a> | <a
				href="#">6개월</a> | <a href="#">12개월</a>
		</div>
		<form id="date_form">
			<div class="date2">
				<label for="start_date"></label>
				<input type="date" id="start_date" name="start_date" max="2025-12-31" min="2000-01-01" />
				
				<span>~</span> 
				
				<label for="end_date"></label>
				<input type="date" id="end_date" name="end_date" max="2025-12-31" min="2000-01-01" />
				<span></span>
				<button type="submit">조회</button>
			</div>
		</form>
	</div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(()=>{
	    // 기본 날짜 설정
	    // 오늘 날짜
	    const today = new Date();
	    const todayStr = today.toISOString().split('T')[0];
	    
	 	// 1개월 전 날짜
	    const prevMonth = new Date(today);
	    prevMonth.setMonth(today.getMonth() - 1);
	    const prevMonthStr = prevMonth.toISOString().split('T')[0];
		
	 	// input에 값 설정
	    $('#start_date').val("${startDate}");
	    $('#end_date').val("${endDate}");
    });
</script>

<!-- 날짜 선택 양식 끝 -->