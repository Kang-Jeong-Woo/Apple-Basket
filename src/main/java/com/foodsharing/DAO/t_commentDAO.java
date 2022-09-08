package com.foodsharing.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.foodshring.VO.t_commentVO;
import com.foodshring.VO.t_communittyVO;
import com.util.DbConnection;


public class t_commentDAO {


	private static t_commentDAO instance = new t_commentDAO();
	 
	public t_commentDAO() {}
	
	public static t_commentDAO getInstance() {
		    return instance;
	}
	
	//단일 Select
	  public ArrayList<t_commentVO> get_commentList(String articleSeq) {
		  ArrayList<t_commentVO> commentList = null;
		    String sql = "";
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    sql = "SELECT AA.* FROM (SELECT A.*, ROWNUM RNUM FROM ";
            sql += "(SELECT T.CMT_SEQ,T.ARTICLE_SEQ,T.CMT_CONTENT,T.CMT_DATE,T.MB_ID,U_NAME(M.MB_ID) as USERNM ";
            sql += "FROM T_COMMENT T LEFT JOIN t_MEMBER M ON T.MB_ID = M.MB_ID WHERE T.article_seq= ? ORDER BY T.CMT_SEQ DESC ) A) AA";
            
		    try {
			  conn = DbConnection.getConnection();
			  pstmt = conn.prepareStatement(sql);
		      pstmt.setInt(1,Integer.parseInt(articleSeq)); 
		      
		      rs = pstmt.executeQuery();
		      commentList = new ArrayList<t_commentVO>();
		      
		      while(rs.next()) {
		    	  
		    	  t_commentVO comment = new t_commentVO();
		    	  comment.setCmtSeq(rs.getInt("CMT_SEQ"));
		    	  comment.setArticleSeq(rs.getInt("ARTICLE_SEQ"));
		    	  comment.setCmtContent(rs.getString("CMT_CONTENT"));
		    	  comment.setMbId(rs.getString("MB_ID"));
		    	  comment.setCmtDate(String.valueOf(rs.getDate("CMT_DATE")));
		    	  comment.setUserNm(rs.getString("USERNM"));
		    	  
		    	  commentList.add(comment);
		    	  System.out.println("정현 김"+commentList.toString());
		    	}
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		    	DbConnection.close(conn, pstmt);
		    }
		    return commentList;
	}
	//게시판 Delete
	  public int Deletecommt(String cmtSeq,String mbId) {
		    String sql = "delete from T_COMMENT where cmt_seq=? and mb_id = ?";
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    int cnt=0;
		    System.out.println("아이디: "+mbId);
		    System.out.println("게시글: "+cmtSeq);
		    try {
		      conn = DbConnection.getConnection();
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setInt(1,Integer.parseInt(cmtSeq));
		      pstmt.setString(2,mbId);
		      
		      cnt=pstmt.executeUpdate();
		    } catch (Exception e) {
		      System.err.println("update 게시판 오류입니다.\n오류메세지는: "+e.getMessage());
		    } finally {
		      DbConnection.close(conn, pstmt);
		    }
		    return cnt;
	  }
	  
	 
		//게시판 Write
	  public int Insertcommt(String articleSeq,String mbId,String cmtContent) {
		    String sql = "INSERT INTO T_COMMENT(CMT_SEQ,ARTICLE_SEQ,CMT_CONTENT,MB_ID,CMT_DATE) values(T_COMMENT_SEQ.nextval,?,?,?,sysdate)";
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    int cnt=0;

		    try {
		      conn = DbConnection.getConnection();
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setInt(1,Integer.parseInt(articleSeq));
		      pstmt.setString(2,cmtContent);
		      pstmt.setString(3,mbId);
		      
		      cnt=pstmt.executeUpdate();
		    } catch (Exception e) {
		      System.err.println("update 게시판 오류입니다.\n오류메세지는: "+e.getMessage());
		    } finally {
		      DbConnection.close(conn, pstmt);
		    }
		    return cnt;
	  }

}
