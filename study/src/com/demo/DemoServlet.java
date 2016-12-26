package com.demo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/demo")
public class DemoServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String result;
		try{
			String name = req.getParameter("name"); 
			// http://localhost:9090/study/demo?name=홍길동&age=20  --> 주소창 입력!!
			String _age = req.getParameter("age");
			int age = Integer.parseInt(_age);
			
			result = name+"님은";
			if(age>=19)
				result+="성인입니다.";
			else
				result+="미성년자입니다.";
		} catch(Exception e) {
			result = "잘못된 정보 입니다.";
		}
		
		resp.setContentType("text/html;charset=utf-8"); // 한글이 깨지지 않게한다!!
		PrintWriter out = resp.getWriter();
		
		out.print("<html><body>");
		out.print("GET방식에 의한 접근...<br>");
		out.print(result);
		out.print("</body></html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String result;
		
		req.setCharacterEncoding("utf-8"); // post방식일때 인코딩방식을 바꾸는 방법 (한글안깨짐)
		
		try{
			String name = req.getParameter("name"); 
			// http://localhost:9090/study/demo?name=홍길동&age=20  --> 주소창 입력!!
			String _age = req.getParameter("age");
			int age = Integer.parseInt(_age);
			
			result = name+"님은";
			if(age>=19)
				result+="성인입니다.";
			else
				result+="미성년자입니다.";
		} catch(Exception e) {
			result = "잘못된 정보 입니다.";
		}
		
		
		
		resp.setContentType("text/html;charset=utf-8"); // 한글이 깨지지 않게한다!!
		PrintWriter out = resp.getWriter();
		
		out.print("<html><body>");
		out.print("POST방식에 의한 접근...<br>");
		out.print(result);
		out.print("</body></html>");
	}
	
}
