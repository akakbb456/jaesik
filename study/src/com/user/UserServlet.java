package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class UserServlet extends GenericServlet{
						//ServletRequest:요청, ServletResponse:응답
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Calendar cal = Calendar.getInstance();
		String s = String.format("%tF %tT", cal, cal);
		
		resp.setContentType("text/html;charset=utf-8"); // 한글이 깨지지 않게한다!!
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("오늘은 "+s+"입니다.");
		out.println("</body></html>");
	} // service: 클라이언트가 요청할때마다 실행되는 메소드

	@Override
	public void destroy() {
		// 서블릿이 종료되기 직전 한번 실행 (대부분 서버가 종료되는 시점)
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config); // 서블릿을 초기화(단 한번만 실행)
	}

	
}
