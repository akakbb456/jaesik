package com.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TimerFilter implements Filter{
	private FilterConfig config;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}
	

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// request ����
		long before = System.currentTimeMillis();
		
		// ���� ����. �Ǵ� ������ �������̸� servlet�Ǵ� jsp����
		chain.doFilter(req, resp);
		
		// response ����
		long after = System.currentTimeMillis();
		
		String uri="";
		if(req instanceof HttpServletRequest) {
			HttpServletRequest request = (HttpServletRequest)req;
			uri = request.getRequestURI();
			config.getServletContext().log(uri+":"+(after-before)+"ms..."); // ������ ��ɾ �����ϴµ� �ɸ��� �ð��� ���Ѵ�
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
