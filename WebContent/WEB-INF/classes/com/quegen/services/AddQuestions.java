package com.quegen.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.quegen.db.DBUtil;
import com.quegen.services.TeacherData;
@WebServlet("/AddQuestions")
public class AddQuestions extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddQuestions() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String unit = request.getParameter("unit");
        int tid = TeacherData.getTid();
        String[] questions = new String[10]; // Assuming a maximum of 10 questions for illustration purposes
System.out.println("helooooooooooo");
        // Loop through the question input fields and retrieve the values
        for (int i = 1; i <= 10; i++) {
            String questionParamName = "que_" + i;
            String question = request.getParameter(questionParamName);
            if (question != null) {
                questions[i - 1] = question;
            }
        }

        System.out.println("heloooooooo");
        if (unit != null && questions != null) {
            DBUtil.saveQuestions(unit, questions, tid);
            response.sendRedirect("teacherDashboard.html"); // Redirect to the success page
        } else {
            response.sendRedirect("addQuestion.html");
        }
    }
}
