package com.itcast.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.itcast.domain.User;
import com.itcast.utils.JDBCUtils;

import flexjson.JSONSerializer;

public class Show2Servlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String callback = request.getParameter("callback");
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from testuser";
		try {

			List<User> ulist = qr.query(sql, new BeanListHandler<User>(
					User.class));
			JSONSerializer serializer = new JSONSerializer();
			String json = serializer.exclude("*.class", "id").serialize(ulist);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(callback + "(" + json + ")");
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
