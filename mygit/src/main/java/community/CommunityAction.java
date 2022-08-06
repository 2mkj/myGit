package community;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import commuboard.Community;
import commuboard.CommunityDAO;
import mainpage.Action;
import mainpage.ActionForward;


public class CommunityAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CommunityDAO boarddao = new CommunityDAO();
		List<Community> boardlist = new ArrayList<Community>();
		int page = 1; //보여줄 page
		int limit = 10; //한 페이지에 보여줄 게시판 목록의 수
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("넘어온 페이지  ="+ page);
		
		// 추가
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		System.out.println("넘어온 limit =" + limit);
		
		int listcount = boarddao.getListCount();
		boardlist = boarddao.getBoardList(page, limit);
		
		int maxpage = (listcount + limit - 1) / limit;
		System.out.println("총 페이지수 =" + maxpage);
		int startpage = ((page - 1) / 10) * 10 + 1;
		System.out.println("현재 페이지에 보여줄 시작 페이지 수 :" + startpage);
		int endpage = startpage + 10 - 1;
		System.out.println("현재 페이지에 보여줄 마지막 페이지 수 :" + endpage);
		if (endpage > maxpage)
			endpage = maxpage;
		
		String state = request.getParameter("state");
		
		if(state == null) {
			System.out.println("state==null");
			request.setAttribute("page", page); // 현재 페이지 수
			request.setAttribute("maxpage", maxpage); //최대 페이지 수
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("listcount", listcount); //총 글의 수
			request.setAttribute("boardlist", boardlist);
			request.setAttribute("limit", limit);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			
			forward.setPath("community/Community.jsp");
			return forward; 
			
		} else {
			System.out.println("state=ajax");
			
			JsonObject object = new JsonObject();
			object.addProperty("page", page); //{"page": 변수 page의 값} 형식으로 저장 
			object.addProperty("maxpage", maxpage);
			object.addProperty("startpage", startpage);
			object.addProperty("endpage", endpage);
			object.addProperty("listcount", listcount);
			object.addProperty("limit", limit);
			JsonElement je = new Gson().toJsonTree(boardlist);
			System.out.println("boardlist="+je.toString());
			object.add("boardlist", je);
			
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().append(object.toString());
			System.out.println(object.toString());
			return null;
		}//if end
		
	}//execute end

}
