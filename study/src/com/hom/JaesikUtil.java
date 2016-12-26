package com.hom;

//com.util�� �ִ� MyUtil�� ������ ��Ÿ�Ϸ� �����Ѱ��̴�

public class JaesikUtil {

   /**
    * 
    * @param numPerPage ��ȭ�鿡 ǥ���� ������ ����
    * @param dataCount     ��ü ������ ��
    * @return           �� ������ �� 
    */
   public int pageCount(int numPerPage, int dataCount) { // 10�̶� 50 ������ 5 => ���������� 5�� ��ȯ
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
    * @param current_page ���� ǥ���� ������
    * @param total_page   ��ü ������ �� 
    * @param list_url         ��ũ�� ������ �ּ�
    * @return            ����¡ ó�� ��� 
    */
   public String paging(int current_page, int total_page, String list_url) {
      StringBuffer sb = new StringBuffer();
      
      int numPerBlock=10;
      int currentPageSetup;
      int page, n;
      
      if(current_page<1||total_page<1)
    	  return "";
      
      if(list_url.indexOf("?")!=-1)
    	  list_url+="&"; // ?�� �����ϸ�
      else
    	  list_url+="?"; // ?�� ������
      
      // currentPageSetup: ǥ����������-1
      // 1. 57/10*10=50, 2. (60/10*10=60-10=50) �Ʒ� if���� 2���� ����̴�
      currentPageSetup=(current_page/numPerBlock)*numPerBlock; 
      
      if(current_page%numPerBlock==0)
    	  currentPageSetup=currentPageSetup-numPerBlock;
      //currentPageSetup==> 11: 10 |25: 20 | 39: 30 | 40: 30 | 41: 40
      // 1[����]
      n=currentPageSetup;
      if(total_page>numPerBlock&&currentPageSetup>0) { // currentPageSetup>0 �̶�°� 10������ �̻� �̶�� ��
    	  sb.append("<a href='"+list_url+"page=1'>[1]</a>");
    	  sb.append("&nbsp;<a href='"+list_url+"page="+n+"'>[����]</a>"); // 10page�������� ��������!!
      }
      // ����¡
      page=currentPageSetup+1; //currentPageSetup+1==> 11������: 11 |25: 21 | 39: 31 | 40: 31 | 41: 41
      while(page<=total_page && page<=(currentPageSetup+numPerBlock)) { // 25: (xx, 30)
    	  if(page==current_page) {
    		  sb.append("&nbsp;<span style='color:Fuchsia; font-size: '15';'>"+page+"</span>"); // ��ũ�����Ѱ� �ƴ� ���ڸ� ���̰�
    	  } else { 
    		  sb.append("&nbsp;<a href='"+list_url+"page="+page+"'>"+page+"</a>");
    	  }
    	  page++;
      } // 15->ũ�����:  11 12 13 14 (15)->��ũ �Ȱɸ� 16 17 18 19 20
      // [����] [��]
      n=currentPageSetup+1+numPerBlock; // 15������: 25
      if(n>total_page)
    	  n=total_page;
      if(total_page-currentPageSetup>numPerBlock) { // 15: (xx-10)>10
    	  sb.append("&nbsp;<a href='"+list_url+"page="+n+"'>[����]</a>");
    	  sb.append("&nbsp;<a href='"+list_url+"page="+total_page+"'>["+total_page+"]</a>");
      }
      return sb.toString();
   }
}