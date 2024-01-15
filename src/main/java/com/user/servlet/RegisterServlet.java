package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            {
                String name = req.getParameter("fname");
                String email = req.getParameter("email");
                String phno = req.getParameter("phno");
                String password = req.getParameter("password");
                String check = req.getParameter("check");

                //System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
                User us = new User();
                us.setName(name);
                us.setEmail(email);
                us.setPhno(phno);
                us.setPassword(password);

                HttpSession session = req.getSession();
                if (check != null) {

                    UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
                    dao.checkUser(email);
                    
                    boolean f2=dao.checkUser(email);
                    if(f2)
                    {
                        
                        boolean f = dao.userRegister(us);

                    if (f) {
                        //System.out.println("User Register Success..");

                        session.setAttribute("succMsg", "Registration Success..");
                        resp.sendRedirect("register.jsp");
                    } else {
                        //System.out.println("Something is wrong on server..");
                        session.setAttribute("failedMsg", "Something is wrong on server..");
                        resp.sendRedirect("register.jsp");
                    }
                        
                    }else{
                        
                        session.setAttribute("failedMsg", "User Already Exist Try Anotehr Email Id");
                        resp.sendRedirect("register.jsp");
                    
                    }
                    
                } else {

                    //System.out.println("Please check Agree & Terms Condtion");
                    session.setAttribute("failedMsg", "Please check Agree & Terms Condtion");
                    resp.sendRedirect("register.jsp");
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
