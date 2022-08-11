package mg.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import mg.manager.db.ManagerDAO;


public class MemberDeleteAction implements ManagerAction{

	@Override
	public ManagerForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ManagerForward forward = new ManagerForward();
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
//		String pass = request.getParameter("password");
		
		ManagerDAO dao =new ManagerDAO();
		int check = dao.delete(id);
		
		if(check == 1) {
			session.removeAttribute("sessionID");
			forward.setRedirect(true);
			forward.setPath("Result.do");
		}else {
			System.out.println("회원 삭제 실패");
			return null;
		}
		return forward;
	}

}
