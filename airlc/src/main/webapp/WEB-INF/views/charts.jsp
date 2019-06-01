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
  
<title>Air L&C - Charts</title>
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
<!-- Custom scripts for all pages-->
<script src="resources/templates/js/sb-admin.min.js"></script>
<!-- Demo scripts for this page-->
<script src="resources/templates/js/demo/chart-area-demo.js"></script>
<script src="resources/templates/js/demo/chart-bar-demo.js"></script>
<script src="resources/templates/js/demo/chart-pie-demo.js"></script>

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
	//$.ajaxSetup({ cache: false });
	
	$(document).ready(function() {
		
	    var ugm3 = new Array();
	    var dustDate = new Array();
	   
	    <c:forEach items = "${dustList}" var = "dustList">
			ugm3.push("${dustList.ugm3}");
			dustDate.push("${dustList.date}");
		</c:forEach>
		console.log("ugm3 = ", ugm3);
		console.log("dustDate = ", dustDate); 
		
		var temp = new Array();
	    var tempDate = new Array();
	   
	    <c:forEach items = "${tempList}" var = "tempList">
	    	temp.push("${tempList.temp}");
	    	tempDate.push("${tempList.date}");
		</c:forEach>
		console.log("temp = ", temp);
		console.log("tempDate = ", tempDate);
		
		var hum = new Array();
	    var humDate = new Array();
	   
	    <c:forEach items = "${humList}" var = "humList">
	   		hum.push("${humList.hum}");
	   		humDate.push("${humList.date}");
		</c:forEach>
		console.log("hum = ", hum);
		console.log("humDate = ", humDate);

		
		// Set new default font family and font color to mimic Bootstrap's default styling
		Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#292b2c';

		// Area Chart Example
		var ctx1 = document.getElementById("chartTemp");
		var myChartTemp = new Chart(ctx1, {
		  type: 'line',
		  data: {
		    labels: tempDate,
		    datasets: [{
		      lineTension: 0.3,
		      backgroundColor: "rgba(2,117,216,0.2)",
		      borderColor: "rgba(2,117,216,1)",
		      pointRadius: 5,
		      pointBackgroundColor: "rgba(2,117,216,1)",
		      pointBorderColor: "rgba(255,255,255,0.8)",
		      pointHoverRadius: 5,
		      pointHoverBackgroundColor: "rgba(2,117,216,1)",
		      pointHitRadius: 50,
		      pointBorderWidth: 2,
		      data: temp,
		    }],
		  },
		  options: {
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          display: false
		        },
		        ticks: {
		          maxTicksLimit: 7
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 45,
		          maxTicksLimit: 5
		        },
		        gridLines: {
		          color: "rgba(0, 0, 0, .125)",
		        }
		      }],
		    },
		    legend: {
		      display: false
		    }
		  }
		});
		var ctx2 = document.getElementById("chartHum");
		var myChartHum = new Chart(ctx2, {
		  type: 'line',
		  data: {
			  labels: humDate,
		    datasets: [{
		      lineTension: 0.3,
		      backgroundColor: "rgba(255, 193, 7, 0.2)",
		      borderColor: "rgba(255, 193, 7, 1)",
		      pointRadius: 5,
		      pointBackgroundColor: "rgba(255, 193, 7, 1)",
		      pointBorderColor: "rgba(255,255,255,0.8)",
		      pointHoverRadius: 5,
		      pointHoverBackgroundColor: "rgba(255, 193, 7, 1)",
		      pointHitRadius: 50,
		      pointBorderWidth: 2,
		      data: hum
		    }],
		  },
		  options: {
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          display: false
		        },
		        ticks: {
		          maxTicksLimit: 7
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 45,
		          maxTicksLimit: 5
		        },
		        gridLines: {
		          color: "rgba(0, 0, 0, .125)",
		        }
		      }],
		    },
		    legend: {
		      display: false
		    }
		  }
		});
		var ctx = document.getElementById("chartDust");
		var myChartDust = new Chart(ctx, {
		  type: 'line',
		  data: {
		    labels: dustDate,
		    datasets: [{
		      lineTension: 0.3,
		      backgroundColor: "rgba(40, 167, 69,0.2)",
		      borderColor: "rgba(40, 167, 69,1)",
		      pointRadius: 5,
		      pointBackgroundColor: "rgba(40, 167, 69,1)",
		      pointBorderColor: "rgba(255,255,255,0.8)",
		      pointHoverRadius: 5,
		      pointHoverBackgroundColor: "rgba(40, 167, 69,1)",
		      pointHitRadius: 50,
		      pointBorderWidth: 2,
		      data: ugm3
		    }],
		  },
		  options: {
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'date'
		        },
		        gridLines: {
		          display: false
		        },
		        ticks: {
		          maxTicksLimit: 7
		        }
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          max: 45,
		          maxTicksLimit: 5
		        },
		        gridLines: {
		          color: "rgba(0, 0, 0, .125)",
		        }
		      }],
		    },
		    legend: {
		      display: false
		    }
		  }
		});
	      $('#tg').change(function() {
				var act = {
					"act" : $(this).prop('checked')
				};
				$('#console-event').html('Toggle: ' + $(this).prop('checked'))
				console.log("act", act);
				$.ajax({

					type : "get",
					url : "/airlc/charts_controll",
					data : act,
				})
			});
	});
</script>
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="home">Air L&C</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <!-- <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div> -->
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="home">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="charts">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Chart</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables">
          <i class="fas fa-fw fa-table"></i>
          <span>Information table</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Charts</li>
        </ol>

        <!-- Area Chart Example-->
        <div class="card mb-3">
          <div class="card-header"> <span>
            <i class="fas fa-chart-area"></i>
            Micro Dust Chart </span>
            <span class="float-right"> 
            <label class="switch">
                       <input id="tg" type="checkbox" 
                                 <c:if test = "${Gpio_service.equals('Off')}">checked="checked" </c:if>
                       >
                       <span class="slider round" ></span>
                     </label>
            </span>
            </div>
          <div class="card-body"> 
            <canvas id="chartDust" width="100%" height="30"></canvas>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
        
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            Temperature Chart </div>
          <div class="card-body">
            <canvas id="chartTemp" width="100%" height="30"></canvas>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

		<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            Humidity Chart </div>
          <div class="card-body">
            <canvas id="chartHum" width="100%" height="30"></canvas>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More chart examples coming soon...</em>
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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login">Logout</a>
        </div>
      </div>
    </div>
  </div>


</body>

</html>
