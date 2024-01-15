<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Add Books</title>
        <%@include file="allCSS.jsp" %>
    </head>
    <body style="background-color: #f0f2f2;">
        <%@include file="navbar.jsp"%>

        <div class="container">
            <div class="row p-2">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center"> Edit Books </h4>

                           

                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                                BookDtls b = dao.getBookById(id);
                            %>



                            <form action="../editbooks" method="post">
                                <input type="hidden" name="id" value="<%=b.getBookId()%>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="bName" value="<%=b.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author's Name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="author" value="<%=b.getAuthor()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input type="number" class="form-control" id="exampleInputPassword1" name="price" value="<%=b.getPrice()%>">
                                </div>



                                <div class="form-group">
                                    <label for="inputState">Book Status</label>
                                    <select id="inputState" name="status" class="form-control">
                                        <%
                                            if ("Active".equals(b.getStatus())) {
                                        %>
                                         <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>
                                        <%
                                            }
                                          %>


                                    </select>
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 130px;">
            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
