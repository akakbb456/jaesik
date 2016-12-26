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
		
		ServletConfig config = getServletConfig(); // 환경설정에 있는거 사용 (여기 서블릿에서만 사용 가능)
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		ServletContext context = getServletContext(); // 환경설정에 있는거 사용 (모든 서블릿에서 사용 가능하다)
		String subject = context.getInitParameter("subject");
		String score = context.getInitParameter("score");
		
		
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<html><body>");
		out.print("예제...<br>");
		out.print("이름:"+name+"<br>");
		out.print("나이:"+age+"<br>");
		out.print("과목:"+subject+"<br>");
		out.print("점수:"+score+"<br>");
		
		out.print("</body></html>");
		
	}
}
