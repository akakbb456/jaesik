package com.bbs;

import java.util.List;

public interface BoardDAO { // 인터페이스는 설계도
	public int insertBoard(BoardDTO dto); // 게시물 저장
	public int dataCount(); // 데이터 개수
	public int dataCount(String searchKey, String searchValue); // 검색일때 데이터 개수
	public List<BoardDTO> listBoard(int start, int end); // 데이터 가져오는거
	public List<BoardDTO> listBoard(int start, int end, String searchKey, String searchValue); // 검색일때 데이터 가져오는거
	public BoardDTO readBoard(int num);
	public int updateHitCount(int num);
	public BoardDTO preReadBoard(int num, String searchKey, String searchValue); // 이전글
	public BoardDTO nextReadBoard(int num, String searchKey, String searchValue); // 다음글
	public int updateBoard(BoardDTO dto); // 수정
	public int deleteBoard(int num); // 삭제
}
