package com.hbada.demo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class KGMusicCrawler {
	
	
	//private static int count = 1;
	
	public static void main(String[] args) {
		String page = "1"; 		//下载的页数，每页20，不太可能超过2000首吧
		String word = "曾轶可";       //你搜索的歌手或者歌曲名字
		url1(word,Integer.parseInt(page));
		//downTaskList(f,word,Integer.parseInt(p));
	}
	
	/**
	 * 获取url1
	 * @param word
	 * @param p
	 * @return url2(songNames,songURL)
	 */
	@SuppressWarnings("static-access")
	public static Map<String,List<String>> url1(String word,int page) {
		String url1="http://songsearch.kugou.com/song_search_v2?callback=jQuery112400037371328988002883_1517032536185&keyword="+word+"&page="+page+"&pagesize=30&userid=-1&clientver=&platform=WebFilter&tag=em&filter=2&iscorrection=1&privilege_filter=0&_=1517032536187";
		try {
			//1.请求网页;
			URL pageUrl = new URL(url1);
			//2.下载网页
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					pageUrl.openStream()));
			String line;
			//3.读取网页
			StringBuffer pageBuffer = new StringBuffer();
			while ((line = reader.readLine()) != null) {
				pageBuffer.append(line+"\n");
			}
			
			line = pageBuffer.toString();
			Matcher matcher = Pattern.compile("(?<=\\().*(?=\\))").matcher(line);
			if(matcher.find()){
				line = matcher.group();
			}
			JSONObject jo = new JSONObject();
			JSONObject joline = jo.parseObject(line);
			JSONObject jldata = (JSONObject) joline.get("data");
			JSONArray jlist = jldata.getJSONArray("lists");
			List<String> songNames = new ArrayList<String>();
			List<String> songURLs = new ArrayList<String>(); 
			for (int i = 0; i < jlist.size(); i++) {
				JSONObject songlist = jlist.getJSONObject(i);				
			    String songName = (String)songlist.get("SongName");	
				String fileHash = (String) songlist.get("FileHash");
				String albumID = (String) songlist.get("AlbumID");
				songNames.add(songName);
				songURLs.add("http://www.kugou.com/song/#hash="+fileHash+"&album_id="+albumID);
			}
			
			return url2(songNames,songURLs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取url2
	 * @param songNames
	 * @param songURLs
	 * @return 
	 */
	private static Map<String, List<String>> url2(List<String> songNames,List<String> songURLs){
		
		for(String songURL : songURLs){
			System.out.println(songURL);
			try {
				
				//1.请求网页;
				URL pageUrl = new URL(songURL);
				//2.下载网页
				BufferedReader reader = new BufferedReader(new InputStreamReader(
						pageUrl.openStream()));
				String line;
				//3.读取网页
				StringBuffer pageBuffer = new StringBuffer();
				while ((line = reader.readLine()) != null) {
					pageBuffer.append(line+"\n");
				}
				
				line = pageBuffer.toString();
				System.out.println(line);
				break;
				/*Matcher matcher = Pattern.compile("(?<=\\().*(?=\\))").matcher(line);
				if(matcher.find()){
					line = matcher.group();
				}*/
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		}
		
		
		
		return null;
		
		
	} 
	

}
	
