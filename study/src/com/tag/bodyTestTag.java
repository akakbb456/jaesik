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
			pageContext.getOut().print("ȯ���մϴ�. <br><b>");
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
				return EVAL_BODY_AGAIN; //  �ٵ� �ٽ� �����϶�
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
			pageContext.getOut().print("<br></b>��");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return EVAL_PAGE; // �������� ���� ���� ó��
	}
	
	
}
