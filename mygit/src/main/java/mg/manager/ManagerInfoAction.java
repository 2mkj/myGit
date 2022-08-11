package mg.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.MemberDAO2;
import net.member.Memberall;


public class ManagerInfoAction implements ManagerAction {

	@Override
	public ManagerForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		MemberDAO2 mdao = new MemberDAO2();
		Memberall m = mdao.member_info(email);
		ManagerForward forward = new ManagerForward();
		
		if(m==null) {
			forward.setPath("error/error.jsp");
			forward.setRedirect(false);
			request.setAttribute("message","아이디에 해당하는 정보가 없습니다.");
			return forward;
		}
		request.setAttribute("managerinfo", m);
		forward.setRedirect(false);
		forward.setPath("manager/boardList.jsp");
		return forward;
	}

}
