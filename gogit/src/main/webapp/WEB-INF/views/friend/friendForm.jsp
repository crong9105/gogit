<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
       <!-- alerty.alert  -->
  <!-- JavaScript -->
<script src="//gcore.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//gcore.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//gcore.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//gcore.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
       
   <style>
/* 전체 레파지토리 wrap */
.repo-wrap {
   display: flex;
   flex-direction: column;
}

.repo-wrap>div {
   padding: 25px 0px;
   /* width: 900px; */
}

/* 레파지토리 목록 부분 */
.bottom-area {
   border:1px solid #e6e6e6;
   height: 500px;
   border-radius: 10px;
   padding: 20px;
   background-color: white;
}

.bottom-area-wrap {
   display: flex;
   justify-content: flex-end;
}

.repo-search input {
   outline: none;
   border: none;
}

h2 {
   margin: 0;
}

.repo-search-div {
   border: 1px solid #e6e6e6;
   width: 450px;
   height: 35px;
   border-radius: 6px;
   padding: 6px 10px;
}

/* 검색바 부분 버튼 스타일 변경 */
.repo-btn {
   background-color: rgb(249, 250, 255);
   border: 1px solid #e6e6e6;
   border-radius: 6px;
   height: 35px;
   width: 100px;
   font-weight: 600;
}

.repo-create-btn {
   background-color: rgb(36, 87, 228);
   color: white;
   border: 1px solid #e6e6e6;
   border-radius: 6px;
   height: 35px;
   width: 100px;
   font-weight: 600;
}

.repo-create {
   display: flex;
   justify-content: space-between;
   width: 28%;
}

/* 레포지토리 리스트 목록 스타일 */
.repo-list-one {
   border: 1px solid #e6e6e6;
   border-radius: 6px;
   height: 100px;
   width: 100%;
   display: flex;
   align-items: center;
   padding: 15px;
}

.repo-list-area {
   padding-top: 30px;
}

.repo-search {
   padding-right: 7px;
}

.body-wrapper {
   background-color: #f9f9ff;
}

</style>


    
  </head>
  <body>
    <jsp:include page="../common/sideBar.jsp" />
    <jsp:include page="../common/header.jsp" />
<div id="app">


      <!-- 
          ***뽑아온 값 
         1. 나의 친구 목록은 세션에 담음 -> myBfList
         2. 나의 친구 아님 목록 -> noneBfList
         3. 모든 회원 조회 -> allMemberList
         
         
         -----------------
         pi1 == 내 친구 페이징 
         pi2 == 내 친구 아님 페이징 
         pi3 == 모든 회원 페이징
      
       -->


        
        <div id="main">
           <!-- 상단바 시작 -->

            <div class="page-heading">
                <h3>친구 관리</h3>
            </div>
            <div class="page-content">
               

                    <!-- 친구 목록 -->
                    <div class="UJ-col-12 col-lg-9 card" style="height: 700px; margin:auto;">

                        <!--            
            <div class="UJ-header" >
                
              
            </div>
             -->


                        <!-- 친구 목록 테이블 -->
                        <div class="UJ-menu" >

                        
                            <br><br>
                            <!-- table hover -->
                            <div class="table-responsive">

                                <h4 style="margin-left: 65px; margin-bottom: 20px;">친구 목록</h4>
                               

                                <!-- Button trigger for login form modal -->
                                <button type="button"
                                    style="border-radius: 10px; background-color: #435ebe; margin-bottom: 20px; color: white; float: right; margin-right: 70px;"
                                    data-bs-toggle="modal" data-bs-target="#inlineForm" id="selectFriBTN">
                                    친구 찾기
                                </button>

                        <!--===================== 모달모달모달모달 =======================-->
                                <!--login form Modal -->
                                <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog"
                                    aria-labelledby="myModalLabel33" aria-hidden="true"  >
                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                        role="document" >
                                        <div class="modal-content" >
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myModalLabel33">친구 찾기 </h4>
                                                <button type="button" class="close" data-bs-dismiss="modal"
                                                    aria-label="Close"  background-color: white;">
                                                    <i data-feather="x"></i>
                                                </button>
                                            </div>
                                            
                                            
                                            <!-- 모달 폼!!!! -->
                                            <form action="#">

                                                <!-- 모달 내용 작성하는 부분 -->
                                                <div class="modal-body" style="height:800px;">
                                                    <div class="col-md-6 mb-1" style="width: 100%;">
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text" id="basic-addon1"><i
                                                                    class="bi bi-search"></i></span>
                                                            <input type="text" class="form-control"
                                                                style="width: 200px;" placeholder="검색할 친구의 닉네임을 검색하세요."
                                                                aria-label="Recipient's username"
                                                                aria-describedby="button-addon2" id="searchBar">
                                                            <button class="btn btn-outline-secondary" type="button"
                                                                style="width: 70px; " id="button-addon2">검색</button>
                                                        </div>

                                                        <div>


                                                            <table class="table mb-0" id="modalTable" >
                                                                <thead>
                                                                    <tr>
                                                                        <th>No</th>
                                                                        <th style="text-align:center;">Name</th>
                                                                        <th  > &nbsp;&nbsp;&nbsp; Status</th>

                                                                        <th ></th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <!-- ajax로 조회한 내용 여기에 그릴거임 -->
                                                                </tbody>
                                                            </table>
                                                        </div>
                                          <br>
                                                    </div>


                                                </div>
                                                <!--모달 내용 작성하는 부분 끝-->


                                                <div class="modal-footer">
                                 


                                                    <button type="button" class="btn btn-primary"
                                                        data-bs-dismiss="modal">
                                                        <i class="bx bx-x d-block d-sm-none"></i>
                                                        <span class="d-none d-sm-block">Close</span>
                                                    </button>

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <br>


                        <!--===================== 찐 친구 목록 =======================-->
                       
                                <table class="table mb-0" width="150%" align="center" id="mainTable">
                           
                                    <thead>
                                        <tr>
                                            <th>&nbsp;&nbsp;No.</th>
                                             <th>Nickname</th>
                                            <th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Status</th>
                                          
                                 <th></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                           <c:choose>
                                     <c:when test="${not empty friendList }">
								    <c:forEach var = "f" items="${friendList }">                                                
                                              <tr>                                              
                                                  <td class="text-bold-500" >&nbsp;&nbsp; ${f.memId }</td>
                                                  <td> ${ f.gitNick}</td>
                                                  <td class="text-bold-500">
                                                  <c:choose>                                                 
                                                        <c:when test="${!empty f.memId  and f.isent eq 'Y' and f.friSent eq 'Y' }">
                                                           <button class='friendBTN' type='button' style='background-color:#edb2ed; '>친구</button>
                                                        </c:when>                                                  
                                                        <c:when test ="${empty f.memId}">
                                                           <button class='friendBTN' type='button' style='background-color:#5ce5cf; '>친구 아님</button>
                                                        </c:when>
                                                        
                                                        <c:when test="${!empty f.memId and f.isent eq 'A' and f.friSent == null }">
                                                           <button class='friendBTN' type='button' >친구 요청함</button>
                                                        </c:when>
                                                        
                                                              
                                                         <c:when test="${!empty f.memId and  f.isent == null and f.friSent eq 'A' }">
                                                            <button class='friendBTN' type='button' style=' '>친구 요청옴</button>
                                                         </c:when>
                                                            
                                                         <c:when test ="${!empty f.memId and f.isent eq 'B' and f.friSent eq 'A' }">
                                                            <button class='friendBTN' type='button' style='background-color:#ff033e; '>친구 거절함</button>
                                                         </c:when>
                                                         
                                                         <c:when test="${!empty f.memId and f.isent eq 'A' and f.friSent eq 'B' }">
                                                            <button class='friendBTN' type='button' style='background-color:#ff033e;'>친구 거절됨</button>
                                                         </c:when>   
                                                            
                                                         <c:when test ="${!empty f.memId and f.isent eq 'D' and (f.friSent eq 'Y'  or f.friSent == null or f.friSent == 'A')}">
                                                            <button class='friendBTN' type='button' style='background-color:lightgray;'>친구 차단함</button>
                                                         </c:when>   
                                                            
                                                         <c:when test="${!empty f.memId and (f.isent eq 'Y' or f.isent eq 'A' or f.isent == null ) and f.friSent eq 'D' }">
                                                  <button class='friendBTN' type='button' style='background-color:lightgray;'>친구 차단됨</button>                                                  
                                                         </c:when>

                                                      </c:choose>														
                                                  </td>
                                                  <td>                                                 
                                                        
		                                              
		                                                <button class="dropdown-toggle" type="button" class="dropdownMenuButton"
		                                                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
		                                                    style="border: 0; background-color: white; width: 40px; height: 40px;">
		                                                    ⁝
		                                                </button>
		                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                                                
		                                             
		                                                   <c:choose>
		                                                   		<c:when test ="${f.userNo !=0 and f.isent eq 'Y' and f.friSent eq 'Y' }">
			                                                   		<button class='dropdown-item' style='background-color:#f7f7f7;'    onclick='deleteFriend( ${f.memId }, ${loginUser.memId});'>친구 삭제</button> 
		                                                	        <button class='dropdown-item' onclick="blockFriend(${f.memId } ,  ${loginUser.memId} , '${f.isent }' , '${f.friSent }' , ${f.userNo } );">친구 차단</button> 
		                                                   		</c:when>
		                                                   		
		                                                   		<c:when test="${ f.userNo != 0 and f.isent eq 'A' and f.friSent eq null}">
		                                                   			<button class='dropdown-item' onclick='cancleAddFriend( ${f.memId }  , ${loginUser.memId} );'>친구 요청 취소</button>
		                                                   		</c:when>
		                                                   		
		                                                   		<c:when test="${f.userNo != 0 and f.isent eq null and f.friSent eq 'A'}">
			                                                   		<button class='dropdown-item' onclick='acceptFriend( ${f.memId } , ${loginUser.memId} );'>친구 수락</button> 
	                                                                <button class='dropdown-item' onclick='refuseFriend( ${f.memId } , ${loginUser.memId} );'>친구 거절</button> 
		                                                   		</c:when>
		                                                   		
		                                                   		<c:when test="${f.userNo != 0 and f.isent eq 'D' and (f.friSent eq 'A' or f.friSent eq 'Y' or f.friSent eq null )}">
			                                                   		<button class='dropdown-item' onclick='cancleRefuseFriend(${f.memId }, ${loginUser.memId} );'>친구 차단 취소</button>
		                                                   		</c:when>
		                                                   		
		                                                   		
		                                                   		<c:when test="${f.userNo != 0 and f.isent eq 'B' and f.friSent eq 'A' }">
				                                                   	<button class='dropdown-item' onclick="cancleRefuseFriend(${f.memId }, ${loginUser.memId} );">친구 거절 취소</button> 
		                                                		    <button class='dropdown-item' onclick="blockFriend(${f.memId },  ${loginUser.memId} , '${f.isent }', '${f.friSent }', ${f.userNo });">친구 차단</button>
		                                                   		</c:when>
		                                                   		
		                                                   		
		                                                   		<c:when test="${f.userNo != 0 and( f.isent eq 'B' or f.isent eq null or f.isent eq 'A' or f.isent eq 'Y')and f.friSent eq 'D' }">
				                                                   	<button class='dropdown-item' type='button'> ${ f.gitNick}  님이 회원님을 차단했습니다. </button> 
		                                                   		</c:when>
		                                                   		
		                                                   		<c:when test="${f.userNo != 0 and  f.isent eq 'A' and f.friSent eq 'B' }">
				                                                   	<button class='dropdown-item' type='button' style='background-color:#f7f7f7;' >${ f.gitNick}  님이 친추 요청을 거절했습니다. </button>
		                                                   		</c:when>
		                                                   		
		                                                   		<c:otherwise>
			                                                   		<button class='dropdown-item' style='border:0;' onclick="(${f.memId} ,${loginUser.memId});" >친구 추가</button> 
		                                                            <button class='dropdown-item' style='border:0;' onclick="blockFriend(  ${f.memId }  ,  ${loginUser.memId}, ' ${f.isent }', '${f.friSent }' , ${f.userNo });">친구 차단</button> 
		                                                   		</c:otherwise>

		                                                   </c:choose>
		                                                
		                                         
		                                           
		
		                                                </div>
		
		
		                                            
      
      
                                                  </td>
      
      
                                              </tr>
                                            </c:forEach>
                                       </c:when>
                                       
                                       <c:otherwise>
                                             <tr>
                                               <td colspan="4" style="text-align:center; height:70px;"><h6 style="color:gray">아직 친구가 없습니다! 친구를 찾아서 새로운 관계를 맺어보세요~!</h6></td>
                                             </tr>
                                       
                                       </c:otherwise>
                           </c:choose>
                                        

                                 
                                    </tbody>
                                </table>


                        <br><br>
                        
                                        <!-- 페이징바  // 페이징바 작동 잘 안함.....ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ -->
                                       <!--  <nav aria-label="Page navigation example">
                                          <ul class="pagination pagination-primary  justify-content-center ">
                                          
                                          
                                          
                                             <c:choose>
                                                <c:when test = "${pi2.currentPage ne 1 }">
                                                   <li class="page-item"><a class="page-link" href="friendList.f?cpage=${pi1.currentPage -1 }">
                                                      <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                                   </a></li>
                                                </c:when>
                                                
                                                <c:otherwise>
                                                       <li class="page-item disabled"><a class="page-link" >
                                                         <span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
                                                      </a></li>
                                                </c:otherwise>
                                             </c:choose>
   
                                             
                                             <c:forEach var="i" begin="${pi2.startPage }" end="${pi2.endPage }">
                                                <li class="page-item "><a class="page-link" href="friendList.f?cpage=${i }">${i }</a></li>
                                             
                                             </c:forEach>   
                                                
                                                
                                                
                                                    <c:choose>   
                                                    
                                                       <c:when test="${pi2.currentPage eq pi2.maxPage }">
                                                             <li class="page-item disabled"><a class="page-link" >
                                                               <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                                            </a></li>
                                                       </c:when>
                                                       
                                                       <c:otherwise>
                                                               <li class="page-item "><a class="page-link" href="friendList.f?cpage=${pi2.currentPage +1 }">
                                                               <span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
                                                            </a></li>
                                                       </c:otherwise>
                                                      
                                                   </c:choose>
                                             
                                          </ul>
                                       </nav> -->
                     
                            </div>

                     

                        <br><br>
                        
                        <br><br><br><br><br><br><br><br>
                              
                              
                              
                              
                     </div>
                         

                        </div>
               
               <!-- 오른쪽에 위에는 친구/프로젝트 팀원들 모아놓는 card 이고 하단에는 프로젝트 참여신청한 임시 회원들 목록이 있는 card임-->
      
               

                    </div>
            
               
                </section>
            </div>
         
        </div>
    </div>
    
    
                <script type="text/javascript">

                       $("#selectFriBTN").click(function(){
                         	
                           selectAllFriend();
                         
                        });
                        
                     
                      // 친구 찾기 버튼을 눌렀을 때 나오는 모달 창내에서 실행할 ajax
                            function selectAllFriend(){
                               
                         	console.log("sdafasd")
                    	  
                               $.ajax({
                                  url: "allMemberList.fr",
                                  data:{
                                     memId : "${loginUser.memId}"
                                  },
                                  
                                  success:function(list){
                                		
                              		
                          			let value="";
                          			
                          			
                          			if(list.length != 0){
	                            			for(let i in list){
	                            				
	                            			  console.log(list[i].userNo + "   : 친구상태태탵")
	                            				
	                            				value += "<tr>"
	                                             	  + "<td >" + list[i].memId +"</td>"
	                                                  + "<td >" + list[i].gitNick +"</td>"
	                                                  
	                                                  
	                                                  + "<td class='text-bold-500' >"
	                                              
	                                                 
			                            				if(list[i].userNo != 0 && list[i].isent == 'Y' && list[i].friSent == 'Y'){
			                            					// 나와 친구일 때
			                            					
		                                                  	value += "<button class='friendBTN' type='button' style='background-color:#edb2ed; '>친구</button>"
		                                                  	
		                                                  }else if(list[i].userNo == 0){
		                                                	  // 나와 친구가 아닐 때
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button' style='background-color:#5ce5cf; '>친구 아님</button>"
		                                                	
		                                                  }else if(list[i].userNo != 0 && list[i].isent == 'A' && (list[i].friSent == null || list[i].friSent == 0 ) ){
		                                                	  // 내가 친구 요청
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button' >친구 요청함</button>" 
		                                                	
		                                                  }else if(list[i].userNo != 0 && (list[i].isent == null || list[i].isent == 0) && list[i].friSent == 'A'){
		                                                	// 친구가 나한테 친추 보냈을 경우
		                                                	  
		                                                	  value +=  "<button class='friendBTN' type='button' style=' '>친구 요청옴</button>" 
		                                                	
		                                                  } else if(list[i].userNo != 0 && list[i].isent == 'B' && list[i].friSent == 'A'){
		                                                	  // 내가 친추 거절했을 때
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button' style='background-color:#ff033e; '>친구 거절함</button>"
		                                                	
		                                                  }else if(list[i].userNo != 0 && list[i].isent == 'A'  && list[i].friSent == 'B'){
		                                                	  // 친구가 내 친추 거절했을 때
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button'  style='background-color:#ff033e;'>친구 거절됨</button>"
		                                                	
		                                                  } else if(list[i].userNo != 0 && list[i].isent == 'D' && (list[i].friSent == 'A' || list[i].friSent == 'Y' || list[i].friSent == null || list[i].friSent == 0)){
		                                                	  // 내가 친구 차단했을 때
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button' style='background-color:lightgray;'>친구 차단함</button>" 
		                                                	
		                                                  }else if(list[i].userNo != 0 && (list[i].isent == 'Y' || list[i].isent == 'A' || list[i].isent == null || list[i].isent == 0 ) && list[i].friSent == 'D' ){
		                                                	// 친구가 나를 차단했을 때
		                                                	  
		                                                	  value +=  "<button class='friendBTN' type='button'; style='background-color:lightgray;'>친구 차단됨</button>"  
		                                                  }
			                            				
	                                           value +="</td>"
	                                           
	                                           
	                                                  + "<td class='friend-menu'>"

	                                               
	                                                  
	                                                  
	                                                  + "<button class='dropdown-toggle' type='button' class='dropdownMenuButton' data-bs-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='border: 0; background-color: white; width: 40px; height: 40px;'>"
	                                                  + " ⁝ "
	                                                  + "</button>"
	                                                  + "<div class='dropdown-menu' aria-labelledby='dropdownMenuButton' style='background-color:#f7f7f7;'>";
	                                                  
	                                                  if(list[i].userNo != 0 && list[i].isent == 'Y' && list[i].friSent == 'Y'){
	                                                	  // 친구일 때 친구 삭제하거나, 친구 차단하거나
	                                                	  // &#39; 는 '이걸 의미함, 이렇게 작성안하고 'list[i].ISent' 이런식으로 하면 이 값을 컴터가 못알아챔... 바보들...
	                                                	  
	                                                	  value += "<button class='dropdown-item' style='background-color:#f7f7f7;'    onclick='deleteFriend("+ list[i].memId + "," + ${loginUser.memId}  +");'>친구 삭제</button> "
	                                                	        + "<button class='dropdown-item' onclick='blockFriend(" + list[i].memId  +"," +  ${loginUser.memId} + ",&#39;" +list[i].isent + "&#39;,&#39;" + list[i].friSent + "&#39;," + list[i].userNo  + ");'>친구 차단</button> "
	                                                  
	                                                  }else if(list[i].userNo != 0 && list[i].isent == 'A' && list[i].friSent == null ){
	                                                	  // 친구 요청보냈을 때 친구 요청취소
	                                                	  
	                                                	  value += "<button class='dropdown-item' onclick='cancleAddFriend("+ list[i].memId  + "," + ${loginUser.memId}  + ");'>친구 요청 취소</button> "
                                                              
                                                       
                                                    }else if(list[i].userNo != 0 && list[i].isent == null  && list[i].friSent == 'A'){
                                                  	  // 친구 요청왔을 때 친구 수락하거나 친구 거절하거나
                                                  	  
	                                                	  value += "<button class='dropdown-item' onclick='acceptFriend(" + list[i].memId + "," + ${loginUser.memId} + ");'>친구 수락</button> "
                                                               + "<button class='dropdown-item' onclick='refuseFriend(" + list[i].memId + "," + ${loginUser.memId} + ");'>친구 거절</button> "
                                                        
                                                    }else if(list[i].userNo != 0 && list[i].isent == 'D' && (list[i].friSent == 'A' || list[i].friSent == 'Y' || list[i].friSent == null)){
                                                  	  // 친구 차단했을 때
                                                  	  
	                                                	  value += "<button class='dropdown-item' onclick='cancleRefuseFriend(" + list[i].memId + "," + ${loginUser.memId} + ",&#39;" + list[i].friSent +"&#39;" +");'>친구 차단 취소</button> "
	                                                	  
                                                        
                                                    }else if(list[i].userNo != 0 && list[i].isent == 'B' && list[i].friSent == 'A'){
                                                  	  // 친구 거절 했을 때 거절 취소하거나 친구 차단하거나 (친추 왔을 때만 거절)
                                                  	  
	                                                	  value += "<button class='dropdown-item' onclick='cancleRefuseFriend(" + list[i].memId + "," + ${loginUser.memId} + ",&#39;" + list[i].friSent +"&#39;" +");'>친구 거절 취소</button> "
	                                                		    + "<button class='dropdown-item' onclick='blockFriend(" + list[i].memId  +"," +  ${loginUser.memId} + ",&#39;" +list[i].isent + "&#39;,&#39;" + list[i].friSent + "&#39;," + list[i].memId    + ");'>친구 차단</button> "
                                                        
                                                    }else if(list[i].userNo != 0 && (list[i].iSent == null || list[i].isent == 'B' || list[i].isent == 'A' || list[i].isent == 'Y') && list[i].friSent == 'D' ){
                                                  	  // 친구가 날 차단했을 때 아무것도 없음 
                                                  	   value += "<button class='dropdown-item' type='button'>" + list[i].gitNick + " 님이 회원님을 차단했습니다. </button> "
                                                  	  
                                                    }else if(list[i].userNo != 0 && list[i].iSent == 'A'  && list[i].friSent == 'B'){
                                                  	  // 친구가 내 친추를 거절했을 때 아무것도 없음 
                                                 	   value += "<button class='dropdown-item' type='button' style='background-color:#f7f7f7;' >" + list[i].gitNick + " 님이 친추 요청을 거절했습니다. </button> "
                                                 	  
                                                   }else {
	                                                	  // 친구가 아닐 때 친추보내거나, 차단하거나
	                                                	  
	                                                	  value += "<button class='dropdown-item' style='border:0;' onclick='addFriend(" + list[i].memId +"," + ${loginUser.memId} + ");' >친구 요청</button> "
	                                                            + "<button class='dropdown-item' style='border:0;' onclick='blockFriend(" + list[i].memId  +"," +  ${loginUser.memId} + ",&#39;" +list[i].isent + "&#39;,&#39;" + list[i].friSent + "&#39;," + list[i].userNo    + ");'>친구 차단</button> "
	                                               
                                                    }
	                                                  + "</div>"
	                                                 
	                                                  + "</td>"
	                                                  
	                                                  
	                                                  + "</tr>"
		                            				
		                            			} // for문
		                            			
		                            			
		                            			
		                            			
		                            		  } else{
		                            				value += "<td colspan='4'> 조회된 회원이 없습니다 </td>"
		                            		} // if문 끝
                          			
		                            		$("#modalTable tbody").html(value);
		                            		
                          		},
                          		error:function(){
                          			console.log("모든 친구리스트 조회용 ajax실패")
                          		}
                          		
                          		
                          	})
                          	
                          };// 모달창에 모든 친구 찾는 함수 끝
                            
                            
                            // 친구 요청(추가)하는 함수
                            function addFriend(bfTaker,bfGiver){
                               	console.log("sdaf")
                               $.ajax({
                                  url:"addFriend.fr",
                                  data:{            
                                     bfGiver : bfGiver,
                                     bfTaker : bfTaker
                                  },
                                  success:function(result){
                                     
                                     if(result == "success"){
                                        
                                        alertify.alert("친구 요청을 보냈습니다!")
                                        selectMyFriend();
                                        selectAllFriend();
                                   // (${ loginUser.memId})
                                                {
                                       // 내가 로그인 했을 때... 이거 필요없나..?

                                    
                                    if (socket.readyState == 1) {
                                       // 소켓
                                       // echoHandler에서 소켓 메세지에 보내야하는 양식이 있음 
                                       // 안보내도 되는 메세지 값은 걍 아무거나 보내셈... 어차피 안쓸거임
                                       let socketMsg = "friend" + "," + ${ loginUser.memId } + "," + memId +"," + 5 +",제목" + ",${loginUser.gitNick}," + 0 + ", 친구 요청을 보냈습니다!";

                                       console.log(socketMsg + "소켓메시지!!!!!!");
                                       socket.send(socketMsg);  // 찐으로 소켓에게 메시지 보내기
                                    }
                                 }
                                        
                                        
                                        
                                     }else{
                                        alertify.alert("친구 요청을 실패했습니다.ㅠㅠ")
                                        
                                     }
                                     
                                     
                                  },
                                  error:function(){
                                     console.log("친구 추가용 아작스 실패ㅠㅠㅠ")
                                  }
                               })
                               
                            };
                            
                            
                            // 친구 요청 취소하는 함수
                            function cancleAddFriend(memId, login){
                               $.ajax({
                                  url:"cancelAddFriend.fr",
                                  data : {
                                     bfTaker : memNo,
                                     bfGiver : login
                                  },
                                  
                                  success :function(data){
                                     
                                     if(data == "success"){
                                        alertify.alert("친구 요청을 취소했습니다!")
                                        selectMyFriend();
                                        selectAllFriend();
                                     }else{
                                        alertify.alert("친구 요청 취소를 실패했습니다..ㅠㅠ")
                                     }
                                     
                                  },
                                  
                                  error:function(){
                                     console.log("친구 요청 취소용 아작스 실패ㅠㅠ")
                                  }
                                  
                               })
                            };
                            
                            
                            // 친구 수락하는 함수
                            function acceptFriend(memId, login){
                               $.ajax({
                                  url:"acceptFriend.fr",
                                  data:{
                                     bfTaker: memId,  // 친추 수락 받을 사람
                                     bfGiver : login  // 친추 수락할 사람
                                  },
                                  success:function(data){
                                     
                                     let value = "";
                                     
                                     if(data == "success"){
                                        // 친구 수락 성공했으면 
                                        alertify.alert("친구 수락을 성공했습니다.")
                                        selectMyFriend();
                                        selectAllFriend();
                                        
                                        <%--if (${ loginMember.memId}){--%>
                                                if (true){
                                       // 내가 로그인 했을 때... 이거 필요없나..?

                                    
                                    if (socket.readyState == 1) {
                                       // 소켓
                                       // echoHandler에서 소켓 메세지에 보내야하는 양식이 있음 
                                       // 안보내도 되는 메세지 값은 걍 아무거나 보내셈... 어차피 안쓸거임
                                       let socketMsg = "friend" + "," + ${ loginMember.memId }+"," + memId +"," + 5 +",제목" + ",${loginMember.gitNick}," + 0 + ", 친구 요청을 수락했습니다!";

                                       console.log(socketMsg + "소켓메시지!!!!!!");
                                       socket.send(socketMsg);  // 찐으로 소켓에게 메시지 보내기
                                    }
                                 }
                                        
                                        
                                        
                                     }else{
                                        // 친구 수락 실패한경우 
                                        alertify.alert("친구 수락을 실패했습니다.");
                                     }
                                     
                                  },
                                  
                                  error:function(){
                                     console.log("친구 수락용 아작스 실패ㅠㅠ")
                                  }
                               })
                               
                               
                            };
                            
                            
                            // 친구 거절하는 함수
                            function refuseFriend(memId, login){
                               $.ajax({
                                  url:"refuseFriend.fr",
                                  data:{
                                     bfTaker : memId,
                                     bfGiver : login
                                  },
                                  
                                  success : function(data){
                                     
                                     if(data =="success"){
                                        alertify.alert("친구 거절이 되었습니다.")
                                        selectMyFriend();
                                        selectAllFriend();
                                        <%--if (${loginMember.memId}){--%>
                                            if (true){
                                       // 내가 로그인 했을 때... 이거 필요없나..?

                                    
                                    if (socket.readyState == 1) {
                                       // 소켓
                                       // echoHandler에서 소켓 메세지에 보내야하는 양식이 있음 
                                       // 안보내도 되는 메세지 값은 걍 아무거나 보내셈... 어차피 안쓸거임
                                       let socketMsg = "friend" + "," + ${ loginMember.memId }+"," + memId +"," + 5 +",제목" + ",${loginMember.gitNick}," + 0 + ", 친구 요청을 거절했습니다!";

                                       console.log(socketMsg + "소켓메시지!!!!!!");
                                       socket.send(socketMsg);  // 찐으로 소켓에게 메시지 보내기
                                    }
                                 }
                                        
                                        
                                        
                                     }
                                     
                                  },
                                  error: function(){
                                     console.log("친구 거절용 아작스 실패")
                                  }
                               })
                            }
                            
                            
                            // 친구 거절/차단 취소하는 함수
                            function cancleRefuseFriend(memId, login, frisent){
                               $.ajax({
                                  url:"cancleRefuseFriend.fr",
                                  data:{
                                     bfTaker : memId,
                                     bfGiver : login,
                                     frisent   : frisent
                                     
                                  },
                                  
                                  success:function(data){
                                     if(data =="success"){
                                        // 성공 
                                        
                                        alertify.alert("친구 상태 요청을 성공했습니다!")
                                        selectMyFriend();
                                        selectAllFriend();
                                        
                                     }else{
                                        alertify.alert("친구 상태 요청을 실패했습니다ㅠㅠ")
                                     }      
                                     
                                  },
                                  
                                  error:function(){
                                     console.log("친구 거절 취소용 아작스 실패ㅜㅜㅜ")
                                  }
                               
                               })
                            }
                            
                            
                            // 친구 차단하는 함수 
                            function blockFriend(memId, login, ISent, FriSent, userNo){
                               console.log(ISent + " : ISent"   +  FriSent + " : FriSent")
                               
                               $.ajax({
                                  url:"blockFriend.fr",
                                  data:{
                                     bfTaker:memId,
                                     bfGiver:login,
                                     ISent : isent,
                                     FriSent: FriSent,
                                     userNo : userNo
                                  },
                                  
                                  success:function(data){
                                     if(data == "success"){
                                        alertify.alert("친구 차단을 성공했습니다!")
                                        selectMyFriend();
                                        selectAllFriend();
                                     }else{
                                        alertify.alert("친구 차단을 실패했습니다ㅠㅠ")
                                     }
                                     
                                     
                                  },
                                  error:function(){
                                     console.log("친구 차단용 아작스 실패ㅠㅠ")
                                  }
                               
                               
                               
                               
                               })
                            }
                            
                           
                            
                            
                            // 친구 삭제하는 함수 
                            function deleteFriend(memId, login){
                               
                               $.ajax({
                                  url:"deleteFriend.fr",
                                  data:{
                                     bfTaker : memId,
                                     bfGiver : login
                                  },
                                  
                                  success:function(data){
                                     
                                     if(data == "success"){
                                        // 친구 삭제 성공 했을 때는 굳이 상대방에게 알람보내지 않아도 될듯
                                        alertify.alert("친구 삭제를 성공했습니다!")
                                        selectMyFriend();
                                        selectAllFriend();
                                        
                                     }else{
                                        alertify.alert("친구 삭제를 실패했습니다ㅠㅠ")
                                     }
                                     
                                     
                                  },
                                  
                                  error:function(){
                                     console.log("친구 삭제용 아작스 실패ㅠㅠ")
                                  }
                                  
                                  
                               })
                               
                            }
                            
                            
                            // 모달창에서 검색 버튼을 누르면 검색어로 회원을 조회하는 함수
                           $("#button-addon2").click(function(){
                              
                                  
                                  $.ajax({
                                     url:"searchMember.fr",
                                     data:{
                                        search : $("#searchBar").val(),
                                        memId : "${loginUser.memId}",
                                     },
                                     success:function(list){
                                        let value="";
                                       
                                        
                                        if(list.length != 0){
                                           for(let i in list){
                                              
                                        	   console.log(list[i].userNo + "   : 친구상태태탵")
                                              
                                              value += "<tr>"
                                                        + "<td >" + list[i].memId +"</td>"
                                                        + "<td >" + list[i].gitNick +"</td>"
                                                        
                                                        
                                                        + "<td class='text-bold-500' >"
                                                    	  
                                                        if(list[i].userNo != 0 && list[i].isent == 'Y' && list[i].friSent == 'Y'){
			                            					// 나와 친구일 때
			                            					
		                                                  	value += "<button class='friendBTN' type='button' style='background-color:#edb2ed; '>친구</button>"
		                                                  	
		                                                  }else if(list[i].userNo == 0){
		                                                	  // 나와 친구가 아닐 때
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button' style='background-color:#5ce5cf; '>친구 아님</button>"
		                                                	
		                                                  }else if(list[i].userNo != 0 && list[i].isent == 'A' && list[i].friSent == null ){
		                                                	  // 내가 친구 요청
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button' >친구 요청함</button>" 
		                                                	
		                                                  }else if(list[i].userNo != 0 && list[i].isent == null && list[i].friSent == 'A'){
		                                                	// 친구가 나한테 친추 보냈을 경우
		                                                	  
		                                                	  value +=  "<button class='friendBTN' type='button' style=' '>친구 요청옴</button>" 
		                                                	
		                                                  } else if(list[i].userNo != 0 && list[i].isent == 'B' && list[i].friSent == 'A'){
		                                                	  // 내가 친추 거절했을 때
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button' style='background-color:#ff033e; '>친구 거절함</button>"
		                                                	
		                                                  }else if(list[i].userNo != 0 && list[i].isent == 'A'  && list[i].friSent == 'B'){
		                                                	  // 친구가 내 친추 거절했을 때
		                                                	value += "<button class='friendBTN' type='button'  style='background-color:#ff033e;'>친구 거절됨</button>"
		                                                	
		                                                  } else if(list[i].userNo != 0 && list[i].isent == 'D' && (list[i].friSent == 'A' || list[i].friSent == 'Y' || list[i].friSent ==0 || list[i].friSent == null )){
		                                                	  // 내가 친구 차단했을 때
		                                                	  
		                                                	value +=  "<button class='friendBTN' type='button' style='background-color:lightgray;'>친구 차단함</button>" 
		                                                	
		                                                  }else if(list[i].userNo != 0 && (list[i].isent == 'Y' || list[i].isent == 'A' || list[i].isent == null ) && list[i].friSent == 'D' ){
		                                                	// 친구가 나를 차단했을 때
		                                                	  
		                                                	  value +=  "<button class='friendBTN' type='button'; style='background-color:lightgray;'>친구 차단됨</button>"  
		                                                  }
			                            				
	                                           value +="</td>"
	                                           
	                                           
	                                                  + "<td class='friend-menu'>"

	                                               
	                                                  
	                                                  
	                                                  + "<button class='dropdown-toggle' type='button' class='dropdownMenuButton' data-bs-toggle='dropdown' aria-haspopup='true' aria-expanded='false' style='border: 0; background-color: white; width: 40px; height: 40px;'>"
	                                                  + " ⁝ "
	                                                  + "</button>"
	                                                  + "<div class='dropdown-menu' aria-labelledby='dropdownMenuButton' style='background-color:#f7f7f7;'>";
	                                                  
	                                                  if(list[i].userNo != 0 && list[i].isent == 'Y' && list[i].friSent == 'Y'){
	                                                	  // 친구일 때 친구 삭제하거나, 친구 차단하거나
	                                                	  // &#39; 는 '이걸 의미함, 이렇게 작성안하고 'list[i].ISent' 이런식으로 하면 이 값을 컴터가 못알아챔... 바보들...
	                                                	  
	                                                	  value += "<button class='dropdown-item' style='background-color:#f7f7f7;'    onclick='deleteFriend("+ list[i].memId + "," + ${loginUser.memId}  +");'>친구 삭제</button> "
	                                                	        + "<button class='dropdown-item' onclick='blockFriend(" + list[i].memId  +"," +  ${loginUser.memId} + ",&#39;" + list[i].isent + "&#39;,&#39;" + list[i].FriSent + "&#39;," + list[i].userNo  + ");'>친구 차단</button> "
	                                                  
	                                                  }else if(list[i].userNo != 0 && list[i].isent == 'A' && list[i].friSent == null ){
	                                                	  // 친구 요청보냈을 때 친구 요청취소
	                                                	  
	                                                	  value += "<button class='dropdown-item' onclick='cancleAddFriend("+ list[i].memId  + "," + ${loginUser.memId}  + ");'>친구 요청 취소</button> "
													
	                                                	 
                                                         
                                                      }else if(list[i].userNo != 0 && list[i].iSent == null  && list[i].friSent == 'A'){
                                                    	  // 친구 요청왔을 때 친구 수락하거나 친구 거절하거나
                                                    	  
	                                                	  value += "<button class='dropdown-item' onclick='acceptFriend(" + list[i].memId + "," + ${loginUser.memId} + ");'>친구 수락</button> "
                                                                 + "<button class='dropdown-item' onclick='refuseFriend(" + list[i].memId + "," + ${loginUser.memId} + ");'>친구 거절</button> "
                                                          
                                                      }else if(list[i].userNo != 0 && list[i].iSent == 'D' && (list[i].friSent == 'A' || list[i].friSent == 'Y' || list[i].friSent == null)){
                                                    	  // 친구 차단했을 때
                                                    	  
	                                                	  value += "<button class='dropdown-item' onclick='cancelRefuseFriend(" + list[i].memId + "," + ${loginUser.memId} + ");'>친구 차단 취소</button> "
	                                                	  
                                                          
                                                      }else if(list[i].userNo != 0 && list[i].isent == 'B' && list[i].friSent == 'A'){
                                                    	  // 친구 거절 했을 때 거절 취소하거나 친구 차단하거나 (친추 왔을 때만 거절)
                                                    	  
	                                                	  value += "<button class='dropdown-item' onclick='cancelRefuseFriend(" + list[i].memId + "," + ${loginUser.memId} + ");'>친구 거절 취소</button> "
	                                                		    + "<button class='dropdown-item' onclick='blockFriend(" + list[i].memId  +"," +  ${loginUser.memId} + ",&#39;" + list[i].ISent + "&#39;,&#39;" + list[i].FriSent + "&#39;," + list[i].userNo     + ");'>친구 차단</button> "
                                                          
                                                      }else if(list[i].userNo != 0 && (list[i].isent == null || list[i].isent == 'B' || list[i].iSent == 'A' || list[i].isent == 'Y') && list[i].friSent == 'D' ){
                                                    	  // 친구가 날 차단했을 때 아무것도 없음 
                                                    	   value += "<button class='dropdown-item' type='button'>" + list[i].gitNick + " 님이 회원님을 차단했습니다. </button> "
                                                    	  
                                                      }else if(list[i].userNo != 0 && list[i].isent == 'A'  && list[i].friSent == 'B'){
                                                    	  // 친구가 내 친추를 거절했을 때 아무것도 없음 
                                                   	   value += "<button class='dropdown-item' type='button' style='background-color:#f7f7f7;' >" + list[i].gitNick + " 님이 친추 요청을 거절했습니다. </button> "
                                                   	  
                                                     }else {
	                                                	  // 친구가 아닐 때 친추보내거나, 차단하거나
	                                                	  
	                                                	  value += "<button class='dropdown-item' style='border:0;' onclick='addFriend(" + list[i].memId +"," + ${loginUser.memId} + ");' >친구 요청</button> "
	                                                            + "<button class='dropdown-item' style='border:0;' onclick='blockFriend(" + list[i].memId  +"," +  ${loginUser.memId} + ",&#39;" + list[i].iSent + "&#39;,&#39;" + list[i].FriSent + "&#39;," + list[i].userNo    + ");'>친구 차단</button> "
	                                               
                                                      }
	                                                  + "</div>"
	                                                 
	                                                  + "</td>"
	                                                  
	                                                  
	                                                  + "</tr>"
		                            				
		                            			} // for문
		                            			
		                            			
		                            			
		                            			
		                            		  } else{
		                            				value += "<td colspan='4'><h6 style='text-align:center; color:gray'> 조회된 회원이 없습니다 </h6></td>"
		                            		} // if문 끝
                            			
		                            		$("#modalTable tbody").html(value);
                            			
                            			
                            		},
                            		error:function(){
                            			console.log("친구할 사람 찾는 아작스 실패ㅠㅠㅠ")
                            		}
                            	})
                            
                       }) 
                            // 검색어로 친구 찾는 함수
                            
                            
                            
							</script>

								</body>
								</html>