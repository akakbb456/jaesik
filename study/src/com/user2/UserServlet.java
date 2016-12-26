package com.user2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		ServletConfig config = getServletConfig(); // ȯ�漳���� �ִ°� ��� (���� ���������� ��� ����)
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		ServletContext context = getServletContext(); // ȯ�漳���� �ִ°� ��� (��� �������� ��� �����ϴ�)
		String subject = context.getInitParameter("subject");
		String score = context.getInitParameter("score");
		
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><body>");
		out.print("����...<br>");
		out.print("�̸�:"+name+"<br>");
		out.print("����:"+age+"<br>");
		out.print("����:"+subject+"<br>");
		out.print("����:"+score+"<br>");
		
		out.print("</body></html>");
		
	}
}
