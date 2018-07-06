package com.hbada.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PlayerServlet")
public class PlayerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getParameter("url");
		String songname = request.getParameter("songname");
		if(url==null || url==""){
			url="http://dl.stream.qqmusic.qq.com/C400004FZuxe2IHobi.m4a?vkey=19D40060140D34927952E60D19AB7445FBD69E35D89415866D8A4C38F627A678543DF2C7F9F15C7A015D5D50E795055E7247ABA09B24AA1A&guid=6612300644&uin=0&fromtag=66";
		}
		if(songname!=null || songname!=""){
			songname = new String(songname.getBytes("iso8859-1"),"UTF-8");
		}
		
		request.setAttribute("url", url);
		request.setAttribute("songname", songname);
		request.getRequestDispatcher("/player.jsp").forward(request, response);
	}

}
