

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sell Book</title>
        <%@include file="all_component/allCSS.jsp"%>
    </head>

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"/>
    </c:if>


    <body style="background-color: #f0f1f2;">
        <%@include file="all_component/navbar.jsp"%>



        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h5 class="text-center text-primary p-1">Sell Old Book</h5>

                            <c:if test="${not empty succMsg }">
                                <p class="text-center text-success">${succMsg }</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg }</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>

                            <form action="add_old_book" method="post" enctype="multipart/form-data">

                                <input type="hidden" value="${userobj.email}" name="user"> 


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="bName">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author's Name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="author">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input type="number" class="form-control" id="exampleInputPassword1" name="price">
                                </div>




                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload a photo</label>
                                    <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1"/>
                                </div>
                                <button type="submit" class="btn btn-primary">Sell</button>
                            </form>


                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
