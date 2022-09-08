package com.foodsharing.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.foodshring.VO.SelectBasketVO;
import com.foodshring.VO.t_itemVO;


public class t_basketDAO {
	
		// DAO - 데이터베이스의 data에 접근하기 위한 객체이며
		// 데이터베이스 접근을 하기위한 로직과 비즈니스 로직을 분리하기 위해 사용한다.
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		ArrayList<t_itemVO> list = new ArrayList<t_itemVO>();
		ArrayList<SelectBasketVO> basketlist = new ArrayList<SelectBasketVO>();
		t_itemVO vo = null;
		SelectBasketVO basketVo = null;
		int cnt = 0;

	
	// db연결하는 공통적인 부분 만들어줘서 필요할때는 getConn(); 써서 기능만 쓰기
		public void getConn() {
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
				System.out.println("connect finshed");
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

		// 장바구니 추가 method
		public int insertItemId(int itemSeq, String MdId) {
			try {
				getConn();
				String sql = "insert into t_basket(BASKET_SEQ,ITEM_SEQ,MB_ID,REG_DATE,MB_SALES) values(t_basket_seq.nextval, ?, ?, sysdate, 'N')";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, itemSeq);
				psmt.setString(2, MdId);
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
		
		public ArrayList<SelectBasketVO> getAll(String MbId){
			try {
				getConn();
				String sql = "SELECT tb.basket_seq, tb.item_seq, tb.mb_id, tb.reg_date, tb.mb_sales, ti.item_name, ti.item_price, ti.item_cate, ti.item_img1 FROM T_BASKET tb, T_ITEM ti WHERE tb.ITEM_SEQ = ti.ITEM_SEQ AND tb.MB_ID = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, MbId);
				rs = psmt.executeQuery();
				while(rs.next()) {
					int basketSeq = rs.getInt(1);
					int itemSeq = rs.getInt(2);
					String mbId = rs.getString(3);
					String regString = rs.getString(4);
					String mbSales = rs.getString(5);
					String item_name = rs.getString(6);
					int item_price = rs.getInt(7);
					String item_cate = rs.getString(8);
					String item_img1 = rs.getString(9);
					basketVo = new SelectBasketVO(basketSeq, itemSeq, mbId, regString, mbSales, item_name, item_price, item_cate, item_img1);
					basketlist.add(basketVo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return basketlist;
		}
		
		public ArrayList<SelectBasketVO> getAll2(String MbId){
			try {
				getConn();
				String sql = "SELECT tb.basket_seq, tb.item_seq, tb.mb_id, tb.reg_date, tb.mb_sales, ti.item_name, ti.item_price, ti.item_cate, ti.item_img1,"
						+ "tb.authyn,tb.amt,tb.trddttm FROM T_BASKET tb, T_ITEM ti WHERE tb.ITEM_SEQ = ti.ITEM_SEQ AND tb.MB_ID = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, MbId);
				rs = psmt.executeQuery();
				while(rs.next()) {
					int basketSeq = rs.getInt(1);
					int itemSeq = rs.getInt(2);
					String mbId = rs.getString(3);
					String regString = rs.getString(4);
					String mbSales = rs.getString(5);
					String item_name = rs.getString(6);
					int item_price = rs.getInt(7);
					String item_cate = rs.getString(8);
					String item_img1 = rs.getString(9);
					
					String authyn = rs.getString(10);
					String amt = rs.getString(11);
					String trddttm = rs.getString(12);
					
					basketVo = new SelectBasketVO(basketSeq, itemSeq, mbId, regString, mbSales, item_name, item_price, item_cate, item_img1,authyn,amt,trddttm);
					basketlist.add(basketVo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return basketlist;
		}
		
		public int deleteItemId(int basketSeq, String MbId) {
			try {
				getConn();
				String sql = "delete from t_basket where basket_seq = ? AND mb_Id = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, basketSeq);
				psmt.setString(2, MbId);
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
	
		// 장바구니 수정 method
		public int updateItemId(SelectBasketVO vo) {
			try {
				getConn();
				String sql = "UPDATE T_BASKET SET"
						+ " authyn = ? "
						+ ", amt = ? "
						+ ", trddttm= to_date( ? ,'yyyy-mm-dd hh24:mi:ss') "
						+ "WHERE basket_seq = ?"
						+ "AND item_seq = ?"
						+ "AND mb_id = ?";
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,vo.getAuthyn());
				psmt.setString(2,vo.getAmt());
				psmt.setString(3,vo.getTrddttm());
				psmt.setInt(4,vo.getBasketSeq());
				psmt.setInt(5,vo.getItemSeq());
				psmt.setString(6,vo.getMbId());
				cnt = psmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
		
}
