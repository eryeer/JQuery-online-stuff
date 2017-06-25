package com.itcast.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;

import com.itcast.domain.User;
import com.itcast.utils.JDBCUtils;

public class AddServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String[]> map = request.getParameterMap();
		User user = new User();
		try {
			BeanUtils.populate(user, map);
		} catch (Exception e) {

			e.printStackTrace();
		}
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "insert into testuser values(null,?,?,?)";
		try {

			qr.update(sql, user.getUsername(), user.getEmail(), user.getTel());
		} catch (SQLException e) {

			e.printStackTrace();
			throw new RuntimeException();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
