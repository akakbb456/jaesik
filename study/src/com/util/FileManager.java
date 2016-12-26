package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	// 일반적으로 송수신할때 euc-kr형태로 이루어진다.
	// 8859-1로 보내지 않으면 한글이 다 깨져버린다.
	/**
	 * 
	 * @param saveFilename 서버에저장된 파일명
	 * @param originalFilename 클라이언트가 업로드한 파일명
	 * @param pathname 서버에저장된 위치
	 * @param resp HttpServletResponse
	 * @return 다운로드 성공여부
	 */   
	public static boolean filedownload(String saveFilename, String originalFilename, String pathname, HttpServletResponse resp) {
		boolean result = false;
		if(saveFilename==null || originalFilename==null)
			return result;
		try {
			originalFilename = new String(originalFilename.getBytes("euc-kr"), "8859_1"); //euc-kr -> 8859_1로 바꾸는 과정
			pathname = pathname += File.separator+saveFilename;
			File f = new File(pathname);
			if(!f.exists())
				return result;
			
			resp.setContentType("application/octet-stream"); // 스트림을 전송하겠다 
			
			// 파일명은 헤더
			resp.setHeader("Content-disposition", "attachment;filename="+originalFilename); // 파일이름을 쏴준다.
			byte[]b = new byte[1024];
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(pathname)); // 서버에 있는 파일
			
			OutputStream os = resp.getOutputStream(); // 클라이언트에서 쏴주기위한 
			
			int n;
			while((n=bis.read(b,0,b.length))!=-1) { // 클라이언트에게 발사
				os.write(b,0,n);
			}
			os.flush();
			os.close();
			bis.close();
			result = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return result;
	}
}
