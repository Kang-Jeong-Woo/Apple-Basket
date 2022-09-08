package com.foodsharing.DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.foodshring.VO.t_itemJoinVO;
import com.foodshring.VO.t_itemVO;
import com.util.DbConnection;
public class t_itemDAO {
	// DAO - 데이터베이스의 data에 접근하기 위한 객체이며
	// 데이터베이스 접근을 하기위한 로직과 비즈니스 로직을 분리하기 위해 사용한다.
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ArrayList<t_itemVO> list = new ArrayList<t_itemVO>();
	t_itemVO vo = null;
	ArrayList<t_itemJoinVO> list2 = new ArrayList<t_itemJoinVO>();
	t_itemJoinVO vo2 = null;
	
	int cnt = 0;
	// db연결하는 공통적인 부분 만들어줘서 필요할때는 getConn(); 써서 기능만 쓰기
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
	public ArrayList<t_itemVO> getAll() {
		try {
			getConn();
			String sql = "select item_seq,item_name,item_price,item_cate,mb_id,item_deadline,safe_seq,reg_date,item_img1,item_img2,item_img3,item_desc,item_flag,safeAddr(item_seq) as safeSeqNm from t_item";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int item_seq = rs.getInt(1);
				String item_name = rs.getString(2);
				int item_price = rs.getInt(3);
				String item_cate = rs.getString(4);
				String mb_id = rs.getString(5);
				String item_deadline = rs.getString(6);
				int safe_seq = rs.getInt(7);
				String reg_date = rs.getString(8);
				String item_img1 = rs.getString(9);
				String item_img2 = rs.getString(10);
				String item_img3 = rs.getString(11);
				String item_desc = rs.getString(12);
				int item_Quant = rs.getInt(13);
				int cur_Quant = rs.getInt(14);
				String item_Flag = rs.getString(15);
				String safeSeqNm = rs.getString(16);
				vo = new t_itemVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline, safe_seq, reg_date,
						item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag,safeSeqNm, safeSeqNm);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public ArrayList<t_itemVO> itemSelect(int itemName) {
		try {
			// getConn() 에 DB연결하는거 코드 올려놨으니까 기능만 가져온다
			getConn();
			String sql = "SELECT item_seq,item_name,item_price,item_cate,mb_id,item_deadline,safe_seq,reg_date,item_img1,item_img2,item_img3,item_desc,item_flag,safeAddr(SAFE_SEQ) as safeSeqNm FROM t_item WHERE ITEM_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, itemName);
			// SQL문 이 실행이 되고 그 실행된 테이블의 결과를 rs에 넣어준 형태
			rs = psmt.executeQuery();
			while(rs.next()){
				// 로그인성공, //커서 아래로 내려가는 역할 rs.next()
				// 쿠키를 활용한 로그인처리
				// 로그인 성공 했을때 쿠키를 보내줘야한다
				// value값에는 id가 고정되면 안되기때문에 내가 입력한 변수 id가 들어가야한다
				// Cookie cookie = new Cookie("id", id);
				// response.addCookie(cookie);
				// JSP는 session이 내장객체로 지정되있지만
				// Servlet은 내장객체라는 개념이 없음
				// 세션 기능 가져오겠다
				int item_seq = rs.getInt(1);
				String item_name = rs.getString(2);
				int item_price = rs.getInt(3);
				String item_cate = rs.getString(4);
				String mb_id = rs.getString(5);
				String item_deadline = rs.getString(6);
				int safe_seq = rs.getInt(7);
				String reg_date = rs.getString(8);
				String item_img1 = rs.getString(9);
				String item_img2 = rs.getString(10);
				String item_img3 = rs.getString(11);
				String item_desc = rs.getString(12);
				int item_Quant = rs.getInt(13);
				int cur_Quant = rs.getInt(14);
				String item_Flag = rs.getString(15);
				String safeSeqNm = rs.getString(16);
				System.out.println("rs done!");
				vo = new t_itemVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline, safe_seq, reg_date,
						item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag, safeSeqNm);
				System.out.println("vo done!");
				if(vo!=null) {
					System.out.println("vo OK");
				}else {
					System.out.println("vo NOPE");
				}
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public ArrayList<t_itemVO> getFarmerList(String mbId) {
		try {
			getConn();
			String sql = "select item_seq,item_name,item_price,item_cate,mb_id,item_deadline,safe_seq,reg_date,item_img1,item_img2,item_img3,item_desc,ITEM_QUANTITY,CUR_QUANTITY,item_flag,safeAddr(item_seq) as safeSeqNm  from t_item where mb_id = ? "
					+ "ORDER BY item_seq desc";
			psmt = conn.prepareStatement(sql); 
			psmt.setString(1, mbId); 
			rs = psmt.executeQuery();
			while (rs.next()) {
				int item_seq = rs.getInt(1);
				String item_name = rs.getString(2);
				int item_price = rs.getInt(3);
				String item_cate = rs.getString(4);
				String mb_id = rs.getString(5);
				String item_deadline = rs.getString(6);
				int safe_seq = rs.getInt(7);
				String reg_date = rs.getString(8);
				String item_img1 = rs.getString(9);
				String item_img2 = rs.getString(10);
				String item_img3 = rs.getString(11);
				String item_desc = rs.getString(12);
				int item_Quant = rs.getInt(13);
				int cur_Quant = rs.getInt(14);
				String item_Flag = rs.getString(15);
				String safeSeqNm = rs.getString(16);
				vo = new t_itemVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline, safe_seq, reg_date,
						item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag,safeSeqNm, safeSeqNm);
				list.add(vo); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} 
		return list;
	}
	
	public ArrayList<t_itemVO> getFarmerList2(String mbId) {
		try {
			getConn();
			String sql = "select item_seq,item_name,item_price,item_cate,mb_id,item_deadline,safe_seq,reg_date,item_img1,item_img2,item_img3,item_desc,ITEM_QUANTITY,CUR_QUANTITY,item_flag,safeAddr(item_seq) as safeSeqNm  from t_item where mb_id = ? "
					+ "ORDER BY item_seq desc";
			psmt = conn.prepareStatement(sql); 
			psmt.setString(1, mbId); 
			rs = psmt.executeQuery();
			while (rs.next()) {
				int item_seq = rs.getInt(1);
				String item_name = rs.getString(2);
				int item_price = rs.getInt(3);
				String item_cate = rs.getString(4);
				String mb_id = rs.getString(5);
				String item_deadline = rs.getString(6);
				int safe_seq = rs.getInt(7);
				String reg_date = rs.getString(8);
				String item_img1 = rs.getString(9);
				String item_img2 = rs.getString(10);
				String item_img3 = rs.getString(11);
				String item_desc = rs.getString(12);
				int item_Quant = rs.getInt(13);
				int cur_Quant = rs.getInt(14);
				String item_Flag = rs.getString(15);
				String safeSeqNm = rs.getString(16);
				vo = new t_itemVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline, safe_seq, reg_date,
						item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag,safeSeqNm, safeSeqNm);
				list.add(vo); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} 
		return list;
	}
	
	public int itemDelete(String itemSeq) {
		try {
			getConn();
			String sql = "UPDATE T_ITEM SET ITEM_FLAG = 'N' WHERE ITEM_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, itemSeq); 
			 
			cnt = psmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	//단일 Select
	  public t_itemVO getItemVO(String articleSeq) {
		  t_itemVO vo = null;
		    String sql = "select item_seq,item_name,item_price,item_cate,mb_id,item_deadline,safe_seq,reg_date,item_img1,item_img2,item_img3,item_desc,ITEM_QUANTITY,CUR_QUANTITY,item_flag,safeAddr(safe_seq) as safeSeqNm, u_name(mb_id) as userNm"
		    		+ " from t_item where item_seq = ? ";
		    
		    try {
		    	getConn();
				psmt = conn.prepareStatement(sql); 
				psmt.setInt(1,Integer.parseInt(articleSeq)); 
				rs = psmt.executeQuery();
		      if (rs.next()) {
		    	  	int item_seq = rs.getInt(1);
					String item_name = rs.getString(2);
					int item_price = rs.getInt(3);
					String item_cate = rs.getString(4);
					String mb_id = rs.getString(5);
					String item_deadline = rs.getString(6);
					int safe_seq = rs.getInt(7);
					String reg_date = rs.getString(8);
					String item_img1 = rs.getString(9);
					String item_img2 = rs.getString(10);
					String item_img3 = rs.getString(11);
					String item_desc = rs.getString(12);
					int item_Quant = rs.getInt(13);
					int cur_Quant = rs.getInt(14);
					String item_Flag = rs.getString(15);
					String safeSeqNm = rs.getString(16);
					String userNm=rs.getString(17);
					vo = new t_itemVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline, safe_seq, reg_date,
							item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag,safeSeqNm, userNm);
		      }
		    } catch (Exception e) {
		      e.printStackTrace();
		    } finally {
		    	close();
		    }
		    return vo;
	}
	  
	
	//상세페이지 쓰기
	public int ItemInsert(t_itemVO vo) {

		try {
			getConn();
			String sql = "INSERT INTO t_item(item_seq,item_name,item_price,item_cate,mb_id,item_deadline,safe_seq,reg_date,item_img1,"
					   +"item_img2,item_img3,item_desc)"
					   +"VALUES (t_item_seq.nextval,?,?,?,?,to_date(?||to_char(sysdate,'hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss'),?,sysdate,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,vo.getItemName());
			psmt.setInt(2, vo.getItemPrice());
			psmt.setString(3,vo.getItemCate());
			psmt.setString(4,vo.getMbId());
			psmt.setString(5,vo.getItemDeadline());
			
			psmt.setInt(6,vo.getSafeSeq());
			
			if(!"".equals(vo.getItemImg1())&&vo.getItemImg1()!=null) {
				psmt.setString(7,vo.getItemImg1());
			} else {
				psmt.setString(7,"logo.png");
			}
			
			if(!"".equals(vo.getItemImg2())&&vo.getItemImg2()!=null) {
				psmt.setString(8,vo.getItemImg2());
			} else {
				psmt.setString(8,"logo.png");
			}
			
			if(!"".equals(vo.getItemImg3())&&vo.getItemImg3()!=null) {
				psmt.setString(9,vo.getItemImg3());
			} else {
				psmt.setString(9,"logo.png");
			}
			
			psmt.setString(10,vo.getItemDesc());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}
	
	
	//상세페이지 수정
		public int ItemUpdate(t_itemVO vo) {

			try {
				getConn();
				//item_seq,item_name,item_price,item_cate,mb_id,item_deadline,safe_seq,reg_date,item_img1,"
				   //+"item_img2,item_img3,item_desc,ITEM_FALG
				String sql = "update t_item set"
						   + " , item_name = ?"
						   + " , item_price = ?"
						   + " , item_cate = ?"
						   + " , item_deadline = to_date(?||to_char(sysdate,'hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss')"
						   + " , safe_seq = ?"
						   + " , item_img1 = ?"
						   + " , item_img2 = ?"
						   + " , item_img3 = ?"
						   + " , item_desc = ?"
						   + " , ITEM_FALG = ?"
				           + " where item seq = ?"
		           		   + " and mb_id = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,vo.getItemName());
				psmt.setInt(2, vo.getItemPrice());
				psmt.setString(3,vo.getItemCate());
				psmt.setString(4,vo.getMbId());
				psmt.setString(5,vo.getItemDeadline());
				psmt.setInt(6,vo.getSafeSeq());
				
				if(!"".equals(vo.getItemImg1())&&vo.getItemImg1()!=null) {
					psmt.setString(7,vo.getItemImg1());
				} else {
					psmt.setString(7,"logo.png");
				}
				
				if(!"".equals(vo.getItemImg2())&&vo.getItemImg2()!=null) {
					psmt.setString(8,vo.getItemImg2());
				} else {
					psmt.setString(8,"logo.png");
				}
				
				if(!"".equals(vo.getItemImg3())&&vo.getItemImg3()!=null) {
					psmt.setString(9,vo.getItemImg3());
				} else {
					psmt.setString(9,"logo.png");
				}
				
				psmt.setString(10,vo.getItemDesc());
				psmt.setString(11,vo.getItemFlag());
				psmt.setInt(12,vo.getItemSeq());
				
				cnt = psmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {

				close();
			}
			return cnt;
		}
	
	
	public ArrayList<t_itemJoinVO> priceList(String minprice, String maxprice) {
		try {
			getConn();
			String sql = "select * "
					+ 	   "from t_item i,t_safe s  "
					+ "	   where i.safe_seq = s.safe_seq"
					+ "      and item_price between ? and ?";
			psmt = conn.prepareStatement(sql); 
			psmt.setString(1, minprice); 
			psmt.setString(2, maxprice); 
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				int item_seq = rs.getInt(1);
				String item_name = rs.getString(2);
				int item_price = rs.getInt(3);
				String item_cate = rs.getString(4);
				String mb_id = rs.getString(5);
				String item_deadline = rs.getString(6);
				String reg_date = rs.getString(8);
				String item_img1 = rs.getString(9);
				String item_img2 = rs.getString(10);
				String item_img3 = rs.getString(11);
				String item_desc = rs.getString(12);
				int item_Quant = rs.getInt(13);
				int cur_Quant = rs.getInt(14);
				String item_Flag = rs.getString(15);
				int safe_seq = rs.getInt(16);
				String safe_addr = rs.getString(17);
				String safe_center = rs.getString(18);
				String safe_gungu = rs.getString(19);
				String safe_latitude = rs.getString(20);
				String safe_longtitude = rs.getString(21);
				
				vo2 = new t_itemJoinVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline,reg_date,
						item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag, safe_seq, safe_addr, 
						safe_center,safe_gungu,safe_latitude ,safe_longtitude);
				
				list2.add(vo2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} 
		return list2;
	}
	public ArrayList<t_itemJoinVO> Search_str(String input_str) {
		try {
			getConn();
			String sql = "";
			sql = "select * from t_item i, t_safe s where i.safe_seq = s.safe_seq "
					+ "and( i.item_name like ? or s.safe_center like ? )";

			psmt = conn.prepareStatement(sql); 
			psmt.setString(1, "%" + input_str + "%"); 
			psmt.setString(2, "%" + input_str + "%"); 
		
			rs = psmt.executeQuery();
			while (rs.next()) {
				int item_seq = rs.getInt(1);
				String item_name = rs.getString(2);
				int item_price = rs.getInt(3);
				String item_cate = rs.getString(4);
				String mb_id = rs.getString(5);
				String item_deadline = rs.getString(6);
				String reg_date = rs.getString(8);
				String item_img1 = rs.getString(9);
				String item_img2 = rs.getString(10);
				String item_img3 = rs.getString(11);
				String item_desc = rs.getString(12);
				int item_Quant = rs.getInt(13);
				int cur_Quant = rs.getInt(14);
				String item_Flag = rs.getString(15);
				int safe_seq = rs.getInt(16);
				String safe_addr = rs.getString(17);
				String safe_center = rs.getString(18);
				String safe_gungu = rs.getString(19);
				String safe_latitude = rs.getString(20);
				String safe_longtitude = rs.getString(21);
				
				vo2 = new t_itemJoinVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline,reg_date,
						item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag, safe_seq, safe_addr, 
						safe_center,safe_gungu,safe_latitude ,safe_longtitude);
				
				list2.add(vo2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		} 
		return list2;
	}
	//상세페이지 출력
	public ArrayList<t_itemJoinVO> getAll1() {
		try {
			
			getConn();
			String sql = "select * from t_item i, t_safe s where i.safe_seq = s.safe_seq";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int item_seq = rs.getInt(1);
				String item_name = rs.getString(2);
				int item_price = rs.getInt(3);
				String item_cate = rs.getString(4);
				String mb_id = rs.getString(5);
				String item_deadline = rs.getString(6);
				String reg_date = rs.getString(8);
				String item_img1 = rs.getString(9);
				String item_img2 = rs.getString(10);
				String item_img3 = rs.getString(11);
				String item_desc = rs.getString(12);
				int item_Quant = rs.getInt(13);
				int cur_Quant = rs.getInt(14);
				String item_Flag = rs.getString(15);
				int safe_seq = rs.getInt(16);
				String safe_addr = rs.getString(17);
				String safe_center = rs.getString(18);
				String safe_gungu = rs.getString(19);
				String safe_latitude = rs.getString(20);
				String safe_longtitude = rs.getString(21);
				
				
				vo2 = new t_itemJoinVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline,reg_date,
						item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag, safe_seq, safe_addr, 
						safe_center,safe_gungu,safe_latitude ,safe_longtitude);
				list2.add(vo2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list2;
	}

	//detail 페이지 삭제
		public ArrayList<t_itemJoinVO> getdetail(int itemName) {
			try {
				getConn();
				String sql = "select * from t_item i, t_safe s where i.safe_seq = s.safe_seq and ITEM_SEQ = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, itemName);
				rs = psmt.executeQuery();
				while (rs.next()) {
					int item_seq = rs.getInt(1);
					String item_name = rs.getString(2);
					int item_price = rs.getInt(3);
					String item_cate = rs.getString(4);
					String mb_id = rs.getString(5);
					String item_deadline = rs.getString(6);
					String reg_date = rs.getString(8);
					String item_img1 = rs.getString(9);
					String item_img2 = rs.getString(10);
					String item_img3 = rs.getString(11);
					String item_desc = rs.getString(12);
					int item_Quant = rs.getInt(13);
					int cur_Quant = rs.getInt(14);
					String item_Flag = rs.getString(15);
					int safe_seq = rs.getInt(16);
					String safe_addr = rs.getString(17);
					String safe_center = rs.getString(18);
					String safe_gungu = rs.getString(19);
					String safe_latitude = rs.getString(20);
					String safe_longtitude = rs.getString(21);
					
					
					vo2 = new t_itemJoinVO(item_seq, item_name, item_price, item_cate, mb_id, item_deadline,reg_date,
							item_img1, item_img2, item_img3, item_desc, item_Quant, cur_Quant ,item_Flag, safe_seq, safe_addr, 
							safe_center,safe_gungu,safe_latitude ,safe_longtitude);
					list2.add(vo2);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return list2;
		}
	
		// 농부 판매목록 삭제 method
		public int farmeritemedelete(int itemSeq) {
			try {
				getConn();
				String sql = "delete from t_item where item_seq = ?";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, itemSeq);
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
}