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
			// http://localhost:9090/study/demo?name=ȫ�浿&age=20  --> �ּ�â �Է�!!
			String _age = req.getParameter("age");
			int age = Integer.parseInt(_age);
			
			result = name+"����";
			if(age>=19)
				result+="�����Դϴ�.";
			else
				result+="�̼������Դϴ�.";
		} catch(Exception e) {
			result = "�߸��� ���� �Դϴ�.";
		}
		
		resp.setContentType("text/html;charset=utf-8"); // �ѱ��� ������ �ʰ��Ѵ�!!
		PrintWriter out = resp.getWriter();
		
		out.print("<html><body>");
		out.print("GET��Ŀ� ���� ����...<br>");
		out.print(result);
		out.print("</body></html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String result;
		
		req.setCharacterEncoding("utf-8"); // post����϶� ���ڵ������ �ٲٴ� ��� (�ѱ۾ȱ���)
		
		try{
			String name = req.getParameter("name"); 
			// http://localhost:9090/study/demo?name=ȫ�浿&age=20  --> �ּ�â �Է�!!
			String _age = req.getParameter("age");
			int age = Integer.parseInt(_age);
			
			result = name+"����";
			if(age>=19)
				result+="�����Դϴ�.";
			else
				result+="�̼������Դϴ�.";
		} catch(Exception e) {
			result = "�߸��� ���� �Դϴ�.";
		}
		
		
		
		resp.setContentType("text/html;charset=utf-8"); // �ѱ��� ������ �ʰ��Ѵ�!!
		PrintWriter out = resp.getWriter();
		
		out.print("<html><body>");
		out.print("POST��Ŀ� ���� ����...<br>");
		out.print(result);
		out.print("</body></html>");
	}
	
}
