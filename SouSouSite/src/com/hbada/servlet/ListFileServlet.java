package com.hbada.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hbada.bean.Music;
import com.hbada.demo.MusicCrawler;
import com.hbada.util.AccessRecord;

@WebServlet("/SouSouMusic")
public class ListFileServlet extends HttpServlet {

    static int count = 1;
	private static final long serialVersionUID = 8183441216302623457L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doPost(request, response);	
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("访问者"+count+++":"+new AccessRecord().getRemoteHost(request));
		String w = request.getParameter("searchname");
		if(w==null||w.equals("")){
			w = "曾轶可";
		}else{
			w = new String(w.getBytes("iso8859-1"),"UTF-8");
		}
		
		
		String p = request.getParameter("page");
		if(p==null||p.equals("")){
			p = "1";
		}
		
		Map<String,List<String>> songMap = MusicCrawler.url1(w,Integer.parseInt(p));
		List<String> song_names = (List<String>) songMap.get("song_names");
		List<String> song_singers = (List<String>) songMap.get("song_singers");
		List<String> song_songname_hilights = (List<String>) songMap.get("song_songname_hilights");
		List<String> urls = (List<String>) songMap.get("song_urls");
		/*for(int i=0;i<urls.size();i++){
			try{
				System.out.println(song_names.get(i)+"-"+song_singers.get(i)+":"+urls.get(i));
			}catch(Exception e){
				System.out.println(0);
			}
		}*/
		List<Music> listMusic = new ArrayList<Music>();
		
		for(int i=0;i<urls.size();i++){
			Music m = new Music();
			m.setMusicName(song_names.get(i));
			m.setMusicSinger(song_singers.get(i));
			m.setMusicHilight(song_songname_hilights.get(i));
			m.setMusicUrl(urls.get(i));
			listMusic.add(m);
		}
		
		
		
		request.setAttribute("w", w);
		request.setAttribute("p", "b"+p);
		request.setAttribute("listMusic", listMusic);
        request.getRequestDispatcher("/sousoude.jsp").forward(request, response);
    }
}
