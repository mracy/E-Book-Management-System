
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting Page</title>

        <%@include file="all_component/allCSS.jsp"%>

        <style type="text/css">

            a{
                text-decoration: black;
                color: black;


            }

            a:hover{
                text-decoration: none;
            }


        </style>
    </head>


    <body style="background-color: #f7f7f7;" > 
        
        <c:if test="${empty userobj}">
            <c:redirect url="login.jsp"/>
        </c:if>
              
        <%@include file="all_component/navbar.jsp"%>

        <div class="conatiner">
            
                <h3 class="text-center">Hello, ${userobj.name}</h3>
           
            
            <div class="row p-5">
                <div class="col-md-4">
                    
                    <a href="sell_book.jsp">
                        
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-book-open fa-3x"></i>
                                </div>
                                <h4>Sell Old Book</h4>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4">
                    
                    <a href="old_book.jsp">
                        
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-book-open fa-3x"></i>
                                </div>
                                <h4>Old Book</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-id-card fa-3x"></i>
                                </div>
                                <h4>Edit Profile</h4>
                            </div>
                        </div>
                    </a>
                </div>

                

                <div class="col-md-6 mt-3">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fa-solid fa-box fa-3x"></i>
                                </div>
                                <h4>My Order</h4>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-md-6 mt-3">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-user-circle fa-3x"></i>
                                </div>
                                <h4>Help Center</h4>
                                <p>24*7 Service </p>
                            </div>
                        </div>
                    </a>
                </div>


            </div>
        </div>
        
          <%@include file="all_component/footer.jsp"%>

    </body >
</html>
