<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html lang="ko">
  <head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${contextPath}/resources/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${contextPath}/resources/img/favicon.png">
  <title>
    Solar BEMS 전력 생산량 관리
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,600,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="${contextPath}/resources/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${contextPath}/resources/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="${contextPath}/resources/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
  <!-- Nepcha Analytics (nepcha.com) -->
  <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
  <!-- <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script> -->
</head>

<body class="g-sidenav-show bg-gray-100">
  <!-- sidenav  Fetch by assets/js/fetch_template.js -->
  <aside id="sidenav-main" class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark">
  	<jsp:include page="../common/sidenav.jsp" />
  </aside>

  <main class="main-content border-radius-lg ">
    <!-- topnav Fetch by assets/js/fetch_template.js -->        
    <nav id="topnav" class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" data-scroll="true">
    	<jsp:include page="../common/topnav.jsp" />
    </nav>

    <!-- 전력제어 전환 Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title font-weight-normal" id="exampleModalLabel">전력제어 전환</h5>
            <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            정말 배터리전기 제어방식으로 전환 하시겠습니까?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn bg-gradient-primary">전환하기</button>
            <button type="button" class="btn bg-gradient-dark" data-bs-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>
    <!-- End Modal -->
    
    <!-- Start container -->
    <div class="container-fluid py-2">
    
      <div class="row mb-2">
        <div class="col-lg-7 position-relative z-index-2">
          <div class="card card-plain mb-1">
            <div class="card-body p-0">
              <h3 class="font-weight-bolder">전력 생산량 관리</h3>
            </div>
          </div> <!-- End card  -->
        </div>
      </div><!-- End row -->
      
      <!--  Start -->
      <div class="row">
        <div class="col-lg-5">

          <div class="card">
          
         		<div class="card-header d-flex justify-content-center pt-4 pb-0 px-5 ">
              <a class="d-block blur-shadow-image">
                <img src="${contextPath}/resources/img/solar_panel.jpeg" alt="solar_panel" class="img-fluid shadow border-radius-lg">
              </a>
              <div class="colored-shadow" style="background-image: url(&quot;https://demos.creative-tim.com/test/material-dashboard-pro/assets/img/products/product-1-min.jpg&quot;);"></div>

            </div><!-- End card-header -->

            <div class="card-body px-4 pb-1">
              <div class="d-flex justify-content-center align-items-center">
                <h4 class="text-dark">전력제어 상태 : 일반전기</h4>
              </div>
              <hr class="dark horizontal my-1">
              <div class="row">
                <!-- 배터리 잔량 표시 -->
                <div class="col-md-6 d-flex justify-content-center align-items-center mb-3 ">
                  
                  <!-- prgoress-bar 클래스에 bg-gradient-success => bg-gradient-warning => bg-gradient-danger -->
                  <!--  prgoress-bar 스타일 width 값 조정 -->
                  <div class="progress-wrapper">
                    <div class="progress-info">
                      <div class="progress-percentage">
                        <span class="text-sm font-weight-normal">태양광 배터리 잔량 : 90%</span>
                      </div>
                    </div>
                    <div class="progress" style="height: 20px;">
                      <div class="progress-bar bg-gradient-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%; height: 20px;"></div>
                    </div>
                  </div>

                  <!-- <div class="progress-wrapper">
                    <div class="progress-info">
                      <div class="progress-percentage">
                        <span class="text-sm font-weight-normal">태양광 배터리 잔량 : 60%</span>
                      </div>
                    </div>
                    <div class="progress" style="height: 20px;">
                      <div class="progress-bar bg-gradient-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%; height: 20px;"></div>
                    </div>
                  </div> -->

                  <!-- <div class="progress-wrapper">
                    <div class="progress-info">
                      <div class="progress-percentage">
                        <span class="text-sm font-weight-normal">태양광 배터리 잔량 : 20%</span>
                      </div>
                    </div>
                    <div class="progress" style="height: 20px;">
                      <div class="progress-bar bg-gradient-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 20%; height: 20px;"></div>
                    </div>
                  </div> -->

                </div><!-- col end -->

                <div class="col-md-6 d-flex justify-content-center align-items-center ps-4">
                  <form>
                    <h6>전력제어 상태 전환</h6>
                    <!-- 전기 사용상태 토글 -->
                    <div class="togglebutton form-check form-switch">
                      <!-- disabled -->
                      <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" checked>
                      <label class="form-check-label" for="flexSwitchCheckDefault">배터리전기 / 일반전기</label>
                    </div>
                  </form>
                </div>

              </div><!-- end row -->

              <hr class="dark horizontal my-1">

	              <div class="card-footer d-flex justify-content-center align-items-center pb-0 pt-3">
	                  <button type="button" class="btn bg-gradient-primary w-70" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-param="1">
	                    전력제어 전환
                </div>
              </div><!-- card-body -->

            </div><!-- card -->
          </div>
        </div> <!-- row -->
      </div><!-- End container-fluid py-2 -->


		<jsp:include page="../common/footer.jsp" />
  </main>

<!--   Core JS Files   -->
<script src="${contextPath}/resources/js/core/popper.min.js" ></script>
<script src="${contextPath}/resources/js/core/bootstrap.min.js" ></script>
<script src="${contextPath}/resources/js/plugins/perfect-scrollbar.min.js" ></script>
<script src="${contextPath}/resources/js/plugins/smooth-scrollbar.min.js" ></script>

<script>
  var win = navigator.platform.indexOf('Win') > -1;
  if (win && document.querySelector('#sidenav-scrollbar')) {
    var options = {
      damping: '0.5'
    }
    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
  }
</script>

  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${contextPath}/resources/js/material-dashboard.min.js?v=3.1.0"></script>
  
  <!-- Solar Files  -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  
  </body>
</html>