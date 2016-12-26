package com.bbs;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyUtil;
 
@WebServlet("/bbs/*") // Ŭ���̾�Ʈ�� ������ ��û�ϵ��� ���� �ּ��ٿ� �и��� bbs�� �;��Ѵ�
public class BoardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L; // ����ȭ.. ���ϸ� ����ǥ����
	// ��Ʈ��ũ ���õ� ���α׷��� �ۼ��� �� ��ü�� ����ȭ��� ������ ���ľ� �Ѵ�!!
	// �ش�Ǵ� Ŭ������ �˻��Ҷ� ���Ǿ� ���� ��!

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	} 
	
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(path); // path: ������ �Ұ��� �ּ�
		rd.forward(req, resp); // ������
	} 
	
	// ������� process���� �ϵ��� �ϰٴ�
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uri=req.getRequestURI();
		String cp=req.getContextPath();
		
		BoardDAO dao = new BoardDAOImpl();
		MyUtil util = new MyUtil();
		if(uri.indexOf("list.do")!=-1) { // list.do�� �ּҿ� �����ϸ� ���´�.
			// �۸���Ʈ
			String page=req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page=Integer.parseInt(page);
			
			// �˻� ������ ���
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) { // �˻����� �������!!
				searchKey="subject";
				searchValue=""; //�˻��ƴ�
			}
			// GET ����� ���
			if(req.getMethod().equalsIgnoreCase("GET")) {
				// getMethode()�� get�ƴϸ� post�� ���´�
				// equalsIgnoreCase: ��ҹ��ڸ� �������� �ʰ� ���ϰڴ�
				searchValue=URLDecoder.decode(searchValue,"UTF-8");
				// %EC%9E%90%EB%B0%94 --> �ڹ� : ���ڵ�(�ݴ��� ��� ���ڵ�)
				// �� ������� ������ �۾�
			}
			
			int dataCount;
			int numPerPage=10;
			int total_page;
			
			if(searchValue.length()==0) // �˻��� �ƴѰ��!!
				dataCount=dao.dataCount();
			else
				dataCount=dao.dataCount(searchKey, searchValue); // �˻��̸� �˻��Ȱ͸� ����!
			
			total_page=util.pageCount(numPerPage, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
			int start = (current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
			
			List<BoardDTO> list;
			if(searchValue.length()==0)// �˻��� �ƴѰ��!!
				list=dao.listBoard(start, end);
			else
				list=dao.listBoard(start, end, searchKey, searchValue); // �˻��Ȱ͸� �����Ͷ�!
			
			int listNum, n=0;
			Iterator<BoardDTO> it = list.iterator();
			
			Date endDate=new Date(); // util�� ����Ʈ
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			long gap;
			while(it.hasNext()) {
				BoardDTO dto = it.next();
				listNum=dataCount-(start+n-1); // 
				dto.setListNum(listNum);				
				n++;
				
				try {
					Date beginDate=sdf.parse(dto.getCreated());
					gap=(endDate.getTime()-beginDate.getTime())/(1000*60*60); // �ð����ϱ�
					dto.setGap(gap);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				dto.setCreated(dto.getCreated().substring(0,10));
			}
			
			
			
			
			
			String params="";
			if(searchValue.length()!=0) { // �˻��̸�!, ��ġŰ, ��ġ������ ���ٳ�� �ϹǷ� �Ķ����� �����Ѵ�
				params="searchKey="+searchKey; // ������ ���� �ȵ�(�ּ�â)
				params+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
				// ������ ���� �ȵ�(�ּ�â)
				// ��ġ������ �ѱ��̸� ���ڵ��Ѵ�
			}
			
			String listUrl=cp+"/bbs/list.do"; // list�� �ּ�
			String articleUrl=cp+"/bbs/article.do?page="+current_page; // �ۺ��� �ּ�
			if(params.length()!=0) {
				listUrl+="?"+params;
				articleUrl+="&"+params;
			}
			
			
			String paging=util.paging(current_page, total_page,listUrl);
			// list.jsp �������� �ѱ� ������
			req.setAttribute("list", list); // ����Ʈ�� ����� ������
			req.setAttribute("dataCount", dataCount); // �����Ͱ���
			req.setAttribute("page", current_page); // ��������ȣ
			req.setAttribute("total_page", total_page); // ��ü��������
			req.setAttribute("articleUrl", articleUrl); // 
			req.setAttribute("paging", paging); // ����¡ó��
			
			forward(req, resp, "/WEB-INF/views/bbs/list.jsp");
			
		}else if(uri.indexOf("created.do")!=-1) {
			// ���ۼ���
			
			req.setAttribute("mode", "created");// EL������ ${mode}
			
			forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
		}else if(uri.indexOf("created_ok.do")!=-1) {
			BoardDTO dto = new BoardDTO();
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setIpAddr(req.getRemoteAddr()); // ip�ּ�
			
			dao.insertBoard(dto);
			
			resp.sendRedirect(cp+"/bbs/list.do"); // �����̷�Ʈ�ÿ��� �ݵ�� ContextPath�� ��������մϴ�!
		}else if(uri.indexOf("article.do")!=-1) {
			// �ۺ���
			int num=Integer.parseInt(req.getParameter("num"));
			String page = req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue"); 
			// Ŭ���̾�Ʈ�� ������ ��: �۹�ȣ, ������, �˻��÷�, �˻��� !!!
			// �˻��÷�, �˻����� �ȿü��� �ִ�.
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue, "UTF-8");
			
			// ��ȸ�� ����
			dao.updateHitCount(num);
			
			//�Խù� ��������
			BoardDTO dto = dao.readBoard(num);
			if(dto==null) { // �Խù��� ����������� ������ ����!! ������ �ٽ� ���������� ������ ����Ʈ�� ���ƿ´�.
				resp.sendRedirect(cp+"/bbs/list.do?page="+page);
				return;
			}
			
			int linesu=dto.getContent().split("\n").length;
			dto.setContent(dto.getContent().replaceAll("\n", "<br>")); // �ٹٲ��� �ǵ���!!
			// ������ ������
			BoardDTO preDto=dao.preReadBoard(num, searchKey, searchValue);
			BoardDTO nextDto=dao.nextReadBoard(num, searchKey, searchValue);
			
			
			String params="page="+page; 
			if(searchValue.length()!=0) { // �˻������̸� �˻�Ű, �˻����� ����
				params+="&searchKey="+searchKey;
				params+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			// ������ JSP�� �ѱ� ������
			req.setAttribute("dto", dto);
			req.setAttribute("linesu", linesu);
			req.setAttribute("page", page);
			req.setAttribute("params", params);
			
			req.setAttribute("preDto", preDto);
			req.setAttribute("nextDto", nextDto);
			//jsp�� ������
			forward(req,resp,"/WEB-INF/views/bbs/article.jsp");
		}else if(uri.indexOf("pwd.do")!=-1) {
			String mode=req.getParameter("mode");
			String page=req.getParameter("page");
			int num=Integer.parseInt(req.getParameter("num"));
			
			String title="����";
			if(mode.equals("delete"))
				title="����";
			
			req.setAttribute("mode", mode);
			req.setAttribute("page", page);
			req.setAttribute("num", num);
			req.setAttribute("title", title);
			
			forward(req, resp, "/WEB-INF/views/bbs/pwd.jsp");
		}else if(uri.indexOf("pwd_ok.do")!=-1){
	         String mode = req.getParameter("mode");
	         String page = req.getParameter("page");
	         int num = Integer.parseInt(req.getParameter("num"));
	         String pwd = req.getParameter("pwd");
	         
	         BoardDTO dto = dao.readBoard(num);
	         if(dto==null){
	            resp.sendRedirect(cp+"/bbs/list.do?page="+page);
	            return;
	         }
	         if(dto.getPwd().equals(pwd)){
	            if(mode.equals("delete")){
	               dao.deleteBoard(num);
	               resp.sendRedirect(cp+"/bbs/list.do?page="+page);
	               return;
	            }else{
	               req.setAttribute("mode", mode);
	               req.setAttribute("dto", dto);
	               req.setAttribute("page", page);
	               forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
	               return;
	            }
	         }
	         String title="����";
	         if(mode.equals("delete"))
	        	 title="����";
	         
	         req.setAttribute("title", title);
	         req.setAttribute("mode", mode); // �������� ���������� mode
	         req.setAttribute("num", num);
	         req.setAttribute("page", page);
	         req.setAttribute("message", "�н����尡 ��ġ���� �ʽ��ϴ�");
	         
	         forward(req, resp, "/WEB-INF/views/bbs/pwd.jsp");
	         
	      }else if(uri.indexOf("update_ok.do")!=-1) {
	    	  BoardDTO dto = new BoardDTO();
	    	  dto.setNum(Integer.parseInt(req.getParameter("num")));
	    	  dto.setSubject(req.getParameter("subject"));
	    	  dto.setContent(req.getParameter("content"));
	    	  dto.setPwd(req.getParameter("pwd"));
	    	  dto.setName(req.getParameter("name"));
	    	  
	    	  String page = req.getParameter("page");
	    	  
	    	  dao.updateBoard(dto);
	    	  
	    	  resp.sendRedirect(cp+"/bbs/list.do?page="+page);
	    	  
	      }
		
	   }
	} 

