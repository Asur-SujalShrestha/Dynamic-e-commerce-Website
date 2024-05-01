<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Iphone</title>
<link rel="stylesheet" href="/CourseWork/CSS/iphonePage.css">
</head>
<body>

	<jsp:include page="../Header.jsp"></jsp:include>
	
	<sql:setDataSource var="connection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/coursework" user="root" password=""/>
	<sql:query var="product" dataSource="${connection }">
		select * from products where productName like '%AirPods%';
	</sql:query>
	

	<div class="containers">
	<c:forEach var="user" items="${product.rows}">
  	<div class="product">
    <img src="/CourseWork/devices/Earpods/Airpods (2nd Generation).jfif" alt="Airpods 2nd Gen">
    <div class="product-info">
    	<div class = 'detail'>
      <h2> ${user.productName } </h2>
       <h3>Price: ${ user.price }</h3>
      <p>${user.productDescription }</p>
      </div>
      <button class="buy-btn">Buy Now</button>
    </div>
  </div>
  </c:forEach>
  </div>
  
  

	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>