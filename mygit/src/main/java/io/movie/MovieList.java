package io.movie;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 공공기관 데이터 가져오기
 * https://api.visitkorea.or.kr/openAPI/applicationGuide.do#
 */
@WebServlet("/PublicData")
public class MovieList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*
	 https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=853f0aa6d778559af7da30a7f1f1359b&targetDt=20220804 
	 */
	private final String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
    private final String AUTH_KEY = "853f0aa6d778559af7da30a7f1f1359b";
	
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("key"          , AUTH_KEY);                        // 발급받은 인증키
        paramMap.put("targetDt"     , "20220710");  // 조회하고자 하는 날짜
        paramMap.put("itemPerPage"  , "10");                            // 결과 ROW 의 개수( 최대 10개 )
        paramMap.put("multiMovieYn" , "Y");                             // Y:다양성 영화, N:상업영화, Default:전체
        paramMap.put("repNationCd"  , "K");                             // K:한국영화, F:외국영화, Default:전체
 
        try {
            // Request URL 연결 객체 생성
            URL requestURL = new URL(REQUEST_URL+"?"+makeQueryString(paramMap));
            HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
 
            // GET 방식으로 요청
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
 
            // 응답(Response) 구조 작성
            //   - Stream -> JSONObject
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String readline = null;
            StringBuffer response1 = new StringBuffer();
            while ((readline = br.readLine()) != null) {
                response1.append(readline);
            }
 
            System.out.println(response1);
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    public String makeQueryString(Map<String, String> paramMap) {
        final StringBuilder sb = new StringBuilder();
 
        paramMap.entrySet().forEach(( entry )->{
            if( sb.length() > 0 ) {
                sb.append('&');
            }
            sb.append(entry.getKey()).append('=').append(entry.getValue());
        });
 
        return sb.toString();
    }

}