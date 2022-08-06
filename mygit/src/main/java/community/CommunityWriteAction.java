//글 등록에 대한 Action 클래스
package community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mainpage.Action;
import mainpage.ActionForward;

public class CommunityWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("community/boardWrite.jsp");
		return forward;
	}

}
