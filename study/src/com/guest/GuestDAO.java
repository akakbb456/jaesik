package com.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.score.ScoreDTO;
import com.util.DBConn;

public class GuestDAO {
	private Connection conn = DBConn.getConnection();
	
	public int insertGuest(GuestDTO dto) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		try {
			sql = "INSERT INTO guest(num, name, content) VALUES(guest_seq.NEXTVAL,?,?)"; 
			// 시퀀스를 이용해 오라클이 num은 자동으로 입력
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getContent());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());	
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
					pstmt=null;
				} catch (Exception e2) {
				}
			}
		}
		return result;
	}
	
	public int dataCount() {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT COUNT(*) FROM guest"; // 전체의 데이터 갯수를 구하는 쿼리!
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); 
			if(rs.next()) // 데이터가 존재하면
				result=rs.getInt(1); // 1번컬럼의 데이터를 반환****************
			
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		pstmt=null;
		rs=null;
		
		return result;
	}
	
	public List<GuestDTO> listGuest(int start, int end) {
		List<GuestDTO> list = new ArrayList<>(); // LinkedList가 속도가 더 빠르므로 일반적으로 링크드리스트를 쓴다.
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("SELECT * FROM(");
			sb.append("  SELECT ROWNUM rnum, tb.* FROM(");
			sb.append("		SELECT num, name, content,");
			sb.append("			created"); // TO_CHAR : string으로 바꿔줌
			sb.append("	  FROM guest ");
			sb.append("	  ORDER BY num DESC ");
			sb.append("	)tb WHERE ROWNUM <= ?"); //끝번호
			sb.append(") WHERE rnum >= ?"); //시작번호
			
			pstmt=conn.prepareStatement(sb.toString()); // 쿼리문을 넘김
			pstmt.setInt(1, end); // 끝번호
			pstmt.setInt(2, start); // 시작번호
			
			rs=pstmt.executeQuery();
			while(rs.next()) { // 최대 10번 작업(끝번호-시작번호??)
				GuestDTO dto = new GuestDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setCreated(rs.getString("created"));
				dto.setContent(rs.getString("content"));
				list.add(dto);
			}
			rs.close();
			pstmt.close();
			rs=null;
			pstmt=null;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	public int deleteGuest(int num) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql="DELETE FROM guest WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
