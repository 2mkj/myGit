package mg.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MemberLogoutAction implements ManagerAction{

	@Override
	public ManagerForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ManagerForward forward = new ManagerForward();
		
		request.getSession().removeAttribute("sessionID");
		
		forward.setRedirect(true);
		forward.setPath("main.net");
		return forward;
	}

}
