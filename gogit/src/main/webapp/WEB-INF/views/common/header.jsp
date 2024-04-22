<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


<!-- jquery -->
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>


<link rel="shortcut icon" type="image/png" href="resources/images/logo/logo2.png" />
<link rel="shortcut icon" type="image/png" href="resources/images/logos/favicon.png" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/styles.min.css" />
<link rel="stylesheet" href="resources/common/header.css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/sidebarmenu.js"></script>
<script src="resources/js/app.min.js"></script>
<script src="resources/js/apexcharts.min.js"></script>
<script src="resources/js/simplebar.js"></script>
<script src="resources/js/dashboard.js"></script>

<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
</c:if>


<style>
	#alarmList{

		height: 500px;
		overflow: auto;
	}
	#alarmList li{
		display: block;
		box-sizing: border-box;
		width: 450px;
		margin-bottom: 10px;
		font-size: 12px;
	}
	#alarmList button{
		margin: 1px;
	}

</style>
</head>
<body>

<!--  Body Wrapper -->
<div
  class="page-wrapper"
  id="main-wrapper"
  data-layout="vertical"
  data-navbarbg="skin6"
  data-sidebartype="full"
  data-sidebar-position="fixed"
  data-header-position="fixed">
	
	<!--  Main wrapper -->
	<div class="body-wrapper">

        <!--  Header Start -->
        <header class="app-header">
          <nav class="navbar navbar-expand-lg navbar-light" id="header-nav">
            <ul class="navbar-nav" id="header-alarm">
              <li class="nav-item d-block d-xl-none">
                <a
                  class="nav-link sidebartoggler nav-icon-hover"
                  id="headerCollapse"
                  href="javascript:void(0)"
                >
                  <i class="ti ti-menu-2"></i>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" onclick="alamList();">	
                  <i class="ti ti-bell-ringing "></i>
                  <div class="notification bg-primary rounded-circle"></div>
   
                </a>               
              </li>          
            </ul>
            <div
              class="navbar-collapse justify-content-end px-0"
              id="navbarNav"
            >
              <div>
              	<div class="header-searchbar">
              		<div>
              			<i class="ti ti-search"></i>
              		</div>
              		<div>
              			<input type="text" placeholder="What are you looking for?">
              		</div>
              	</div>
              </div>
              <ul
                class="navbar-nav flex-row ms-auto align-items-center justify-content-end"
              >
                <!-- <a
                  href="https://adminmart.com/product/modernize-free-bootstrap-admin-dashboard/"
                  target="_blank"
                  class="btn btn-primary"
                  >Download Free</a
                > -->
                <li class="nav-item dropdown" id="header-profile-img">
                  <a
                    class="nav-link nav-icon-hover"
                    href="javascript:void(0)"
                    id="drop2"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                  >
                    <img
                      src="resources/images/profile/user-1.jpg"
                      alt=""
                      width="35"
                      height="35"
                      class="rounded-circle"
                    />
                  </a>
                  <div
                    class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
                    aria-labelledby="drop2"
                  >
                    <div class="message-body">
                      <a
                        href="javascript:void(0)"
                        class="d-flex align-items-center gap-2 dropdown-item"
                      >
                        <i class="ti ti-user fs-6"></i>
                        <p class="mb-0 fs-3">My Profile</p>
                      </a>
                      <a
                        href="javascript:void(0)"
                        class="d-flex align-items-center gap-2 dropdown-item"
                      >
                        <i class="ti ti-mail fs-6"></i>
                        <p class="mb-0 fs-3">My Account</p>
                      </a>
                      <a
                        href="javascript:void(0)"
                        class="d-flex align-items-center gap-2 dropdown-item"
                      >
                        <i class="ti ti-list-check fs-6"></i>
                        <p class="mb-0 fs-3">My Task</p>
                      </a>
                      <a
                        href="logout"
                        class="btn btn-outline-primary mx-3 mt-2 d-block"
                        >Logout</a
                      >
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </nav>
        </header>
        <!--  Header End -->
      </div>
    </div>
    
    <div class="modal fade" id="alamModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title"></h5>
                </div>
                <div class="modal-body">
                	<h3 calss="text-primary">알람</h3>
                   	<div id=alarmList>
                   		<ul class="list-group"></ul>
                   	</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="close">뒤로가기</button>
                </div>
    			
            </div>
        </div>
    </div>
    
    <script>
    	$(function(){
    		alarm();
    	})
    	
    	function alarm(){
    		$.ajax({
    			url:"alarm.me",
    			data:{
    				memId:'${loginUser.memId}'
    			},
    			success:function(data){
    				let value = "";
    				for(let i in data){
    					console.log(data[i].alarmType)
    					switch (data[i].alarmType) {
    					
    					//프로젝트 알람
						case "project":
							if(data[i].alarmYn == 1){
								value += "<li class='list-group-item active'>";
							}else{
								value += "<li class='list-group-item'>";
							}
							
							value += "<input type='hidden' value='"+data[i].alarmNo+"'>"
								+data[i].memId+"님이 프로젝트("+data[i].alarmTitle+")에 참가신청하셨습니다."
								+"<button class='btn btn-warning' onclick='apply("+data[i].alarmContentNo+");'>수락</button>"
								+"<button class='btn btn-danger' onclick='cancel();'>거절</button> </li>"
							break;

						default:
							break;
						}
    					$("#alarmList > ul").html(value);
    				}
    			},
    			error:function(){
    				console.log("실패")
    			}
    		})
    	}
    
    	function alamList(){
    		$("#alamModal").modal("show");
    		
    	}
    	
    	$("#close").click(function(){
    		$("#alamModal").modal("hide");
    	})
    	
    	
    	
    	$("#alarmList > ul").on("click","li",function(){
    		$(this).removeClass("active")
    		console.log()
    		
    		$.ajax({
    			url:"update.al",
    			data:{
    				alarmNo:$(this).children("input").val()
    			},
    			success:function(data){
    				console.log(data)
    			}
    		})
    	})
    	
    	
    	
    	
    	
    	
    	
    	
    	// 알람용 웹소켓
    	socket = new SockJS("alarm.ws");

        socket.onopen = function () {
          

        };

        socket.onclose = function onClose(e) {
          console.log(e.data);
        };

        socket.onmessage = function onMessage(e) {
        	alertify.alert(e.data);
        };
    </script>
  </body>
</html>
