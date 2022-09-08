package com.foodsharing.Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.foodsharing.DAO.t_itemDAO;
import com.util.Command;
public class FarmeritemdeleteCon implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			t_itemDAO item_dao = new t_itemDAO();
			String itemSeq1 = request.getParameter("itemSeq");
			int itemSeq = Integer.parseInt(itemSeq1);
			
			PrintWriter out = response.getWriter();
			if(item_dao.farmeritemedelete(itemSeq)>0) {
				System.out.println("success");
				out.write("1");
			}else {
				System.out.println("fail");
				out.write("0");
			}
			return null;
		}
	}