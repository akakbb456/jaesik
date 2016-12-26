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
 
@WebServlet("/bbs/*") // 클라이언트가 무엇을 요청하든지 간에 주소줄에 분명히 bbs가 와야한다
public class BoardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L; // 직렬화.. 안하면 느낌표나옴
	// 네트워크 관련된 프로그램을 작성할 때 객체가 직렬화라는 과정을 거쳐야 한다!!
	// 해당되는 클래스를 검색할때 사용되어 지는 것!

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	} 
	
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(path); // path: 포워딩 할곳의 주소
		rd.forward(req, resp); // 포워딩
	} 
	
	// 모든일은 process에서 하도록 하겟다
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String uri=req.getRequestURI();
		String cp=req.getContextPath();
		
		BoardDAO dao = new BoardDAOImpl();
		MyUtil util = new MyUtil();
		if(uri.indexOf("list.do")!=-1) { // list.do가 주소에 존재하면 들어온다.
			// 글리스트
			String page=req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page=Integer.parseInt(page);
			
			// 검색 상태인 경우
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) { // 검색하지 않은경우!!
				searchKey="subject";
				searchValue=""; //검색아님
			}
			// GET 방식인 경우
			if(req.getMethod().equalsIgnoreCase("GET")) {
				// getMethode()는 get아니면 post가 나온다
				// equalsIgnoreCase: 대소문자를 구분하지 않고 비교하겠다
				searchValue=URLDecoder.decode(searchValue,"UTF-8");
				// %EC%9E%90%EB%B0%94 --> 자바 : 디코딩(반대의 경우 인코딩)
				// 즉 원래대로 돌리는 작업
			}
			
			int dataCount;
			int numPerPage=10;
			int total_page;
			
			if(searchValue.length()==0) // 검색이 아닌경우!!
				dataCount=dao.dataCount();
			else
				dataCount=dao.dataCount(searchKey, searchValue); // 검색이면 검색된것만 샌다!
			
			total_page=util.pageCount(numPerPage, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
			int start = (current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
			
			List<BoardDTO> list;
			if(searchValue.length()==0)// 검색이 아닌경우!!
				list=dao.listBoard(start, end);
			else
				list=dao.listBoard(start, end, searchKey, searchValue); // 검색된것만 가져와라!
			
			int listNum, n=0;
			Iterator<BoardDTO> it = list.iterator();
			
			Date endDate=new Date(); // util의 데이트
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			long gap;
			while(it.hasNext()) {
				BoardDTO dto = it.next();
				listNum=dataCount-(start+n-1); // 
				dto.setListNum(listNum);				
				n++;
				
				try {
					Date beginDate=sdf.parse(dto.getCreated());
					gap=(endDate.getTime()-beginDate.getTime())/(1000*60*60); // 시간구하기
					dto.setGap(gap);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				dto.setCreated(dto.getCreated().substring(0,10));
			}
			
			
			
			
			
			String params="";
			if(searchValue.length()!=0) { // 검색이면!, 서치키, 서치벨류를 들고다녀야 하므로 파람스를 정의한다
				params="searchKey="+searchKey; // 공백이 들어가면 안됨(주소창)
				params+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
				// 공백이 들어가면 안됨(주소창)
				// 서치벨류가 한글이면 인코딩한다
			}
			
			String listUrl=cp+"/bbs/list.do"; // list의 주소
			String articleUrl=cp+"/bbs/article.do?page="+current_page; // 글보기 주소
			if(params.length()!=0) {
				listUrl+="?"+params;
				articleUrl+="&"+params;
			}
			
			
			String paging=util.paging(current_page, total_page,listUrl);
			// list.jsp 페이지에 넘길 데이터
			req.setAttribute("list", list); // 리스트에 출력할 데이터
			req.setAttribute("dataCount", dataCount); // 데이터개수
			req.setAttribute("page", current_page); // 페이지번호
			req.setAttribute("total_page", total_page); // 전체페이지수
			req.setAttribute("articleUrl", articleUrl); // 
			req.setAttribute("paging", paging); // 페이징처리
			
			forward(req, resp, "/WEB-INF/views/bbs/list.jsp");
			
		}else if(uri.indexOf("created.do")!=-1) {
			// 글작성폼
			
			req.setAttribute("mode", "created");// EL에서는 ${mode}
			
			forward(req, resp, "/WEB-INF/views/bbs/created.jsp");
		}else if(uri.indexOf("created_ok.do")!=-1) {
			BoardDTO dto = new BoardDTO();
			dto.setName(req.getParameter("name"));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setIpAddr(req.getRemoteAddr()); // ip주소
			
			dao.insertBoard(dto);
			
			resp.sendRedirect(cp+"/bbs/list.do"); // 리다이렉트시에는 반드시 ContextPath를 더해줘야합니다!
		}else if(uri.indexOf("article.do")!=-1) {
			// 글보기
			int num=Integer.parseInt(req.getParameter("num"));
			String page = req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue"); 
			// 클라이언트가 보내는 것: 글번호, 페이지, 검색컬럼, 검색값 !!!
			// 검색컬럼, 검색값은 안올수도 있다.
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue, "UTF-8");
			
			// 조회수 증가
			dao.updateHitCount(num);
			
			//게시물 가져오기
			BoardDTO dto = dao.readBoard(num);
			if(dto==null) { // 게시물을 가져오리라는 보장이 없다!! 없으면 다시 페이지값을 가지고 리스트로 돌아온다.
				resp.sendRedirect(cp+"/bbs/list.do?page="+page);
				return;
			}
			
			int linesu=dto.getContent().split("\n").length;
			dto.setContent(dto.getContent().replaceAll("\n", "<br>")); // 줄바꿈이 되도록!!
			// 이전글 다음글
			BoardDTO preDto=dao.preReadBoard(num, searchKey, searchValue);
			BoardDTO nextDto=dao.nextReadBoard(num, searchKey, searchValue);
			
			
			String params="page="+page; 
			if(searchValue.length()!=0) { // 검색상태이면 검색키, 검색값을 저장
				params+="&searchKey="+searchKey;
				params+="&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			// 포워딩 JSP에 넘길 데이터
			req.setAttribute("dto", dto);
			req.setAttribute("linesu", linesu);
			req.setAttribute("page", page);
			req.setAttribute("params", params);
			
			req.setAttribute("preDto", preDto);
			req.setAttribute("nextDto", nextDto);
			//jsp로 포워딩
			forward(req,resp,"/WEB-INF/views/bbs/article.jsp");
		}else if(uri.indexOf("pwd.do")!=-1) {
			String mode=req.getParameter("mode");
			String page=req.getParameter("page");
			int num=Integer.parseInt(req.getParameter("num"));
			
			String title="수정";
			if(mode.equals("delete"))
				title="삭제";
			
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
	         String title="수정";
	         if(mode.equals("delete"))
	        	 title="삭제";
	         
	         req.setAttribute("title", title);
	         req.setAttribute("mode", mode); // 수정인지 삭제인지가 mode
	         req.setAttribute("num", num);
	         req.setAttribute("page", page);
	         req.setAttribute("message", "패스워드가 일치하지 않습니다");
	         
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

