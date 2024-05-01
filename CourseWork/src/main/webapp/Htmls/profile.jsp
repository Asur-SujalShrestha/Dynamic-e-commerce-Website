<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel='stylesheet' href="/CourseWork/CSS/Profile.css">
</head>
<body>
	<%
		String userSession = (String) session.getAttribute("userName");
		String userEmail = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("email")) userEmail = cookie.getValue();
			}
		}
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	
	<sql:setDataSource var="connection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/coursework" user="root" password=""/>
	<sql:query var="userEmail" dataSource="${connection }">
		select * from users where email = "<%=userEmail %>";
	</sql:query>
	<c:forEach var="user" items="${userEmail.rows}">
	<div class="main-div">
	<div class="left-nav">
		
		<ul>
			<li class="active"><a href="/CourseWork/Htmls/profile.jsp"><img alt="errpr" src="/CourseWork/icons/profile.png">  Basic Information</a></li>
			<li><a href="/CourseWork/Htmls/Email.jsp" style="color: black"><img alt="error" src="/CourseWork/icons/password.png">  Change Password</a></li>
			
		</ul>
	</div>
	
	<div class="center-div">
		<div class="input-fields">
		<div style="display:flex; justify-content: center; margin-top: 10px;">
		<%
			String errormessage = (String) request.getAttribute("errorMessage");
			if(errormessage != null && !errormessage.isEmpty()){
		%>

			<p class="error-message" style="color:white; font-weigth: 100; font-size:1.5rem; background-color: red"><%=errormessage%></p>
		<%
				
			}
		%>
	</div>
			<form style="display: flex; flex-direction: column;" action="/CourseWork/UpdateServlet" method="post">
		
			<label>User Name</label>
			<input disabled type=text class="inputs" name="userName" value="${user.userName }">
		
			<label>First Name</label>
			<input disabled type=text class="inputs" name="firstName" value="${user.firstName } ${user.lastName}">
			
			<label>Last Name</label>
			<input disabled type=text class="inputs" name="lastName" value="${user.lastName}">
		
			<label>Birthday</label>
			<input disabled="disabled" class="inputs" type=date name="birthday" value="${user.birthday }">
		
			<label>Email-Address</label>
			<input class="inputs" type=text name="email" value="${user.email }" readonly>
			<p>This is your primary email address and will be used to send notification emails.</p>
		
			<label>Phone Number</label>
			<input disabled class="inputs" type=text name="phone" value="${user.phone }">
		
			<label>Address</label>
			<input disabled="disabled" class="inputs" type=text name="address" value="${user.address } ">
			
			
			<div class="submit-button">
				<button onclick= "changeData()" type="button">Changes Info</button>
				<button type="submit" id="save" style="display: none;">Save Changes</button>
			
			</div>
			</form>
		</div>
		
		
	</div>
	
	<div class="right-nav">
	<div class="profile-img">
	
		<img alt="error" src="/week3/images/user/${user.image }">
	
	</div>
		
	</div>
	
	</div>
	
	</c:forEach>
	<jsp:include page="Footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		function changeData() {
			var changes = document.getElementsByClassName('inputs');
			var button = document.getElementById('save');
			for(var i = 0; i< changes.length; i++){
				changes[i].disabled = false
			}
			button.style.display = 'inline';
		}
	</script>
</body>
</html>