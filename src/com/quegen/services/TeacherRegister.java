package com.quegen.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quegen.db.ConnectDB;

/**
 * Servlet implementation class TeacherRegister
 */
@WebServlet("/TeacherRegister")
public class TeacherRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		String name = request.getParameter("name");
		String sub = request.getParameter("subject");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String status = "Not Approved";
		System.out.println(name);
		try 
		{
			Connection con = ConnectDB.getConnect();
			PreparedStatement ps1 = con.prepareStatement("insert into teachers values(?,?,?,?,?,?)");
			ps1.setInt(1, 0);
			ps1.setString(2, name);
			ps1.setString(3, sub);
			ps1.setString(4, email);
			ps1.setString(5, pass);
			ps1.setString(6, status);
			int i = ps1.executeUpdate();
			if(i>0){
				response.sendRedirect("teacherLogin.html");
			}else{
				response.sendRedirect("teacherRegister.html");
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
