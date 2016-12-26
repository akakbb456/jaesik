package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	// �Ϲ������� �ۼ����Ҷ� euc-kr���·� �̷������.
	// 8859-1�� ������ ������ �ѱ��� �� ����������.
	/**
	 * 
	 * @param saveFilename ����������� ���ϸ�
	 * @param originalFilename Ŭ���̾�Ʈ�� ���ε��� ���ϸ�
	 * @param pathname ����������� ��ġ
	 * @param resp HttpServletResponse
	 * @return �ٿ�ε� ��������
	 */   
	public static boolean filedownload(String saveFilename, String originalFilename, String pathname, HttpServletResponse resp) {
		boolean result = false;
		if(saveFilename==null || originalFilename==null)
			return result;
		try {
			originalFilename = new String(originalFilename.getBytes("euc-kr"), "8859_1"); //euc-kr -> 8859_1�� �ٲٴ� ����
			pathname = pathname += File.separator+saveFilename;
			File f = new File(pathname);
			if(!f.exists())
				return result;
			
			resp.setContentType("application/octet-stream"); // ��Ʈ���� �����ϰڴ� 
			
			// ���ϸ��� ���
			resp.setHeader("Content-disposition", "attachment;filename="+originalFilename); // �����̸��� ���ش�.
			byte[]b = new byte[1024];
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(pathname)); // ������ �ִ� ����
			
			OutputStream os = resp.getOutputStream(); // Ŭ���̾�Ʈ���� ���ֱ����� 
			
			int n;
			while((n=bis.read(b,0,b.length))!=-1) { // Ŭ���̾�Ʈ���� �߻�
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
