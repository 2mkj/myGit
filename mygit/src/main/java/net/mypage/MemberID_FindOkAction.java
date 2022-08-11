package net.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberID_FindOkAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("member/id_find_ok.jsp");
		return forward;
	}

}
