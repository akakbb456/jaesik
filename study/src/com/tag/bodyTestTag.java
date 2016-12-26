package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class bodyTestTag extends TagSupport{
	private static final long serialVersionUID = 1L;

	private int count = 0;
	
	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().print("환영합니다. <br><b>");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return EVAL_BODY_INCLUDE;
	}
	
	@Override
	public int doAfterBody() throws JspException {
		if(count<5) {
			count++;
			try {
				pageContext.getOut().print("<br>"+count+":");
				return EVAL_BODY_AGAIN; //  바디를 다시 실행하라
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		try {
			count=0;
			pageContext.getOut().print("<br></b>님");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return EVAL_PAGE; // 페이지의 다음 내용 처리
	}
	
	
}
