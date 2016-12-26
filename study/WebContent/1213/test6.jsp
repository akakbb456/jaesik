<%@page import="java.util.ArrayList"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	List<GuestDTO> list = new ArrayList<>();
	
	GuestDTO dto;
	dto=new GuestDTO();
	dto.setNum(1);
	dto.setName("자바");
	dto.setContent("자바란 ???");
	list.add(dto);
	
	dto=new GuestDTO();
	dto.setNum(2);
	dto.setName("스프링");
	dto.setContent("스프링은 ???");
	list.add(dto);
	
	dto=new GuestDTO();
	dto.setNum(3);
	dto.setName("HTML");
	dto.setContent("웹이란 ???");
	list.add(dto);
	
	request.setAttribute("list", list);
%>

<jsp:forward page="test6_ok.jsp"/>