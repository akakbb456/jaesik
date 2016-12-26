package com.bbs;

import java.util.List;

public interface BoardDAO { // �������̽��� ���赵
	public int insertBoard(BoardDTO dto); // �Խù� ����
	public int dataCount(); // ������ ����
	public int dataCount(String searchKey, String searchValue); // �˻��϶� ������ ����
	public List<BoardDTO> listBoard(int start, int end); // ������ �������°�
	public List<BoardDTO> listBoard(int start, int end, String searchKey, String searchValue); // �˻��϶� ������ �������°�
	public BoardDTO readBoard(int num);
	public int updateHitCount(int num);
	public BoardDTO preReadBoard(int num, String searchKey, String searchValue); // ������
	public BoardDTO nextReadBoard(int num, String searchKey, String searchValue); // ������
	public int updateBoard(BoardDTO dto); // ����
	public int deleteBoard(int num); // ����
}
