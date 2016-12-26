package com.util;

public class MyUtil {

   /**
    * 
    * @param numPerPage 한화면에 표시할 데이터 개수
    * @param dataCount     전체 데이터 수
    * @return           총 페이지 수 
    */
   public int pageCount(int numPerPage, int dataCount) { // 10이랑 50 들어오면 5 => 페이지개수 5를 반환
      int result = 0;
      
      if(dataCount>0){
         result = dataCount/numPerPage;
         
         if(dataCount%numPerPage!=0)
            result+=1;
      }
      
      return result;
   }
   /**
    * 
    * @param current_page 현재 표시할 페이지
    * @param total_page   전체 페이지 수 
    * @param list_url         링크를 설정할 주소
    * @return            페이징 처리 결과 
    */
   public String paging(int current_page, int total_page, String list_url) {
      StringBuffer sb = new StringBuffer();
      
      int numPerBlock=10;
      int currentPageSetup;
      int page, n;
      
      if(current_page<1||total_page<1)
    	  return "";
      
      if(list_url.indexOf("?")!=-1)
    	  list_url+="&"; // ?이 존재하면
      else
    	  list_url+="?"; // ?이 없으면
      
      // currentPageSetup: 표시할페이지-1
      // 1. 57/10*10=50, 2. (60/10*10=60-10=50) 아래 if문은 2번의 경우이다
      currentPageSetup=(current_page/numPerBlock)*numPerBlock; 
      
      if(current_page%numPerBlock==0)
    	  currentPageSetup=currentPageSetup-numPerBlock;
      //currentPageSetup==> 11: 10 |25: 20 | 39: 30 | 40: 30 | 41: 40
      // 1[이전]
      n=current_page-numPerBlock;
      if(total_page>numPerBlock&&currentPageSetup>0) { // currentPageSetup>0 이라는건 10페이지 이상 이라는 뜻
    	  sb.append("<a href='"+list_url+"page=1'>[처음]</a>");
    	  sb.append("&nbsp;<a href='"+list_url+"page="+n+"'>[이전]</a>"); // 10page이전으로 가기위해!!
      }
      // 페이징
      page=currentPageSetup+1; //currentPageSetup+1==> 11: 11 |25: 21 | 39: 31 | 40: 31 | 41: 41
      while(page<=total_page && page<=(currentPageSetup+numPerBlock)) {
    	  if(page==current_page) {
    		  sb.append("&nbsp;<span style='color:Fuchsia;'>"+page+"</span>"); // 링크설정한거 아님 숫자만 보이게
    	  } else {
    		  sb.append("&nbsp;<a href='"+list_url+"page="+page+"'>"+page+"</a>");
    	  }
    	  page++;
      }
      // [다음] [끝]
      n=current_page+numPerBlock;
      if(n>total_page)
    	  n=total_page;
      if(total_page-currentPageSetup>numPerBlock) {
    	  sb.append("&nbsp;<a href='"+list_url+"page="+n+"'>[다음]</a>");
    	  sb.append("&nbsp;<a href='"+list_url+"page="+total_page+"'>[끝]</a>");
      }
      
      
      return sb.toString();
   }
   
   
  
   
}