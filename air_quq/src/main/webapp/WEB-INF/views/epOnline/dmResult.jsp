<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>DM</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-tags"></span>
						Table
					</h3>
				</div>
				<div class="panel-body">
					<div class="media">
						<div class="media-left">
							<img class="media-object" src="/spring/resources/mail.png"> 
						</div>
						<div class="media-body">
							<h3 class="media-heading">DM List</h3><br>
						</div>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>채팅방번호</th>						
							<th>내용</th>						
							<th>상대방</th>						
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dm" items="${dm }">
							<tr>
								<td>${dm.no }</td>
								<td>${dm.content }</td>
								<td>${dm.opponent }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="container">
		<ul class="pagination pagination-lg">
			<c:forEach var=${page } items="${paging }">
		        <li><a href="#">${page.num }</a></li>
			</c:forEach>
	    </ul>
	</div>
</div>
</body>
</html>
