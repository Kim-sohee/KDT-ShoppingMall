<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!-- 날짜 선택 양식 시작 -->
<section class="date">
	<div class="date-container">
		<div class="date1">
			<a href="#">15일</a> | <a href="#">3개월</a> | <a href="#">1개월</a> | <a
				href="#">6개월</a> | <a href="#">12개월</a>
		</div>
		<div class="date2">
			<label for="start_date"></label>
			<input type="date" id="start_date" max="2025-12-31" min="2000-01-01" />
			
			<span>~</span> 
			
			<label for="end_date"></label>
			<input type="date" id="end_date" max="2025-12-31" min="2000-01-01" />
			<span></span>
			<button>조회</button>
		</div>
	</div>
</section>

<script>
  // 오늘 날짜
  const today = new Date();
  const todayStr = today.toISOString().split('T')[0];

  // 1개월 전 날짜
  const prevMonth = new Date(today);
  prevMonth.setMonth(today.getMonth() - 1);
  const prevMonthStr = prevMonth.toISOString().split('T')[0];

  // input에 값 설정
  document.getElementById("start_date").value = prevMonthStr;
  document.getElementById("end_date").value = todayStr;
</script>

<!-- 날짜 선택 양식 끝 -->