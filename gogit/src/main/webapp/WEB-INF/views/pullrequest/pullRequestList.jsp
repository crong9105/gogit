<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		/* #repository-area{
			height: auto;
		} */
		
		#pullRequest-create{
			display: flex;
		}

		#create-btn{
			margin-left: auto;
			background-color: #02384b;
			color: white;
		}

		#pullRequest-list{
			border: 1px solid #e6e6e6;
			background-color: white;
			margin-top: 20px;
			margin-bottom: 20px;
			border-radius: 7px;
			padding: 10px 30px;
		}

		#choose-status{
			margin-top: 20px;
			margin-left: 20px;
		}

		#pullRequest-list>table{
			width: 100%;
			height: 100%;
			margin: auto;
			margin-top: 20px;
			margin-bottom: 20px;
			text-align: center;
		}

		#pullRequest-list>table td, #pullRequest-list>table th{
			padding: 5px;
		}

		#pullRequest-list>table th{
			font-size: 16px;
		}

		#pullRequest-list>table>tbody>tr:hover{
			background-color: lightgray;
			cursor: pointer;
		}
		
		.repo-detail-public-area {
			display: flex;
			align-items: center;
			border-bottom: 2px solid #e6e6e6;
			height: 70px;
		}
		
		.repo-detail-public-area>div {
			padding: 0px 10px;
		}
		
		.repo-detail-public {
			border: 1px solid #e6e6e6;
			border-radius: 30px;
			width: 100px;
			height: 30px;
			display: flex;
			align-items: center;
			justify-content: space-around;
		}
		
		/* START TOOLTIP STYLES */
		[tooltip] {
  			position: relative; /* opinion 1 */
		}

		/* Applies to all tooltips */
		[tooltip]::before, [tooltip]::after {
  			text-transform: none; /* opinion 2 */
			font-size: .9em; /* opinion 3 */
			line-height: 1;
		  	user-select: none;
		  	pointer-events: none;
		  	position: absolute;
		  	display: none;
		  	opacity: 0;
		}
		[tooltip]::before {
  			content: '';
  			border: 5px solid transparent; /* opinion 4 */
  			z-index: 1001; /* absurdity 1 */
		}
		[tooltip]::after {
  			content: attr(tooltip); /* magic! */
  
  			/* most of the rest of this is opinion */
  			font-family: Helvetica, sans-serif;
  			text-align: center;
  
  			/* 
   			Let the content set the size of the tooltips 
   			but this will also keep them from being obnoxious
    		*/
  			min-width: 3em;
  			max-width: 21em;
  			white-space: nowrap;
  			overflow: hidden;
  			text-overflow: ellipsis;
  			padding: 1ch 1.5ch;
  			border-radius: .3ch;
  			box-shadow: 0 1em 2em -.5em rgba(0, 0, 0, 0.35);
  			background: #333;
  			color: #fff;
  			z-index: 1000; /* absurdity 2 */
		}

		/* Make the tooltips respond to hover */
		[tooltip]:hover::before, [tooltip]:hover::after {
  			display: block;
		}

		/* don't show empty tooltips */
		[tooltip='']::before, [tooltip='']::after {
  			display: none !important;
		}
		
		/* FLOW: DOWN */
		[tooltip][flow^="down"]::before {
  			top: 100%;
  			border-top-width: 0;
  			border-bottom-color: #333;
		}
		[tooltip][flow^="down"]::after {
  			top: calc(100% + 5px);
		}
		[tooltip][flow^="down"]::before, [tooltip][flow^="down"]::after {
  			left: 50%;
  			transform: translate(-50%, .5em);
		}
		
		/* KEYFRAMES */
		@keyframes tooltips-vert {
  			to {
    			opacity: .9;
    			transform: translate(-50%, 0);
  			}
		}

		@keyframes tooltips-horz {
  			to {
    			opacity: .9;
    			transform: translate(0, -50%);
			}
		}

		/* FX All The Things */ 
		[tooltip]:not([flow]):hover::before,
		[tooltip]:not([flow]):hover::after,
		[tooltip][flow^="down"]:hover::before,
		[tooltip][flow^="down"]:hover::after {
  			animation: tooltips-vert 300ms ease-out forwards;
		}
	</style>
</head>
<body>
	<jsp:include page="../common/sideBar.jsp"/>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
	
		<!--  Main wrapper -->
		<div class="body-wrapper">
		
			<div class="container-fluid">
			
				<!--  Row 1 -->
				<div class="row">
					<div id="repository-area">
						<jsp:include page="../repository/repositoryTab.jsp"/>
						
						<div id="pullRequest-area">
							<div id="pullRequest-create">
								<a href="create.pullrq" class="btn" id="create-btn">Pull request 생성</a>
							</div>

							<div id="pullRequest-list">
								<div class="repo-detail-public-area">
				          			<div>
				          				<h4>01_repository</h4>
				          			</div>
				          			<div class="repo-detail-public">
				          				<div>Private</div>
				          			</div>
				          		</div>
								<div id="choose-status">
									<input type="radio" id="status-open" name="status" value="open" checked>
									<label for="status-open">Open</label>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" id="status-closed" name="status" value="closed">
									<label for="status-closed">Closed</label>
									<!-- <a href="list.pullrq">Open</a>
									<a href="list.pullrq/closed">Closed</a> -->
								</div>
								<table>
									<thead>
										<tr>
											<th>Pull request Title</th>
											<th>Pull request 작성자</th>
											<th>Assignees</th>
											<th>Milestone</th>
										</tr>
									</thead>
									<tbody>
										<!-- for문으로 pullreqArr 다 돌기 -->
										<c:forEach var="pullreq" items="${ list }">
											<tr>
												<td>${ pullreq.pullTitle }</td>
												<td>${ pullreq.pullWriter }</td>
												<td>
													<c:if test="${ not empty pullreq.pullManager }">
														<c:set var="assignee" value="${ fn:split(pullreq.pullManager, ',') }"/>
														<c:forEach var="profile" items="${ fn:split(pullreq.pullManagerProfile, ',') }" varStatus="status">
															<span tooltip="${ assignee[status.index] }" flow="down"><img class="profile" src="${ profile }" style="width: 25px; height: 25px; border-radius: 100%;"></span>
														</c:forEach>
													</c:if>
												</td>
												<td>0.1</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 
	<script>
		$(function() {
			const list = ${list};
			$("input[name=status]").on("change", function() {
				const list = ${ list };
				
				for(let i in list) {
					// console.log(list[i]);
					const title = list[i].title;
					const content = list[i].body;
					const writer = list[i].user.login;
					const assignees = list[i].assignees;
					const 
				}
				
				console.log(list);
				// if($("input[name=status]:checked").val() === "open") {

				// } else {

				// }
			});
		})
	</script>
	 -->	
</body>
</html>