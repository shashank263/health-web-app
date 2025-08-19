package com.healthtracker.controller;

import com.healthtracker.model.HealthData;
import com.healthtracker.dao.HealthDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class HealthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String ageStr = req.getParameter("age");
        String stepsStr = req.getParameter("steps");

        try {
            int age = Integer.parseInt(ageStr);
            int steps = Integer.parseInt(stepsStr);

            HealthData data = new HealthData(name, age, steps);
            HealthDAO.add(data);

            req.setAttribute("healthData", data);
            req.setAttribute("all", HealthDAO.findAll());

            RequestDispatcher rd = req.getRequestDispatcher("/health.jsp");
            rd.forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Invalid input: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
            rd.forward(req, resp);
        }
    }

    // Optional: show list on GET
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("all", HealthDAO.findAll());
        RequestDispatcher rd = req.getRequestDispatcher("/health.jsp");
        rd.forward(req, resp);
    }
}

