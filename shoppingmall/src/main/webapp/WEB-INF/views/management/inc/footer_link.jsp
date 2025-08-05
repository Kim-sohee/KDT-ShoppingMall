<%@ page contentType="text/html; charset=UTF-8"%>
<!-- jQuery -->
<script src="/static/admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/static/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Bootstrap 4 -->
<script src="/static/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/static/admin/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="/static/admin/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="/static/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/static/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/static/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/static/admin/plugins/moment/moment.min.js"></script>
<script src="/static/admin/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/static/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/static/admin/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/static/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/admin/dist/js/adminlte.js"></script>
<!-- SweetAlert2 -->
<script src="/static/admin/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="/static/admin/plugins/toastr/toastr.min.js"></script>

<script type="text/javascript">
	$(()=>{
		$('#logout-button').click(()=>{
			if(confirm('정말 로그아웃 하시겠습니까?')){
				$.ajax({
					url: "/admin/logout",
					type: "post",
					success:(result, status, xhr) => {
						if(result.result) {
						    // 히스토리 스택 완전 정리
						    history.pushState(null, null, '/admin/loginpage');
						    window.addEventListener('popstate', function(event) {
						        history.pushState(null, null, '/admin/loginpage');
						    });
						    
						    // 캐시 방지
						    window.location.replace('/admin/loginpage');
						}
					}
				})
			}
		})
	})
</script>




