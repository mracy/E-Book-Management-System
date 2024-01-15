

<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Book</title>
        <%@include file="all_component/allCSS.jsp"%>
        <style type="text/css">

            .crd-ho:hover{
                background-color: #fcf7f7;

            }

        </style>
    </head>
    <body>

        <%
            User u = (User) session.getAttribute("userobj");
        %>


        <%@include file="all_component/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row p-3">


                <%
                    String ch = request.getParameter("ch");
                    BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list2 = dao2.getBookBySearch(ch);
                    for (BookDtls b : list2) {
                %>

                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">

                            <img alt="" src="books/<%=b.getPhotoName()%>" style="width: 100px; height: 150px"
                                 class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <p>

                                <%
                                    if (b.getBookCategory().equals("Old")) {
                                %>
                                Categories: <%=b.getBookCategory()%></p>
                            <div class="row">


                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
                            </div>

                            <%
                                } else {%>
                            Categories: <%=b.getBookCategory()%>
                            <div class="row">

                                <%
                                    if (u == null) {
                                %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml">Add cart</a>

                                <%
                                } else {
                                %>
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml">Add cart</a>
                                <%}
                                %>

                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
                            </div> 

                            <%}
                            %>


                        </div>
                    </div>
                </div>
                <%
                    }
                %> 

            </div>

        </div>

    </body>
</html>
