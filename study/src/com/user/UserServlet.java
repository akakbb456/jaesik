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
						//ServletRequest:��û, ServletResponse:����
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Calendar cal = Calendar.getInstance();
		String s = String.format("%tF %tT", cal, cal);
		
		resp.setContentType("text/html;charset=utf-8"); // �ѱ��� ������ �ʰ��Ѵ�!!
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("������ "+s+"�Դϴ�.");
		out.println("</body></html>");
	} // service: Ŭ���̾�Ʈ�� ��û�Ҷ����� ����Ǵ� �޼ҵ�

	@Override
	public void destroy() {
		// ������ ����Ǳ� ���� �ѹ� ���� (��κ� ������ ����Ǵ� ����)
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config); // ������ �ʱ�ȭ(�� �ѹ��� ����)
	}

	
}
