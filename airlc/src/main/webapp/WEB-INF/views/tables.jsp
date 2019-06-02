<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Air L&C - Tables</title>
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
<script src="resources/templates/vendor/datatables/jquery.dataTables.js"></script>
<script src="resources/templates/vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script src="resources/templates/js/sb-admin.min.js"></script>
<!-- Demo scripts for this page-->
<script src="resources/templates/js/demo/datatables-demo.js"></script>

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
   var areaApi =  new Array();
   <c:forEach items="${dustList3}" var="dustList3">
       ugm3Api.push("${dustList3.ugm3}");
       dustDateApi.push("${dustList3.date}");
       areaApi.push("${dustList3.area}");
   </c:forEach>
   
   var tabledataApi = new Array();
   for (var i = 0; i < dustDateApi.length;i++) {
      tabledataApi[i] = [areaApi[i], dustDateApi[i], ugm3Api[i]];
   }
   
   // 외부 정보 데이터 테이블 만들기
   $('#dataTableOut').dataTable().fnAddData(tabledataApi);
   
   
   

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

            <a class="dropdown-item" href="#" data-toggle="modal"
               data-target="#logoutModal">Logout</a>
         </div></li>
   </ul>

   </nav>

   <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
         <li class="nav-item"><a class="nav-link" href="home"> <i
               class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
         </a></li>
         <li class="nav-item"><a class="nav-link" href="charts"> <i
               class="fas fa-fw fa-chart-area"></i> <span>Chart</span></a></li>
         <li class="nav-item active"><a class="nav-link" href="tables">
               <i class="fas fa-fw fa-table"></i> <span>Information table</span>
         </a></li>
      </ul>

      <div id="content-wrapper">

         <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
               <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
               <li class="breadcrumb-item active">Tables</li>
            </ol>

            <!-- DataTables Example -->
            <div class="card mb-3">
               <div class="card-header">
                  <i class="fas fa-table"></i> Inside Information
                  <span class="float-right"> 
                  <form action="/airlc/refresh_table" method="get">
                     <button id="refresh" type="submit" class="btn btn-labeled btn-info">
                             <i class="fas fa-sync-alt"></i>
                          </button>
                          </form>
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
               <div id="time" class="time card-footer small text-muted"></div>
            </div>
            
            
            <div class="card mb-3">
               <div class="card-header">
                  <i class="fas fa-table"></i> Outside Information
               </div>
               <div class="card-body">
                  <div class="table-responsive">
                     <table class="table table-bordered" id="dataTableOut" width="100%"
                        cellspacing="0">
                        <thead>
                           <tr>
                              <th>Position</th>
                              <th>Date</th>
                              <th>Micro Dust</th>
                           </tr>
                        </thead>
                        <tfoot>
                           <tr>
                              <th>Position</th>
                              <th>Date</th>
                              <th>Micro Dust</th>
                           </tr>
                        </tfoot>
                        <tbody id = "dataTableOutTBody">
                        </tbody>
                     </table>
                  </div>
               </div>
               <div id="time" class="time card-footer small text-muted"></div>
            </div>

            <p class="small text-center text-muted my-5">
               <em>More table examples coming soon...</em>
            </p>

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