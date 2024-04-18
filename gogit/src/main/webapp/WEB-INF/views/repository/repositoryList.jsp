<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.repo-list-count {
	height: 50px;
	background-color: #eaedf3;
	border-radius: 8px 8px 0 0;
	padding: 10px 15px;
}

.repo-list-top-area {
	display: flex;
	justify-content: space-between;
}

.repo-list-wrap {
	padding: 10px 15px;
}
</style>
</head>
<body>
	
	<jsp:include page="../common/sideBar.jsp" />
	
	<jsp:include page="../common/header.jsp" />
		
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
	
			<div class="container-fluid">
	          <!-- Row 1 -->
	          <div class="row">
	          
	          <!-- 레파지토리 리스트 -->
	          <div class="repo-wrap">
	          	<div>
	          		<div>
	          			<h2>My &nbsp; Repository</h2>
	          		</div>
	          	</div>
	          	<div>
	          		<div class="bottom-area">
	          			<div class="bottom-area-wrap">
	          				<div class="repo-search">
	          					<div class="repo-search-div">
	          						<input type="text" placeholder="Find a repository">
	          						<i class="ti ti-search"></i>
	          					</div>
							</div>
							<div class="repo-create">
								<div class="repo-btn">
									<a>Type</a>
								</div>
								<div class="repo-create-btn">
									<a class="repo-create-btn-color" href="enrollForm.rp">New</a>
								</div>
							</div>
	          			</div>

						<!-- 목록 시작 -->
						<div class="repo-list-total-wrap">
							<div>
								<div>
									<div class="repo-list-count">
										<div><h4>16 repository</h4></div>
									</div>
									<div class="repo-list-wrap">
									<c:forEach var="rpList" items="${ rpList }">
										<div>
											<div>
												<div class="repo-list-top-area">
													<div>
														<div>
															<h4>${ rpList.repoTitle }</h4>
														</div>
														<div>${ rpList.visibility }</div>
													</div>
													<div>
														<div>초대</div>
														<div>수정</div>
														<div>삭제</div>
													</div>
												</div>
												<div>${ rpList.repoContent }</div>
											</div>
											<div>
												<div>${ rpList.language }</div>
												<div>${ rpList.stargazers }</div>
												<div>${ rpList.fork }</div>
												<div>${ rpList.openIssue }</div>
												<div>${ updateAt }</div>
											</div>
										</div>
									</c:forEach>
									</div>
								</div>
							</div>
						
			          			<div class="repo-list-wrap">
									<div class="repo-list-area">
										<div class="repo-list-one">
											<div class="repo-list-one-area">
												<div>
													<img src="resources/images/repo-img.png" width="60px" height="60px">
												</div>
												<div class="repo-title-area">
													<a href="detail.rp">
														<div>
															<h3></h3>
														</div>
													</a>
													<div></div>
													
												</div>
												<div>
													<div class="repo-public">
														<div></div>
													</div>
												</div>
											</div>
											<div class="repo-other-area">
												<div class="repo-other-img" onclick="openBtn(this);">
													<img src="resources/images/menu-dots.png" width="20px" height="20px">
												</div>
												<div class="repo-other">
													<div>
														<a id="repo-other-a">수정</a>
													</div>
													<div>
														<button type="button">초대</button>
													</div>
													<div>
														<button type="button">삭제</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
						</div>
						<!-- 목록 끝 -->

	          		</div>
	          	</div>
	          </div>
	          <!-- 레파지토리 리스트 END -->
	          
	          </div>
	        </div>
	     </div>
	 </div>

<script>

	/* 점점점 누르면 div 보이게 */

	function openBtn(e){
		//console.log($(e).siblings());

		const other = $(e).siblings();

		if(other.css("display") === 'none'){
			other.css("display", "block");
		}else{
			other.css("display", "none");
		}

	}
	
</script>
	
			
<link href="resources/repository/repositoryList.css" rel="stylesheet">
</body>
</html>