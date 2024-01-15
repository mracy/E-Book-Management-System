
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success Page</title>
        <%@include file="all_component/allCSS.jsp"%>
    </head>
    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp"%>
        
        <div class="container text-center mt-3">
            <i class="fa-regular fa-circle-check fa-5x text-success"></i>
            <h1>Thank you</h1>
            <h2>Your Order Successfully</h2>
            <h5>With in 7 Days Your Product will be Delivered In you your Address</h5>
            <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
            <a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
        </div>
        
        
    </body>
</html>
