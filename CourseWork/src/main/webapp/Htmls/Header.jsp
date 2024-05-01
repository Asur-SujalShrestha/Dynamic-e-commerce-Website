<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="/CourseWork/CSS/Home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>

	<%
		String userSession = (String) session.getAttribute("userName");
		String cookieUsername  = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie: cookies){
				if(cookie.getName().equals("user")) cookieUsername = cookie.getValue();
				
			}
		}
		boolean isLoggedIn = userSession != null;
	%>

	<header>
        <nav>
            <div class="logo">
                <h2 style="color: white;">Catalyst</h2>
            </div>
            <div class="search">
                <input type="text" name="search" placeholder="Search">
                <button><img src="/CourseWork/icons/search.png" alt="error"></button>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
                    <%
                    	if(isLoggedIn){
                    %>
                    	<li><a href="/CourseWork/Htmls/profile.jsp" style="background-color: #ffffff1a; padding:3px 6px; border-radius: 20px"> Hi, <%=cookieUsername %></a></li>
                    	<li class = "profileName"><a href="/CourseWork/Htmls/profile.jsp"><i class="fa-solid fa-user"></i></a></li>
                    	<li><form action="/CourseWork/LogoutServlet" method="post">
                 			<button type="submit">Logout</button>
                 		</form></li>
                    <%
                    	}
                    	else{
                    %>
                    <li><a href="/CourseWork/Htmls/Register.jsp">Sign up</a></li>
                    <li>|</li>
                    <li><a href="/CourseWork/Htmls/Login.jsp">Sign in</a></li>
                    <li><a href="/CourseWork/Htmls/profile.jsp"><i class="fa-solid fa-user"></i></a></li>
                    <%
                    	}
                    %>
                    
                    
                </ul>
            </div>
        </nav>
    </header>
    <section class="sub-heading">
        <ul>
            <li><a href="/CourseWork/Htmls/Home.jsp">Home</a></li>
            <li style="position: relative;"><a href="/CourseWork/Htmls/Products/macPage.jsp">Mac</a>
                <div class="mac">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, architecto delectus tempore hic temporibus dolores eos. Cum quidem nesciunt, consequatur ea maiores ipsum, molestias quaerat ut porro similique aspernatur ratione?</p>
                    <div class="laptop-list">
                        <ul>
                            <li><a href="#">Mac book 14 inch</a></li>
                            <li><a href="#">Mac book 16 inch</a></li>
                            <li><a href="#">Mac book Air M1 13 inch</a></li>
                            <li><a href="#">Mac book Air M2 13 inch</a></li>
                            <li><a href="#">Mac book M2 15 inch</a></li>
                        </ul>
                    </div>
                    <img src="/CourseWork/devices/Laptop/mac pro 14 inch.png" alt="error">
                </div>
            </li>
            <li style="position: relative;"><a href="/CourseWork/Htmls/Products/iphonePage.jsp">iphone</a>
                <div class="mac">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, architecto delectus tempore hic temporibus dolores eos. Cum quidem nesciunt, consequatur ea maiores ipsum, molestias quaerat ut porro similique aspernatur ratione?</p>
                    <div class="laptop-list">
                        <ul>
                            <li><a href="#">iphone 11</a></li>
                            <li><a href="#">iphone 12</a></li>
                            <li><a href="#">iphone 13</a></li>
                            <li><a href="#">iphone 14</a></li>
                            <li><a href="#">iphone 15</a></li>
                        </ul>
                    </div>
                    <img src="/CourseWork/devices/Phone/Iphone 15 pro max.png" alt="error">
                </div></li>
            <li style="position: relative;"><a href="/CourseWork/Htmls/Products/watchPage.jsp">iWatch</a>
                <div class="mac">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, architecto delectus tempore hic temporibus dolores eos. Cum quidem nesciunt, consequatur ea maiores ipsum, molestias quaerat ut porro similique aspernatur ratione?</p>
                    <div class="laptop-list">
                        <ul>
                            <li><a href="#">Apple watch hermes</a></li>
                            <li><a href="#">Apple watch SE</a></li>
                            <li><a href="#">Apple Watch series 9</a></li>
                            <li><a href="#">Apple watch ultra 2</a></li>
                            <!-- <li><a href="#">iphone 15</a></li> -->
                        </ul>
                    </div>
                    <img src="/CourseWork/devices/Watch/Apple watch series 9.png" alt="error">
                </div></li>
            <li style="position: relative;"><a href="/CourseWork/Htmls/Products/earpodPage.jsp">Earpods</a>
                <div class="mac">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, architecto delectus tempore hic temporibus dolores eos. Cum quidem nesciunt, consequatur ea maiores ipsum, molestias quaerat ut porro similique aspernatur ratione?</p>
                    <div class="laptop-list">
                        <ul>
                            <li><a href="#">Airpods 2nd Generation</a></li>
                            <li><a href="#">AirPods 3rd Generation</a></li>
                            <li><a href="#">Airpods pro 2nd Generation</a></li>
                            <li><a href="#">AirPods Pro Max</a></li>
                        </ul>
                    </div>
                    <img src="/CourseWork/devices/Earpods/AirPods Pro (2nd generation).jfif" alt="error">
                </div></li>
            <li><a href="/CourseWork/Htmls/aboutUs.jsp">about us</a></li>
        </ul>
    </section>
</body>
</html>