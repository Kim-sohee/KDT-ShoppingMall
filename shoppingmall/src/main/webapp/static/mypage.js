function applyDateFilter() {
    const start = document.querySelector('input[name="start_date"]').value;
    const end = document.querySelector('input[name="end_date"]').value;

    const params = new URLSearchParams(window.location.search);
    params.set("start_date", start);
    params.set("end_date", end);
    params.set("page", pageParam); // 원래 페이지 유지

    // 주소로 이동
    location.href = `/shop/mypage/list?` + params.toString();
  }
  
// 버튼 클릭시 폼 제출
document.querySelector('#date_form button').addEventListener('click', (e) => {
  e.preventDefault(); // 버튼의 submit 막기
  applyDateFilter();
});