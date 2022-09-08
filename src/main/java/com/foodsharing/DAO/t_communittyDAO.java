package com.foodsharing.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.foodshring.VO.t_communittyVO;
import com.util.DbConnection;

public class t_communittyDAO {

	private static t_communittyDAO instance = new t_communittyDAO();
	 
	public t_communittyDAO() {}
	
	public static t_communittyDAO getInstance() {
		    return instance;
	}
	
	
	// 리스트
		  public ArrayList<t_communittyVO> listCommunitty(int startRow, int endRow, String select, String search) {
		    ArrayList<t_communittyVO> productList = null;
		    String sql = "";
		    boolean flag=true; //search했을경우
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;

		    if (select == null || search == null) {
	            flag = false;
	            sql = "SELECT AA.* FROM (SELECT A.*, ROWNUM RNUM FROM ";
	            sql += "(SELECT T.ARTICLE_DATE, T.ARTICLE_SEQ, T.ARTICLE_TITLE, T.ARTICLE_CONTENT, T.ARTICLE_FILE, M.MB_ID as mb_id, U_NAME(M.MB_ID) AS UNAME, (SELECT COUNT(*) FROM T_COMMENT C WHERE T.ARTICLE_SEQ = C.ARTICLE_SEQ) AS countNum ";
	            sql += "FROM T_COMMUNITY T LEFT JOIN t_MEMBER M ON T.MB_ID = M.MB_ID ORDER BY T.ARTICLE_SEQ DESC ) A) AA WHERE RNUM BETWEEN ? and ?";
		    }
		    
		    
		    try {
		      conn = DbConnection.getConnection();
		      pstmt = conn.prepareStatement(sql);
		      
	            if (!flag) {
	            	 pstmt.setInt(1, startRow);
		             pstmt.setInt(2, endRow); 
	            } 
		      
		      rs = pstmt.executeQuery();
		      
		      productList = new ArrayList<t_communittyVO>();
		      
		      while (rs.next()) {
		    	    t_communittyVO communitty = new t_communittyVO();
		    	    communitty.setArticleSeq(String.valueOf(rs.getInt("ARTICLE_SEQ")));
		    	    communitty.setArticleTitle(rs.getString("ARTICLE_TITLE"));
		    	    communitty.setArticleContent(rs.getString("ARTICLE_CONTENT"));
		    	    communitty.setArticleFile(rs.getString("ARTICLE_FILE"));
		    	    communitty.setArticleDate(String.valueOf(rs.getDate("ARTICLE_DATE")));
					communitty.setMbId(rs.getString("MB_ID"));
					communitty.setUname(rs.getString("UNAME"));
					communitty.setCountNum(rs.getInt("countNum"));
					
		    	  productList.add(communitty);
		      }
		    } catch (Exception e) {
		    	System.err.println("listFarmer 게시판 오류입니다.\n오류메세지는: "+e.getMessage());
		    } finally {
		    	DbConnection.close(conn, pstmt, rs);
		    }
		    return productList;
		  }
	
	
	//게시판 insert
		  public int insertcommunitty(t_communittyVO communittyVO) {
			    String sql="";
			    
			    if(!"".equals(communittyVO.getArticleFile())) {
			    sql = "insert into t_community(article_seq,article_title,article_content,article_file,article_date,mb_id)values(t_community_seq.nextval"
			    		+ ",?,?,?,sysdate,?)";
			    } else {
			    	  sql = "insert into t_community(article_seq,article_title,article_content,article_date,mb_id)values(t_community_seq.nextval"
					    		+ ",?,?,sysdate,?)";	
			    }
			    Connection conn = null;
			    PreparedStatement pstmt = null;
			    int cnt=0;
			    try {
			      conn = DbConnection.getConnection();
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setString(1,communittyVO.getArticleTitle());
			      pstmt.setString(2,communittyVO.getArticleContent());
			     
			      if(!"".equals(communittyVO.getArticleFile())) {
			    	  pstmt.setString(3,communittyVO.getArticleFile());
			    	  pstmt.setString(4,communittyVO.getMbId());
			      } else {
			    	  pstmt.setString(3,communittyVO.getMbId());
			      }
			      
			      cnt=pstmt.executeUpdate();
			    } catch (Exception e) {
			      System.err.println("insert 게시판 오류입니다.\n오류메세지는: "+e.getMessage());
			    } finally {
			      DbConnection.close(conn, pstmt);
			    }
			    return cnt;
		  }
		  
		//단일 Select
		  public t_communittyVO get_communittyVO(String articleSeq) {
			  t_communittyVO communitty = null;
			    String sql = "select article_seq,article_title,article_content,article_file,article_date, MB_ID as mb_id, U_NAME(MB_ID) AS UNAME from t_community where article_seq = ?";
			    Connection conn = null;
			    PreparedStatement pstmt = null;
			    ResultSet rs = null;
			    try {
			      conn = DbConnection.getConnection();
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setString(1, articleSeq);
			      rs = pstmt.executeQuery();
			      if (rs.next()) {
			    	  communitty = new t_communittyVO();
			    	  communitty.setArticleSeq(String.valueOf(rs.getInt("article_seq")));
			    	  communitty.setArticleTitle(rs.getString("article_title"));
			    	  communitty.setArticleContent(rs.getString("article_content"));
			    	  communitty.setArticleFile(rs.getString("article_file"));
			    	  communitty.setArticleDate(String.valueOf(rs.getDate("article_date")));
					  communitty.setMbId(rs.getString("mb_id"));
					  communitty.setUname(rs.getString("UNAME"));
			      }
			    } catch (Exception e) {
			      e.printStackTrace();
			    } finally {
			    	DbConnection.close(conn, pstmt);
			    }
			    return communitty;
		}
	//게시판 update
		  public int updatecommunitty(t_communittyVO communittyVO) {
			    String sql="";
			    
				
				 if(!"".equals(communittyVO.getArticleFile())&&communittyVO.getArticleFile()!=null) { 
					 sql = "update t_community set " + "article_title = ?" +
							 ",article_content = ?" + ",article_file = ?" + 
							 ",article_date = sysdate " +
							 "where article_seq=? " + 
							 "and mb_id = ?";
					 } else {
			    	sql = "update t_community set "
				    		+ "article_title = ? "
				    		+ ",article_content = ? "
				    		+ ",article_date = sysdate "
				    		+ "where article_seq=? "
				    		+ "and mb_id = ?";
			    	}
			    Connection conn = null;
			    PreparedStatement pstmt = null;
			    int cnt=0;
			    try {
			      conn = DbConnection.getConnection();
			      pstmt = conn.prepareStatement(sql);
			     if(!"".equals(communittyVO.getArticleFile())&&communittyVO.getArticleFile()!=null) {
				      pstmt.setString(1,communittyVO.getArticleTitle());
				      pstmt.setString(2,communittyVO.getArticleContent());
				      pstmt.setString(3,communittyVO.getArticleFile());
				      pstmt.setInt(4,Integer.parseInt(communittyVO.getArticleSeq()));
				      pstmt.setString(5,communittyVO.getMbId());
				      cnt=pstmt.executeUpdate();
			      } else {
				      pstmt.setString(1,communittyVO.getArticleTitle());
				      pstmt.setString(2,communittyVO.getArticleContent());
				      pstmt.setInt(3,Integer.parseInt(communittyVO.getArticleSeq()));
				      pstmt.setString(4,communittyVO.getMbId());
				      cnt=pstmt.executeUpdate();
			      }
			    } catch (Exception e) {
			      System.err.println("update 게시판 오류입니다.\n오류메세지는: "+e.getMessage());
			    } finally {
			      DbConnection.close(conn, pstmt);
			    }
			    return cnt;
		  }	
		  
		  
	//게시판 Delete
		  public int Deletecommunitty(String articleSeq,String mbId) {
				System.out.println("값3:"+articleSeq);
				System.out.println("값4:"+mbId);
			    String sql = "delete from t_community where article_seq=? and mb_id = ?";
			    Connection conn = null;
			    PreparedStatement pstmt = null;
			    int cnt=0;
			    try {
			      conn = DbConnection.getConnection();
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setInt(1,Integer.parseInt(articleSeq));
			      pstmt.setString(2,mbId);
			      cnt=pstmt.executeUpdate();
			    } catch (Exception e) {
			      System.err.println("update 게시판 오류입니다.\n오류메세지는: "+e.getMessage());
			    } finally {
			      DbConnection.close(conn, pstmt);
			    }
			    return cnt;
		  }

		public int getCommunittyCount(String select, String search) {
			
			t_communittyVO communitty = null;
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    
	        String sql = null;
	        String selectQuery = "";
	        boolean flag = true; // search 했을 경우
		    
	        int count = 0;
	        
		    try {
		    
		    	if (select == null || search == null) {
	                flag = false;
	                sql = "SELECT COUNT(article_seq) FROM t_community";
	            } else {
	                flag = true;
	                if (select.equals("articleTitle") || select.equals("articleContent")) {
	                    selectQuery = select + " = ";
	                } else {
	                    selectQuery = select + " like ";
	                }
	                sql = "SELECT COUNT(article_seq) FROM t_community WHERE " + selectQuery + " ? ";
	            }
		    	
		      conn = DbConnection.getConnection();
		      pstmt = conn.prepareStatement(sql);
		     
	          if (flag) {
	        	  if (select.equals("articleTitle") || select.equals("articleContent")) {
	                    pstmt.setString(1, "%" + search + "%");
	                } else {
	                    pstmt.setString(1, search);
	                }
	            } 
		      
		      rs = pstmt.executeQuery();
		      if (rs.next()) {
		    	  count = rs.getInt(1);
		      }
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		    	DbConnection.close(conn, pstmt);
		    }
			return count;
		}	
	
}
