package com.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter{
	private String charset;

	@Override
	public void init(FilterConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		if(charset==null||charset.length()==0) 
			charset="UTF-8";
	}
	

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		req.setCharacterEncoding(charset);
		
		chain.doFilter(req, resp);
	}

	
	@Override
	public void destroy() {
		
	}
	
}
