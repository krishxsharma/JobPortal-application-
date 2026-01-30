package com.jobportal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if ("admin@gmail.com".equals(email) && "1234".equals(password)) {
            req.getSession().setAttribute("user", email);
            resp.sendRedirect("jobs");
        } else {
            resp.getWriter().println("Invalid Login");
        }
    }
}
