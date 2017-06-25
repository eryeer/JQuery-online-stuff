package com.itcast.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.itcast.utils.JDBCUtils;

import flexjson.JSONSerializer;

public class SanjiServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pid = request.getParameter("pid");
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select * from province_city_district where pid = ?";
		try {

			List<Map<String, Object>> query = qr.query(sql,
					new MapListHandler(), Integer.parseInt(pid));
			JSONSerializer serializer = new JSONSerializer();
			String json = serializer.exclude("*.class", "pid").serialize(query);
			System.out.println(json);
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().write(json);
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
