
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User: Old Book</title>
        <%@include file="all_component/allCSS.jsp"%>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp"%>
        <div class="alert alert-success text-center">${succMsg}</div>
        <c:if test="${not empty succMsg }">

            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <div class="container p-5">
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        User u = (User) session.getAttribute("userobj");
                        String email = u.getEmail();
                        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                        List<BookDtls> list = dao.getBookByOld(email, "Old");
                        for (BookDtls b : list) {%>

                    <tr>

                        <td><%=b.getBookName()%></td>
                        <td><%=b.getAuthor()%></td>
                        <td><%=b.getPrice()%></td>
                        <td><%=b.getBookCategory()%></td>
                        <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>" 
                               class="btn btn-sm btn-danger">Delete</td>

                    </tr>
                    <%}
                    %>
                </tbody>
            </table>
        </div>

    </body>
</html>
