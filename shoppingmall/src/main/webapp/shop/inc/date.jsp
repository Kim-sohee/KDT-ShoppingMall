<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!-- 날짜 선택 양식 -->
<a href="#">15일</a>  |  <a href="#">3개월</a>  |  <a href="#">1개월</a>  |  <a href="#">6개월</a>  |  <a href="#">12개월</a> 
<label for="start_date"></label>
<input type="date"
       id="date"
       max="2025-12-31"
       min="2000-01-01"
       value="2025-07-21">
~
<label for="end_date"></label>
<input type="date"
       id="date"
       max="2025-12-31"
       min="2000-01-01"
       value="2025-07-31">
       
<button>조회</button>
<!-- /날짜 선택 양식 -->