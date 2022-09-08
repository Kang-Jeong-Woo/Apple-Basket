package com.foodsharing.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.foodshring.VO.t_commentVO;
import com.foodshring.VO.t_communittyVO;
import com.foodshring.VO.t_itemVO;
import com.foodshring.VO.t_safeVO;
import com.util.DbConnection;

public class t_safeDAO {

	private static t_safeDAO instance = new t_safeDAO();
	public static final int comunity_per_page = 15;

	public t_safeDAO() {}

	public static t_safeDAO getInstance() {
		return instance;
	}

	public ArrayList<t_safeVO> get_safeVO(String search) {
		ArrayList<t_safeVO> safeList = new ArrayList<t_safeVO>();
		String sql= null;
		System.out.println("search: "+search);
		if(search==null ) {
			sql = "SELECT safe_seq,safe_addr,safe_gungu,safe_center,safe_gungu,latitude,longitude FROM T_SAFE ";
		} else {
			sql = "SELECT safe_seq,safe_addr,safe_gungu,safe_center,safe_gungu,latitude,longitude FROM T_SAFE WHERE safe_addr LIKE ?";
		}
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	      conn = DbConnection.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      
	      if(search==null) {
	    	  rs = pstmt.executeQuery();
	      } else {
	    	  pstmt.setString(1, "%" + search + "%");
	    	  rs = pstmt.executeQuery();
	      }
	     
	      
	      while (rs.next()) {
	    	  t_safeVO safeVO = new t_safeVO();
	    	  safeVO.setSafeSeq(rs.getInt("safe_seq"));
	    	  safeVO.setSafeAddr(rs.getString("safe_addr"));
	    	  safeVO.setSafeCenter(rs.getString("safe_center"));
	    	  safeVO.setSafeGungu(rs.getString("safe_gungu"));
	    	  safeVO.setLatitude(String.valueOf(rs.getDouble("latitude")));
	    	  safeVO.setLongitude(String.valueOf(rs.getDouble("longitude")));
	    	  System.out.println("safeVO: "+safeVO);
	    	  safeList.add(safeVO);
	      }
	      
	    } catch (Exception e) {
	    	System.err.println("안전주소 리스트 .\n오류메세지는: "+e.getMessage());
	    } finally {
	    	DbConnection.close(conn, pstmt, rs);
	    }
	    return safeList;
	}


	public ArrayList<t_safeVO> safeSelect() {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ArrayList<t_safeVO> list = new ArrayList<t_safeVO>();
		t_safeVO vo = null;
		int cnt = 0;
		try {
			// getConn() 에 DB연결하는거 코드 올려놨으니까 기능만 가져온다
			//getConn();
			conn = DbConnection.getConnection();
			String sql = "SELECT safe_seq,safe_addr,safe_center,safe_gungu,latitude,longitude,trim(REPLACE(safe_center,'주민센터','')) AS dongNm FROM T_SAFE";
			psmt = conn.prepareStatement(sql);
			// SQL문 이 실행이 되고 그 실행된 테이블의 결과를 rs에 넣어준 형태
			rs = psmt.executeQuery();
			while (rs.next()) {
				// 로그인성공, //커서 아래로 내려가는 역할 rs.next()
				// 쿠키를 활용한 로그인처리
				// 로그인 성공 했을때 쿠키를 보내줘야한다
				// value값에는 id가 고정되면 안되기때문에 내가 입력한 변수 id가 들어가야한다
				// Cookie cookie = new Cookie("id", id);
				// response.addCookie(cookie);
				// JSP는 session이 내장객체로 지정되있지만
				// Servlet은 내장객체라는 개념이 없음
				// 세션 기능 가져오겠다

				int safe_seq = rs.getInt(1);
				String safe_addr = rs.getString(2);
				String safe_center = rs.getString(3);
				String safe_gungu = rs.getString(4);
				String safe_latitude = rs.getString(5);
				String safe_longtitude = rs.getString(6);
				String dongNm= rs.getString(7);
				vo = new t_safeVO(safe_seq, safe_addr, safe_center, safe_gungu, safe_latitude, safe_longtitude,dongNm);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//close();
			DbConnection.close(conn, psmt, rs);
		}
		return list;
	}

	public ArrayList<t_safeVO> get_safeVO() { // 팝업창에서 검색할때 사용되는 리스트.. or 맵에 뿌려줄 항목
		ArrayList<t_safeVO> safeList = new ArrayList<t_safeVO>();
		String sql = "SELECT safe_seq,safe_addr,safe_center,safe_gungu,latitude,longitude FROM T_SAFE WHERE SAFE_ADDR LIKE 'safe%'";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DbConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			// pstmt.setString(1,articleSeq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				t_safeVO safeVO = new t_safeVO();
				safeVO.setSafeSeq(rs.getInt("safe_seq"));
				safeVO.setSafeAddr(rs.getString("safe_addr"));
				safeVO.setSafeCenter(rs.getString("safe_gungu"));
				safeVO.setLatitude(String.valueOf(rs.getDouble("latitude")));
				safeVO.setLongitude(String.valueOf(rs.getDouble("longitude")));
				safeList.add(safeVO);
			}
		} catch (Exception e) {
			System.err.println("안전주소 리스트 .\n오류메세지는: " + e.getMessage());
		} finally {
			DbConnection.close(conn, pstmt, rs);
		}
		return safeList;
	}

	public ArrayList<t_safeVO> safeMapList(int startRow, int endRow,int safeSeq) {
	    ArrayList<t_safeVO> t_safeList = null;
	    String sql = "";
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	      sql = "SELECT AA.* FROM (SELECT A.*, ROWNUM RNUM FROM (SELECT T.SAFE_SEQ, T.SAFE_ADDR, T.SAFE_CENTER,T.SAFE_GUNGU,T.LATITUDE,T.LONGITUDE, U_NAME(T1.MB_ID) AS userNm "
	      		+ ", T1.ITEM_SEQ ,TO_CHAR(T1.item_Deadline,'YYYY-MM-DD') AS itemDeadline, T1.item_Name AS itemName, TO_CHAR(T1.reg_Date,'YYYY-MM-DD') AS regDate "
	    	 + "FROM T_SAFE T, T_ITEM T1 WHERE T.SAFE_SEQ =T1.SAFE_SEQ AND T1.SAFE_SEQ = ? ORDER BY T.SAFE_SEQ DESC) A) AA WHERE RNUM BETWEEN ? and ?";
	     try {
	      conn = DbConnection.getConnection();
	      
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1,safeSeq);
	      pstmt.setInt(2, startRow);
          pstmt.setInt(3, endRow); 
	      rs = pstmt.executeQuery();
	      
	      t_safeList = new ArrayList<t_safeVO>();
	      
	      while (rs.next()) {
	    	    t_safeVO safe = new t_safeVO();
	    	    safe.setLatitude(rs.getString("latitude"));
	    	    safe.setLongitude(rs.getString("longitude"));
	    	    safe.setSafeAddr(rs.getString("safe_addr"));
	    	    safe.setSafeCenter(rs.getString("safe_center"));
	    	    safe.setSafeGungu(rs.getString("safe_gungu"));
	    	    safe.setSafeSeq(rs.getInt("safe_seq"));
	    	    safe.setUserNm(rs.getString("userNm"));
	    	    safe.setItemSeq(rs.getInt("ITEM_SEQ"));
	    	    safe.setItemDeadline(rs.getString("itemDeadline"));
	    	    safe.setItemName(rs.getString("itemName"));
	    	    safe.setRegDate(rs.getString("regDate"));
				t_safeList.add(safe);
	      }
	    } catch (Exception e) {
	    	System.err.println("listFarmer 게시판 오류입니다.\n오류메세지는: "+e.getMessage());
	    } finally {
	    	DbConnection.close(conn, pstmt, rs);
	    }
	    return t_safeList;
	  }

	
}