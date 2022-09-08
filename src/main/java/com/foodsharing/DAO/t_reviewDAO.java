package com.foodsharing.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.foodshring.VO.MapVO;
import com.foodshring.VO.t_itemJoinVO;
import com.foodshring.VO.t_itemVO;
import com.foodshring.VO.t_reviewVO;
import com.util.DbConnection;

public class t_reviewDAO {
	public static final int REVIEW_PER_PAGE = 15;
	private static t_reviewDAO instance = new t_reviewDAO();
	public t_reviewDAO() {}
	public static t_reviewDAO getInstance() {
		    return instance;
	}
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	t_reviewVO vo = null;
	ArrayList<t_reviewVO> list = new ArrayList<t_reviewVO>();
	int rating = 0;
	
	public void getConn() {
		System.out.println("con success");
		try {
			// 예외처리
			// 클래스파일 찾는거 ( Servlet 과 DB를 바로 연결할수가없어서 중간에 class파일 하나가 있어야한다)
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 동적로딩
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:XE";
			String dbid = "gjai_5_5_0822";
			String dbpw = "smhrd5";
			// DB연결
			// DB에 연결시키는거 DB주소 dbid dbpw 써줘야함
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 연결끊는 공통적인 부분 만들어줘서 필요할때는 close(); 써서 기능만 쓰기
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
	
	//읽기
	 public ArrayList<t_reviewVO> farmerSelect(int itemSeq) {
		    ArrayList<t_reviewVO> reviewList = new ArrayList<t_reviewVO>();    
		    String sql = "select review_seq,item_seq,review_content,review_date,mb_id,review_rating from t_review where item_seq=? order by review_seq desc";
		    
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    
		    try {
			  conn = DbConnection.getConnection();
			  pstmt = conn.prepareStatement(sql);
		      pstmt.setInt(1, itemSeq);
		      rs = pstmt.executeQuery();
		      while (rs.next()) {
		    	  t_reviewVO rv = new t_reviewVO();
		    	  rv.setReviewSeq(rs.getInt("review_seq"));
		    	  rv.setItemSeq(rs.getInt("item_seq"));
		    	  rv.setReviewContent(rs.getString("review_content"));
		    	  rv.setReviewDate(String.valueOf(rs.getDate("review_date")));
		    	  rv.setReviewRating(rs.getInt("review_rating"));
		    	  rv.setMbId(rs.getString("mb_id"));
		    	  reviewList.add(rv);
		      }
		    } catch (Exception e) {
		      e.printStackTrace();
		    }finally {
		    	DbConnection.close(conn, pstmt, rs);
		    }
		    return reviewList;
	 } 
	
	//쓰기
	  public int ReviewWrite(t_reviewVO VO) {
		    String sql = "insert into t_review(review_seq,item_seq,review_content,review_date,mb_id,review_rating)"
		    		+ " values(t_review_seq.nextval,?,?,sysdate,?,?)";
		    int cnt=0;
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    
		    try {
		      conn = DbConnection.getConnection();
		      pstmt = conn.prepareStatement(sql);
		      pstmt.setInt(1,VO.getItemSeq());
		      pstmt.setString(2,VO.getReviewContent());
		      pstmt.setString(3,VO.getMbId());
		      pstmt.setInt(4,VO.getReviewRating());
		      cnt=pstmt.executeUpdate();
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		    	DbConnection.close(conn, pstmt);
		    }
		    return cnt;
	}
	  
	  //삭제_1
	  public int deleteReview(int review_seq,String userId) {//본인것만 삭제
	    String sql = "delete from t_review where REVIEW_SEQ = ? and mb_id=?";
	    int cnt=0;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	      conn = DbConnection.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, review_seq);
	      pstmt.setString(2, userId);
	     cnt=pstmt.executeUpdate();
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	    	DbConnection.close(conn, pstmt);
	    }
	    
	    return cnt;
	}
	  
	  
	  
	  
	  // 아이템 리뷰 select 문
		public ArrayList<t_reviewVO> itemSelect(int itemName) {
			try {
				getConn();
				String sql = "SELECT DECODE(CEIL(avg(REVIEW_RATING)),NULL,0,CEIL(avg(REVIEW_RATING))) AS roundReview,count(REVIEW_RATING) AS reviewCount FROM T_REVIEW WHERE ITEM_SEQ = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, itemName);
				rs = psmt.executeQuery();
				while (rs.next()) {
					int roundReview = rs.getInt(1);
					int reviewCount = rs.getInt(2);
					vo = new t_reviewVO(0,0,"","","",0,roundReview,reviewCount);
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return list;
		}
		
}
