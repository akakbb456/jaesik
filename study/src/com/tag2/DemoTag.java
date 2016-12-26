package com.tag2;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.TagSupport;

public class DemoTag extends TagSupport implements DynamicAttributes{
	private static final long serialVersionUID = 1L;
	
	private String kind;
	private Map<String, Object> map = new HashMap<>();
	
	public void setKind(String kind) {
		this.kind = kind;
	}

	@Override
	public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
		map.put(localName, value);
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			out.print("kind: "+kind+"<br>");
			
			Iterator<String> it = map.keySet().iterator();
			while(it.hasNext()) {
				String key = it.next();
				Object value = map.get(key);
				out.print(key+":"+value+"<br>");
			}
		} catch (Exception e) {
			
		}
		return SKIP_BODY;
	}
	
	

}
