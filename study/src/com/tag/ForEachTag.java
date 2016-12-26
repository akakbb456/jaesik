package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class ForEachTag extends TagSupport{
	private static final long serialVersionUID = 1L;
	
	private Integer begin, end, step;
	private String var;
	
	public void setBegin(Integer begin) {
		this.begin = begin;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public void setStep(Integer step) {
		this.step = step;
	}

	public void setVar(String var) {
		this.var = var;
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		if(step==null) step = 1;
		
		if(step==0||(begin>end&&step>0)||(begin<end&&step<0))  // 실행이 되지 않는 조건
			return SKIP_BODY;
		
		pageContext.setAttribute(var, begin);
		
		return EVAL_BODY_AGAIN; // body를 다시 재실행합니다.
	}
	
	@Override
	public int doAfterBody() throws JspException {
		// TODO Auto-generated method stub
		if(step>0 && end>=begin+step) {
			begin+=step;
			pageContext.setAttribute(var, begin);
			return EVAL_BODY_AGAIN;
		} else if(step<0 && end<=begin+step) {
			begin+=step;
			pageContext.setAttribute(var, begin);
			return EVAL_BODY_AGAIN;
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		begin=end=step=null;
		var=null;
		return EVAL_PAGE;
	}

	
	
}
