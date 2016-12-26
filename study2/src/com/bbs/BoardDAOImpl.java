package com.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class BoardDAOImpl implements BoardDAO{
	// �ڵ��� ������ �� �������!!
	private Connection conn = DBConn.getConnection();
	@Override
	public int insertBoard(BoardDTO dto) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		try {
			sql = "INSERT INTO bbs(num, name, subject, content, pwd, ipAddr) VALUES(bbs_seq.NEXTVAL,?,?,?,?,?)"; 
			// �������� �̿��� ����Ŭ�� num�� �ڵ����� �Է�
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPwd());
			pstmt.setString(5, dto.getIpAddr());
			
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

	@Override
	public int dataCount() {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT COUNT(*) FROM bbs"; // ��ü�� ������ ������ ���ϴ� ����!
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); 
			if(rs.next()) // �����Ͱ� �����ϸ�
				result=rs.getInt(1); // 1���÷��� �����͸� ��ȯ****************
			
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

	@Override
	public int dataCount(String searchKey, String searchValue) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT COUNT(*) FROM bbs WHERE "; // ��ü�� ������ ������ ���ϴ� ����!
			if(searchKey.equals("name")) 
				sql+="INSTR(name, ?)=1"; // �̸��˻�! "ȫ�浿"�� ��� �˻��� ��(�浿�� �˻� �ȵ�)
			else if(searchKey.equals("subject"))
				//sql+="INSTR(subject,?)>=1"; // �Ʒ��� ������
				sql+="subject LIKE '%' || ? || '%' "; // %: 0�� �̻�
			else if(searchKey.equals("content"))
				sql+="INSTR(content,?)>=1";
			else if(searchKey.equals("created"))
				sql+="TO_CHAR(created, 'YYYY-MM-DD')=?";
			
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			
			
			rs = pstmt.executeQuery(); 
			if(rs.next()) // �����Ͱ� �����ϸ�
				result=rs.getInt(1); // 1���÷��� �����͸� ��ȯ****************
			
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

	@Override
	public List<BoardDTO> listBoard(int start, int end) {
		// TODO Auto-generated method stub
		// num, subject, name, created, hitCount
		List<BoardDTO> list = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="select*from(SELECT ROWNUM rnum, tb.* FROM(SELECT num,subject,name,created,hitCount FROM bbs order by num desc) tb where ROWNUM<=?)where rnum>=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setCreated(rs.getString("created"));
				dto.setHitCount(rs.getInt("hitCount"));
				list.add(dto);
			}
			rs.close();
			pstmt.close();
			rs=null;
			pstmt=null;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<BoardDTO> listBoard(int start, int end, String searchKey, String searchValue) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				// num, subject, name, created, hitCount
				List<BoardDTO> list = new ArrayList<>();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				StringBuffer sb = new StringBuffer();
				
				try {
					sb.append("SELECT * FROM(");
			        sb.append("  SELECT ROWNUM rnum, tb.* FROM(");
		            sb.append("      SELECT num, name, subject, hitCount,");
		            sb.append("         created"); // TO_CHAR : string���� �ٲ���            
		            sb.append("     FROM bbs where ");
		            if(searchKey.equals("name"))
		                sb.append("instr(name,?) = 1");
		            else if(searchKey.equals("subject"))    
		               //sql+="instr(subject,?) >= 1";
		             	sb.append(" subject like '%' || ? || '%'");
		            else if(searchKey.equals("content"))    
		            	sb.append(" instr(content,?) >= 1");
		            else if(searchKey.equals("created"))    
		             	sb.append(" to_char(created,'YYYY-MM-DD') = ?");
			            sb.append("     ORDER BY num DESC ");
			            sb.append("   )tb WHERE ROWNUM <= ?"); //����ȣ
			            sb.append(") WHERE rnum >= ?"); //���۹�ȣ
					
					pstmt=conn.prepareStatement(sb.toString());
					pstmt.setString(1, searchValue);
					pstmt.setInt(2, end);
					pstmt.setInt(3, start);
					rs=pstmt.executeQuery();
					while(rs.next())
					{
						BoardDTO dto = new BoardDTO();
						dto.setNum(rs.getInt("num"));
						dto.setSubject(rs.getString("subject"));
						dto.setName(rs.getString("name"));
						dto.setCreated(rs.getString("created"));
						dto.setHitCount(rs.getInt("hitCount"));
						list.add(dto);
					}
					rs.close();
					pstmt.close();
					rs=null;
					pstmt=null;
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e.toString());
				}
				return list;
	}

	@Override
	public BoardDTO readBoard(int num) { // db�ӿ��ִ°� �ٰ������°�(num)�� �´�
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		BoardDTO dto=null;
		//select*from bbs where num=1;
		//num, name, subject, content, pwd, ipAddr
		try {
			sql="select num, name, subject, content, pwd, ipAddr, hitCount, created from bbs where num=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPwd(rs.getString("pwd"));
				dto.setIpAddr(rs.getString("ipAddr"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
			}
			rs.close();
			pstmt.close();
			rs=null;
			pstmt=null;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public BoardDTO preReadBoard(int num, String searchKey, String searchValue) {
        BoardDTO dto=null;

        PreparedStatement pstmt=null;
        ResultSet rs=null;
        StringBuffer sb = new StringBuffer();

        try {
            if(searchValue!=null && searchValue.length() != 0) {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT num, subject FROM bbs ");
                if(searchKey.equals("name"))
                	sb.append("     WHERE (INSTR(name,?) = ?)  ");
                else if(searchKey.equals("created"))
                	sb.append("     WHERE (TO_CHAR(created, 'YYYY-MM-DD') = ?) ");
                else
                	sb.append("     WHERE ( INSTR("+searchKey+", ?) > 0) ");
                sb.append("         AND (num > ? ) ");
                sb.append("         ORDER BY num ASC ");
                sb.append("      ) tb WHERE ROWNUM=1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setString(1, searchValue);
                pstmt.setInt(2, num);
			} else {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT num, subject FROM bbs ");
                sb.append("     WHERE num > ? ");
                sb.append("         ORDER BY num ASC ");
                sb.append("      ) tb WHERE ROWNUM=1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setInt(1, num);
			}

            rs=pstmt.executeQuery();

            if(rs.next()) {
                dto=new BoardDTO();
                dto.setNum(rs.getInt("num"));
                dto.setSubject(rs.getString("subject"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
    
        return dto;
    }

	@Override
	// ������
    public BoardDTO nextReadBoard(int num, String searchKey, String searchValue) {
        BoardDTO dto=null;

        PreparedStatement pstmt=null;
        ResultSet rs=null;
        StringBuffer sb = new StringBuffer();

        try {
            if(searchValue!=null && searchValue.length() != 0) {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT num, subject FROM bbs ");
                if(searchKey.equals("name")){
                	//sb.append("     WHERE (name = ?)  ");
                	sb.append("      WHERE (INSTR(name,?) = ?)  ");
                }
                else if(searchKey.equals("created"))
                	sb.append("     WHERE (TO_CHAR(created, 'YYYY-MM-DD') = ?) ");
                else
                	sb.append("     WHERE ( INSTR("+searchKey+", ?) > 0) ");
                sb.append("         AND (num < ? ) ");
                sb.append("         ORDER BY num DESC ");
                sb.append("      ) tb WHERE ROWNUM=1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setString(1, searchValue);
                pstmt.setInt(2, num);
			} else {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT num, subject FROM bbs ");
                sb.append("     WHERE num < ? ");
                sb.append("         ORDER BY num DESC ");
                sb.append("      ) tb WHERE ROWNUM=1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setInt(1, num);
            }

            rs=pstmt.executeQuery();

            if(rs.next()) {
                dto=new BoardDTO();
                dto.setNum(rs.getInt("num"));
                dto.setSubject(rs.getString("subject"));
            }
        } catch (Exception e) {
            System.out.println(e.toString());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}

        return dto;
    }

	@Override
	public int updateBoard(BoardDTO dto) { // �Խù� ����
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			// ����, �̸�, ����, �н�����
			//subject, name,  content, pwd,
			// UPDATE ���̺��  SET �÷���= �����Ұ�[, �÷���= �����Ұ�, ...]  [WHERE ����];
			sql = "UPDATE bbs SET subject=?,name=?,content=?,pwd=? WHERE num=?";
			///
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getName()); 
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPwd());
			pstmt.setInt(5, dto.getNum());
			
			result=pstmt.executeUpdate();
			pstmt.close();
			pstmt=null;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteBoard(int num) { // �Խù� ����
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql="DELETE FROM bbs WHERE num=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateHitCount(int num) { // ��ȸ���� 1 ����������!!
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		try {
			sql="update bbs set hitCount=hitCount+1 where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
