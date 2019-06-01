<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Air L&C - Dashboard</title>
<script src="resources/jquery-3.3.1.min.js" type="text/javascript"></script>
<link href="resources/bootstrap4-toggle/bootstrap4-toggle.css" rel="stylesheet">
<script src="resources/bootstrap4-toggle/bootstrap4-toggle.js"></script>
<!-- Custom fonts for this template-->
<link href="resources/templates/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="resources/templates/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/templates/css/sb-admin.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="resources/templates/vendor/jquery/jquery.min.js"></script>
<script src="resources/templates/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="resources/templates/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="resources/templates/vendor/chart.js/Chart.min.js"></script>
<script src="resources/templates/vendor/datatables/jquery.dataTables.js"></script>
<script src="resources/templates/vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script src="resources/templates/js/sb-admin.min.js"></script>
<!-- Demo scripts for this page-->
<script src="resources/templates/js/demo/datatables-demo.js"></script>
<script src="resources/templates/js/demo/chart-area-demo.js"></script>

<style>
.btn-group-xs>.btn, .btn-xs {
   padding: .35rem .5rem .25rem .5rem;
   font-size: .875rem;
   line-height: .5;
   border-radius: .2rem;
}
.switch {
  position: relative;
  display: inline-block;
  width: 45px;
  height: 20px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 12px;
  width: 12px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

</style>

<script type="text/javascript">
   $(document).ready(function() {
      var d = new Date();
       var currentDate = d.getFullYear() + "." + ( d.getMonth() + 1 ) + "." + d.getDate();
       var currentTime = d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
       $('.time').text("Update " + currentDate + " "  + currentTime);
      
      var ugm3 = new Array();
      var dustDate = new Array();
      <c:forEach items="${dustList}" var="dustList">
         ugm3.push("${dustList.ugm3}");
         dustDate.push("${dustList.date}");
      </c:forEach>
      
      var temp = new Array();
       <c:forEach items = "${tempList}" var = "tempList">
          temp.push("${tempList.temp}");
      </c:forEach>
      
      var hum = new Array();
       <c:forEach items = "${humList}" var = "humList">
            hum.push("${humList.hum}");
      </c:forEach>
      
      var tabledata = new Array();
      for (var i = 0; i < dustDate.length;i++) {
         tabledata[i] = [dustDate[i], temp[i], hum[i], ugm3[i]];
      }
      
      // 내부 정보 데이터 테이블 만들기
      $('#dataTableIn').dataTable().fnAddData(tabledata);
      
      var ugm3Api = new Array();
      var dustDateApi = new Array();
      <c:forEach items="${dustList}" var="dustList">
          ugm3Api.push("${dustList.ugm3}");
          dustDateApi.push("${dustList.date}");
      </c:forEach>
      
      var tabledataApi = new Array();
      for (var i = 0; i < dustDate.length;i++) {
         tabledataApi[i] = [dustDateApi[i], ugm3Api[i]];
      }
      
      // 외부 정보 데이터 테이블 만들기
      $('#dataTableOut').dataTable().fnAddData(tabledataApi);
      
      // 실내 정보 테이블 갱신
      $('#refreshIn').click(function(){
         var ugm3 = new Array();
          var dustDate = new Array();
         <c:forEach items="${dustList}" var="dustList">
            ugm3.push("${dustList.ugm3}");
            dustDate.push("${dustList.date}");
         </c:forEach>
         
         var temp = new Array();
          <c:forEach items = "${tempList}" var = "tempList">
             temp.push("${tempList.temp}");
         </c:forEach>
         
         var hum = new Array();
          <c:forEach items = "${humList}" var = "humList">
               hum.push("${humList.hum}");
         </c:forEach>
         
         var tabledata = new Array();
         for (var i = 0; i < dustDate.length;i++) {
            tabledata[i] = [dustDate[i], temp[i], hum[i], ugm3[i]];
         }
         $('#dataTableIn').dataTable().fnClearTable(); 
         $('#dataTableIn').dataTable().fnAddData(tabledata);
         
         var d = new Date();
           var currentDate = d.getFullYear() + "." + ( d.getMonth() + 1 ) + "." + d.getDate();
           var currentTime = d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
           $('#timeIn').text("Update " + currentDate + " "  + currentTime);
      });
      
      // 실외 정보 테이블 갱신
      $('#refreshOut').click(function(){
         var ugm3Api = new Array();
          var dustDateApi = new Array();
          <c:forEach items="${dustList}" var="dustList">
              ugm3Api.push("${dustList.ugm3}");
              dustDateApi.push("${dustList.date}");
          </c:forEach>
          
          var tabledataApi = new Array();
          for (var i = 0; i < dustDate.length;i++) {
             tabledataApi[i] = [dustDateApi[i], ugm3Api[i]];
          }
          
          $('#dataTableOut').dataTable().fnClearTable(); 
          $('#dataTableOut').dataTable().fnAddData(tabledataApi);
          
          var d = new Date();
            var currentDate = d.getFullYear() + "." + ( d.getMonth() + 1 ) + "." + d.getDate();
            var currentTime = d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
            $('#timeOut').text("Update " + currentDate + " "  + currentTime);
      });
      
    
      $('#tg').change(function() {
			var act = {
				"act" : $(this).prop('checked')
			};
			$('#console-event').html('Toggle: ' + $(this).prop('checked'))
			console.log("act", act);
			$.ajax({

				type : "get",
				url : "/airlc/home_controll",
				data : act,
			})
		});
   });
</script>
</head>

<body id="page-top">


   <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

   <a class="navbar-brand mr-1" href="home">Air L&C</a>

   <button class="btn btn-link btn-sm text-white order-1 order-sm-0"
      id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
   </button>

   <!-- Navbar Search -->
   <form
      class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
   </form>

   <!-- Navbar -->
   <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow"><a
         class="nav-link dropdown-toggle" href="#" id="userDropdown"
         role="button" data-toggle="dropdown" aria-haspopup="true"
         aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
      </a>
         <div class="dropdown-menu dropdown-menu-right"
            aria-labelledby="userDropdown">
            <!-- <a class="dropdown-item" href="#">Settings</a> <a
               class="dropdown-item" href="#">Activity Log</a>
            <div class="dropdown-divider"></div> -->
            <a class="dropdown-item" href="#" data-toggle="modal"
               data-target="#logoutModal">Logout</a>
         </div></li>
   </ul>

   </nav>

   <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
         <li class="nav-item active"><a class="nav-link" href="home">
               <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
         </a></li>
         <!-- <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
            role="button" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Pages</span>
         </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
               <h6 class="dropdown-header">Login Screens:</h6>
               <a class="dropdown-item" href="login">Login</a> <a
                  class="dropdown-item" href="register">Register</a> <a
                  class="dropdown-item" href="forgot-password">Forgot Password</a>
               <div class="dropdown-divider"></div>
               <h6 class="dropdown-header">Other Pages:</h6>
               <a class="dropdown-item" href="404">404 Page</a> <a
                  class="dropdown-item" href="blank">Blank Page</a>
            </div></li> -->
         <li class="nav-item">
            <!-- <a id="chart" class="nav-link"> --> <a class="nav-link"
            href="charts"> <i class="fas fa-fw fa-chart-area"></i> <span>Chart</span></a>
         </li>
         <li class="nav-item"><a class="nav-link" href="tables"> <i
               class="fas fa-fw fa-table"></i> <span>Information table</span></a></li>
      </ul>

      <div id="content-wrapper">

         <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
               <li class="breadcrumb-item active">Overview</li>
            </ol>

            <!-- Icon Cards-->
            <div class="row">
               <div class="col-xl-4 col-sm-6 mb-3">
                  <div class="card bg-primary o-hidden h-100">
                     <div class="card-body">
                        <div class="card-body-icon">
                           <i class="fas fa-fw fa-thermometer-half"></i>
                        </div>
                        <div class="mr-5">
                           <c:forEach items="${tempList2}" var="Latesttemp">${Latesttemp.temp} (℃)
                           </c:forEach>
                        </div>
                     </div>
                     <div class="card-footer clearfix z-1">
                        <span class="float-left"><i
                           class="fas fa-fw fa-thermometer-half"></i>Temperature</span>
                     </div>
                  </div>
               </div>

               <div class="col-xl-4 col-sm-6 mb-3">
                  <div class="card bg-warning o-hidden h-100">
                     <div class="card-body">
                        <div class="card-body-icon">
                           <i class="fas fa-fw fa-thermometer-half"></i>
                        </div>
                        <div class="mr-5">
                           <c:forEach items="${humList2}" var="Latesthum">${Latesthum.hum} (% RH)
                           </c:forEach>
                        </div>
                     </div>
                     <div class="card-footer clearfix z-1">
                        <span class="float-left"><i
                           class="fas fa-fw fa-thermometer-half"></i>Humidity</span>
                     </div>
                  </div>
               </div>

               <div class="col-xl-4 col-sm-6 mb-3">
                  <div class="card bg-success o-hidden h-100">
                     <div class="card-body">
                        <div class="card-body-icon">
                           <i class="fas fa-fw fa-plus-square"></i>
                        </div>
                        <div class="mr-5">
                           <c:forEach items="${dustList2}" var="Latestdust">${Latestdust.ugm3} (㎍/㎥)
                           </c:forEach> 
                        </div>
                     </div>
                     <div class="card-footer clearfix z-1">
                        <span class="float-left"><i
                           class="fas fa-fw fa-plus-square"></i>${Gpio_service.equals("HIGH")}</span> 
                           <span class="float-right">
                           <label class="switch">
                       <input id="tg" type="checkbox" 
                                 <c:if test = "${Gpio_service.equals('Off')}">checked="checked" </c:if>
                       >
                       <span class="slider round" ></span>
                     </label> 
                           <%-- <input id="tg" type="checkbox" 
                           <c:choose>
                           <c:when test = "${msg.equals('Off')}">checked </c:when>
                           <c:when test = "${msg.equals('On')}"> unchecked </c:when>
                           </c:choose>
                           data-toggle="toggle" data-size="xs" data-onstyle="info"> --%>
                        </span>
                     </div>
                  </div>
               </div>

            </div>

            <!-- DataTables Example -->
            <div class="card mb-3">
               <div class="card-header">
                  <i class="fas fa-table"></i> Inside Information
                  <span class="float-right"> 
                     <button id="refreshIn" type="button" class="btn btn-labeled btn-info">
                             <i class="fas fa-sync-alt"></i>
                          </button>
                     </span>
               </div>
               <div class="card-body">
                  <div class="table-responsive">
                     <table class="table table-bordered" id="dataTableIn" width="100%"
                        cellspacing="0">
                        <thead>
                           <tr>
                              <th>Date</th>                           
                              <th>Temperature</th>
                              <th>Humidity</th>
                              <th>Micro Dust</th>
                           </tr>
                        </thead>
                        <tfoot>
                           <tr>
                              <th>Date</th>
                              <th>Temperature</th>
                              <th>Humidity</th>
                              <th>Micro Dust</th>
                           </tr>
                        </tfoot>
                        <tbody id = "dataTableInTBody">
                        </tbody>
                     </table>
                  </div>
               </div>
               <div id="timeIn"class="time card-footer small text-muted"></div>
            </div>

            <div class="card mb-3">
               <div class="card-header">
                  <i class="fas fa-table"></i> Outside Information
                  <span class="float-right"> 
                     <button id="refreshOut" type="button" class="btn btn-labeled btn-info">
                             <i class="fas fa-sync-alt"></i>
                          </button>
                     </span>
               </div>
               <div class="card-body">
                  <div class="table-responsive">
                     <table class="table table-bordered" id="dataTableOut" width="100%"
                        cellspacing="0">
                        <thead>
                           <tr>
                              <!-- <th>Position</th> -->
                              <th>Date</th>
                              <th>Micro Dust</th>
                           </tr>
                        </thead>
                        <tfoot>
                           <tr>
                              <!-- <th>Position</th> -->
                              <th>Date</th>
                              <th>Micro Dust</th>
                           </tr>
                        </tfoot>
                        <tbody id = "dataTableOutTBody">
                        </tbody>
                     </table>
                  </div>
               </div>
               <div id="timeOut" class="time card-footer small text-muted"></div>
            </div>

         </div>
         <!-- /.container-fluid -->

         <!-- Sticky Footer -->
         <footer class="sticky-footer">
         <div class="container my-auto">
            <div class="copyright text-center my-auto">
               <span>Copyright © Your Website 2019</span>
            </div>
         </div>
         </footer>

      </div>
      <!-- /.content-wrapper -->

   </div>
   <!-- /#wrapper -->

   <!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> <i
      class="fas fa-angle-up"></i>
   </a>

   <!-- Logout Modal-->
   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
               <button class="close" type="button" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">×</span>
               </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready
               to end your current session.</div>
            <div class="modal-footer">
               <button class="btn btn-secondary" type="button"
                  data-dismiss="modal">Cancel</button>
               <a class="btn btn-primary" href="login">Logout</a>
            </div>
         </div>
      </div>
   </div>

</body>
</html>