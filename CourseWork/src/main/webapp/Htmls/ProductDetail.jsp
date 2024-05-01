<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
<link rel="stylesheet" href="/CourseWork/CSS/ProductDetail.css">
</head>
<body>
	<%
		String productName = request.getParameter("productName");
	%>

	<jsp:include page="Header.jsp"></jsp:include>
	
	<sql:setDataSource var="connection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/coursework" user="root" password=""/>
	<sql:query var="product" dataSource="${connection }">
		select * from products where productName = "<%=productName %>";
	</sql:query>
	
	<c:forEach var="product" items="${product.rows}">
	
	<div class="body">
	<section class="section">
        <div class="img-column">
            <div class="big-image-wrapper">
                <img src="/CourseWork/devices/Phone/Iphone 13.png" alt="error">
            </div>
        </div>
        <div class="buy-column">
            <h1>${product.productName }</h1>
            <div class="txt-wrapper">
                <p>${product.productDescription })
                </p>
            </div>
            <h2>RS. ${product.price }</h2>
            <div class="qty">

            </div>
            <div class="buttons">
                <a href="#">Buy</a>
                <a href="#">Add to Cart</a>
            </div>
        </div>
    </section>
    </div>
    </c:forEach>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>