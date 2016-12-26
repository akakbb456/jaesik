package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class ScoreDAO {
	private Connection conn = DBConn.getConnection();
	public int insertScore(ScoreDTO dto) { // 
		int result =0;
		PreparedStatement pstmt=null;
		String sql;
		try {
			sql = "INSERT INTO score(hak, name, birth, kor, eng, mat) VALUES(?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql); // 여기서 쿼리를 넣어줌
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat()); // 값들을 추가
			
			 					// select문을 제외한 나머지 쿼리를 실행할때 쓴다!!(executeUpdate())
			result = pstmt.executeUpdate(); // 쿼리를 여기서 넣으면 안됨
			
		} catch (Exception e) {
			// TODO: handle exception
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
			sql="SELECT COUNT(*) FROM score"; // 전체의 데이터 갯수를 구하는 쿼리!
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
	
	public List<ScoreDTO> listScore(int start, int end) {
		List<ScoreDTO> list = new ArrayList<>(); // LinkedList가 속도가 더 빠르므로 일반적으로 링크드리스트를 쓴다.
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("SELECT * FROM(");
			sb.append("  SELECT ROWNUM rnum, tb.* FROM(");
			sb.append("		SELECT hak, name,");
			sb.append("			TO_CHAR(birth,'YYYY-MM-DD') birth,"); // TO_CHAR : string으로 바꿔줌
			sb.append("			kor, eng, mat, ");
			sb.append("			(kor+eng+mat) tot, ");
			sb.append("			(kor+eng+mat)/3 ave ");
			sb.append("	  FROM score ");
			sb.append("	  ORDER BY hak ASC ");
			sb.append("	)tb WHERE ROWNUM <= ?"); //끝번호
			sb.append(") WHERE rnum >= ?"); //시작번호
			
			pstmt=conn.prepareStatement(sb.toString()); // 쿼리문을 넘김
			pstmt.setInt(1, end); // 끝번호
			pstmt.setInt(2, start); // 시작번호
			
			rs=pstmt.executeQuery();
			while(rs.next()) { // 최대 10번 작업(끝번호-시작번호??)
				ScoreDTO dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				
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
	
	public int deleteScore(String hak) {
		int result=0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql="DELETE FROM score WHERE hak=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	public ScoreDTO readScore(String hak) {
		ScoreDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql="SELECT hak, name, TO_CHAR(birth,'YYYY-MM-DD') birth, kor, eng, mat FROM score where hak=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				//dto.setHak(rs.getString(1));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	public int updateScore(ScoreDTO dto) {
		int result=0;
		PreparedStatement pstmt=null;

		String sql;
		
		try {
			// UPDATE 테이블명  SET 컬럼명= 변경할값[, 컬럼명= 변경할값, ...]  [WHERE 조건];
			sql = "UPDATE score SET name=?,birth=?,kor=?,eng=?,mat=? WHERE hak=?";
			///
			
			pstmt=conn.prepareStatement(sql); 
			pstmt.setString(1, dto.getName()); 
			pstmt.setString(2, dto.getBirth()); 
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			pstmt.setString(6, dto.getHak());
			
			result=pstmt.executeUpdate();
			pstmt.close();
			pstmt=null;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public int deleteList(String[] haks) {
		int result =0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql="DELETE FROM score WHERE hak IN(";
			for (int i=0;i<haks.length;i++) {
				sql+="?,";
			}
			sql = sql.substring(0, sql.length()-1);
			sql+=")";
			
			pstmt=conn.prepareStatement(sql);
			for(int i=0;i<haks.length;i++) {
				pstmt.setString(i+1, haks[i]);
			}
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
}







