<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ page import="betago.dao.impl.ItemsDAOImpl"%>
<%@ page import="betago.entity.Items"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Products</title>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,600,700|Roboto:300,100"
	rel="stylesheet">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->
<link rel="stylesheet" href="css/list-style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="css/flexslider.css">


<link rel="stylesheet" href="css/font-awesome_home.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
<script src="js/respond.min.js"></script>
<![endif]-->
<script src="js/jquery-1.12.0.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>

<body>
                <% 
                String username =(String)session.getAttribute("username");
               %>
        
  	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo"><a href="list.jsp">Shop.</a></div>
				</div>
				<div class="col-md-6 col-xs-6 text-center menu-1">
					<ul>
						<li>
							<a href="index.jsp">Natum</a>
							
						</li>
						<li>
							<a href="list.jsp">Products</a>
							
						</li>
						
						<li>
							<a href="service.jsp">Services</a>
							
						</li>
						<li><a href="community.jsp">Community</a></li>
		<%
	    if(username==null) {
	    %>
						<li><a href="login.jsp">Sign In</a></li>
						<%}
						else{ %>
						<li><a href="login.jsp">Change account</a></li>
						<%} %>
					</ul>
				</div>
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
					    
						<li class="search">
							<div class="input-group">
							  
						      <form  method="post" action="searchlist.jsp" >
							  <input type="text" name="searchName" class="search" placeholder="Search" />		
							  <a><i class="fa fa-search"></i></a>		          						     					      
				              </form>
						      
						    </div>
						</li>
						<% if(username != null) {%>
						<li class="shopping-cart"><a href="cartlist.jsp" class="cart"><span><i class="icon-shopping-cart"></i></span></a></li>
						<%} %>
					</ul>
				</div>
			</div>
		</div>
	</nav>
    
    <% 
	if(username!=null) {
	            %>
	            <div class="float-button">
                    <div class="float-container">
                        <ul>
						<li><a href="cartlist.jsp">CART</a></li>
						<li><a href="myorder.jsp">ORDER</a></li>             
                        <li><a href="index.jsp">HOME</a></li>
                        </ul>
                        </div>
                </div><!--end of float-button-->
	            <%}%>  
        
    <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(images/img_bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Product</h1>
							<h2>Learn more about our company <a href="index.jsp" target="_blank">Natum.com</a></h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
<div class=outer>   
        
    <div class="frontBG-container">
                   
    </div><!--end of frontBG-container-->
   <div class="background">
	<div class="product-area pb-80">
		<div class="container">
			<div class="section-title text-center mb-20">
				<h2><strong>---</strong></h2>
			</div>
			<div class="product-tab-list text-center mb-60 nav product-menu-mrg"
				role="tablist">
				<a class="active" href="#list" data-toggle="tab" role="tab"
					aria-selected="true" aria-controls="list">
					<h4>All Products</h4>
				</a> <a href="#list1" data-toggle="tab" role="tab" aria-selected="false"
					aria-controls="list1">
					<h4>Beta Dog</h4>
				</a> <a href="#list2" data-toggle="tab" role="tab" aria-selected="false"
					aria-controls="list2">
					<h4>Beta Watch</h4>
				</a> <a href="#list3" data-toggle="tab" role="tab" aria-selected="false"
					aria-controls="list3">
					<h4>Beta Glasses</h4>
				</a>
			</div>
			<div class="tab-content">
				<%
					ItemsDAOImpl itemsDao = new ItemsDAOImpl();
					ArrayList<Items> list = itemsDao.getAllItems();
				%>

				<div class="tab-pane active" id="list" role="tabpanel">
					<div class="row">
						<%
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									Items item1 = list.get(i);
						%>
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="product-wrapper mb-45">
								<div class="product-img">
									<a href="detail.jsp?productID=<%=item1.getId()%>"> <img
										src="picture/product/<%=item1.getImg_name()%>_<%=item1.getImg_num()%>.png"
										alt="">
									</a>
									<!--  <span>30% off</span> -->
								</div>
								<div class="product-content text-center">
									<h4>
										<a href="detail.jsp?productID=<%=item1.getId()%>"><%=item1.getName()%></a>
									</h4>
									<div class="product-price">
										<!-- <span class="old"></span> -->
										<span>$<%=item1.getPrice()%></span>
									</div>
								</div>
							</div>
						</div>

						<%
							}
							}
						%>
					</div>
				</div>




				<div class="tab-pane" id="list1" role="tabpanel">
					<div class="row">
						<%
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									Items item1 = list.get(i);
									if (item1.getClassfication().equals("Beta Dog")) {
						%>
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="product-wrapper mb-45">
								<div class="product-img">
									<a href="detail.jsp?productID=<%=item1.getId()%>"> <img
										src="picture/product/<%=item1.getImg_name()%>_<%=item1.getImg_num()%>.png"
										alt="">
									</a>
									<!--  <span>30% off</span> -->
								</div>
								<div class="product-content text-center">
									<h4>
										<a href="detail.jsp?productID=<%=item1.getId()%>"><%=item1.getName()%></a>
									</h4>
									<div class="product-price">
										<!-- <span class="old"></span> -->
										<span>$<%=item1.getPrice()%></span>
									</div>
								</div>
							</div>
						</div>

						<%
							}
								}
							}
						%>
					</div>
				</div>


				<div class="tab-pane" id="list2" role="tabpanel">
					<div class="row">
						<%
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									Items item1 = list.get(i);
									if (item1.getClassfication().equals("Beta Watch")) {
						%>
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="product-wrapper mb-45">
								<div class="product-img">
									<a href="detail.jsp?productID=<%=item1.getId()%>"> <img
										src="picture/product/<%=item1.getImg_name()%>_<%=item1.getImg_num()%>.png"
										alt="">
									</a>
									<!--  <span>30% off</span> -->
								</div>
								<div class="product-content text-center">
									<h4>
										<a href="detail.jsp?productID=<%=item1.getId()%>"><%=item1.getName()%></a>
									</h4>
									<div class="product-price">
										<!-- <span class="old"></span> -->
										<span>$<%=item1.getPrice()%></span>
									</div>
								</div>
							</div>
						</div>

						<%
							}
								}
							}
						%>
					</div>
				</div>



				<div class="tab-pane" id="list3" role="tabpanel">
					<div class="row">
						<%
							if (list != null && list.size() > 0) {
								for (int i = 0; i < list.size(); i++) {
									Items item1 = list.get(i);
									if (item1.getClassfication().equals("Beta Glasses")) {
						%>
						<div class="col-md-6 col-lg-4 col-xl-3">
							<div class="product-wrapper mb-45">
								<div class="product-img">
									<a href="detail.jsp?productID=<%=item1.getId()%>"> <img
										src="picture/product/<%=item1.getImg_name()%>_<%=item1.getImg_num()%>.png"
										alt="">
									</a>
									<!--  <span>30% off</span> -->
								</div>
								<div class="product-content text-center">
									<h4>
										<a href="detail.jsp?productID=<%=item1.getId()%>"><%=item1.getName()%></a>
									</h4>
									<div class="product-price">
										<!-- <span class="old"></span> -->
										<span>$<%=item1.getPrice()%></span>
									</div>
								</div>
							</div>
						</div>

						<%
							}
								}
							}
						%>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
	
	</div>
	<footer id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row row-pb-md">
				<div class="col-md-4 fh5co-widget">
					<h3>Shop.</h3>
					<p>You could completely trust our product and services.</p>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="about.jsp">About</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Meetups</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="list.jsp">Shop</a></li>
						<li><a href="#">Privacy</a></li>
						<li><a href="#">Testimonials</a></li>
						<li><a href="#">Handbook</a></li>
						<li><a href="#">Held Desk</a></li>
					</ul>
				</div>

				<div class="col-md-2 col-sm-4 col-xs-6 col-md-push-1">
					<ul class="fh5co-footer-links">
						<li><a href="#">Find Designers</a></li>
						<li><a href="#">Find Developers</a></li>
						<li><a href="#">Teams</a></li>
						<li><a href="#">Advertise</a></li>
						<li><a href="#">API</a></li>
					</ul>
				</div>
			</div>

			<div class="row copyright">
				<div class="col-md-12 text-center">
					<p>
						<small class="block">&copy; 2015 Natum. All Rights Reserved.</small> </p>
					<p>
						<ul class="fh5co-social-icons">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	
</body>
</html>
