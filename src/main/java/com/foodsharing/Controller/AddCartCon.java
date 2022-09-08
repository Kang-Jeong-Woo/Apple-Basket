package com.foodsharing.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_basketDAO;
import com.util.Command;

public class AddCartCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mbId = request.getParameter("mbId");
		String itemSeq1 = request.getParameter("seq");
		int seq = Integer.parseInt(itemSeq1);
		t_basketDAO dao = new t_basketDAO();
		int cnt = dao.insertItemId(seq, mbId);
		PrintWriter out = response.getWriter();
		if (cnt > 0) {
			out.print("1");
		} else {
			out.print("0");
		}
		return null;
	}

}
