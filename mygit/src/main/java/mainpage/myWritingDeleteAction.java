package mainpage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commuboard.CommunityDAO;

public class myWritingDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		CommunityDAO dao = new CommunityDAO();
		
		try{					
			int cnt = Integer.parseInt(request.getParameter("cnt"));	
			 for(int j = 1; j <= cnt ; j++ ){			
				for(int i = 0; i < request.getParameterValues("chk" + String.valueOf(j)).length ; i++){
					System.out.println(request.getParameterValues("chk" + String.valueOf(j))[i]);			
					}		
			 }
			}catch(Exception e){
				e.printStackTrace();	
			}
		//int result = dao.myWritingDelete(intArr);
		
		
		
		/*
		 * PrintWriter out = response.getWriter(); if (result == -2) {
		 * out.println("<script>"); out.println("alert('게시글이 삭제되었습니다.');");
		 * out.println("location.href='myWriting.net'"); out.println("</script>"); }
		 * else { out.println("<script>"); out.println("alert('삭제할 수 없습니다.');");
		 * out.println("history.back()"); out.println("</script>"); } out.close();
		 */
			return null;

	}
}