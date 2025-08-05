<%@page import="shoppingmall.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% String navMenu = (String)request.getAttribute("navMenu"); %>
<% Member loginAdmin = (Member) session.getAttribute("loginAdmin"); %>
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<%= contextPath %>/admin/main" class="brand-link">
      <img src="/img/sinsegae_games.png" alt="Sinse Games Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">SinseBoardGame</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex flex-row justify-content-between pr-2 pl-2">
        <div class="info">
          <a href="#" class="d-block"><%= String.valueOf(loginAdmin.getMember_name()) %> &nbsp; 님 안녕하세요.</a>
        </div>
        <i id="logout-button" class="bi bi-door-open" style="font-size: 25px; color: white; cursor: pointer;"></i>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
         
          <!-- 주문관리 메뉴 시작-->
          <li class="nav-item <%= (navMenu != null && navMenu.startsWith("order")) ? "menu-is-opening menu-open" : "" %>">
            <a href="#" class="nav-link <%= (navMenu != null && navMenu.startsWith("order")) ? "active" : "" %>">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
               주문관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=contextPath %>/admin/order/history/listpage?status_id=1" id="orderHistory" class="nav-link <%= "orderHistory".equals(navMenu) ? "active" : "" %>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>주문</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="<%=contextPath %>/admin/order/inquiry/listpage?status_id=7" id="orderInquiry" class="nav-link <%= "orderInquiry".equals(navMenu) ? "active" : "" %>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>교환</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=contextPath %>/admin/order/return/listpage?status_id=6" id="orderReturn" class="nav-link <%= "orderReturn".equals(navMenu) ? "active" : "" %>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>반품</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- 주문관리 메뉴 끝-->
      
          <!-- 상품관리 메뉴 시작-->
          <li class="nav-item">
            <a href="<%=contextPath%>/admin/product/listpage" class="nav-link <%= (navMenu != null && navMenu.startsWith("productList")) ? "active" : "" %>">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                상품관리
              </p>
            </a>
          </li>
          <!-- 상품관리 메뉴 끝-->
      
          <!--회원관리 메뉴 시작-->
          <li class="nav-item <%= (navMenu != null && navMenu.startsWith("member")) ? "menu-is-opening menu-open" : "" %>">
            <a href="#" class="nav-link <%= (navMenu != null && navMenu.startsWith("member")) ? "active" : "" %>">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                회원관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%= contextPath%>/admin/member/listpage" class="nav-link <%= (navMenu != null && navMenu.startsWith("memberList")) ? "active" : "" %>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원목록</p>
                </a>
              </li>
             <!--  <li class="nav-item">
                <a href="/static/admin/index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>메일발송</p>
                </a>
              </li> -->
            </ul>
          </li>
          <!--회원관리 메뉴 끝-->
      
          <!--고객센터 메뉴 시작-->
          <li class="nav-item <%= (navMenu != null && navMenu.startsWith("cs")) ? "menu-is-opening menu-open" : "" %>">
            <a href="#" class="nav-link <%= (navMenu != null && navMenu.startsWith("cs")) ? "active" : "" %>">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
               고객센터
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%= contextPath%>/admin/cs/qna/listpage" class="nav-link <%= (navMenu != null && navMenu.startsWith("csQnaList")) ? "active" : "" %>">
                  <i class="far fa-circle nav-icon"></i>
                  <p>QnA</p>
                </a>
              </li>
            </ul>
          </li>
          <!--고객센터 메뉴 끝-->   
        
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>