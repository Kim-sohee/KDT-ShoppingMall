<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 날짜 선택 양식 시작 -->
<section class="date">
	<div class="date-container">
		<div class="date1">
			<a href="#" data-days="15" class="date_format">15일</a> | 
			<a href="#" data-months="1" class="date_format">1개월</a> | 
			<a href="#" data-months="3" class="date_format">3개월</a> | 
			<a href="#" data-months="6" class="date_format">6개월</a> | 
			<a href="#" data-months="12" class="date_format">12개월</a>
		</div>
		<form id="date_form">
			<div class="date2">
				<label for="start_date"></label>
				<input type="date" id="start_date" name="start_date" max="2025-12-31" min="2000-01-01" value="${startDate}"/>
				
				<span>~</span> 
				
				<label for="end_date"></label>
				<input type="date" id="end_date" name="end_date" max="2025-12-31" min="2000-01-01" value="${endDate}"/>
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
		
	    //최근 15일, 1개월 등 조회기간 선택
	    $(".date_format").click(function(e) {
	        e.preventDefault();

	        console.log(e.currentTarget);
	        
	        const target = $(e.currentTarget);

	        const today = new Date();
	        let startDate = new Date(today);  // 기준은 오늘
	        
	        const daysAttr = target.data("days");
	        const monthsAttr = target.data("months");

	        const days = daysAttr !== undefined ? Number(daysAttr) : null;
	        const months = monthsAttr !== undefined ? Number(monthsAttr) : null;

	        if (!isNaN(days)) {
	            startDate.setDate(startDate.getDate() - days);
	        } else if (!isNaN(months)) {
	            startDate.setMonth(startDate.getMonth() - months);
	        } else {
	            console.warn("Invalid days or months value");
	            return;  // 더 진행하지 않음
	        }
	        if (!isNaN(startDate.getTime())) {
	            const yyyy = startDate.getFullYear();
	            const mm = String(startDate.getMonth() + 1).padStart(2, '0');
	            const dd = String(startDate.getDate()).padStart(2, '0');

	            const formatted = `${yyyy}-${mm}-${dd}`;
	            console.log("formatted date:", formatted);

	            $("#start_date").val(formatted);
	        } else {
	            console.error("startDate is invalid:", startDate);
	        }
	    });
    });
</script>

<!-- 날짜 선택 양식 끝 -->