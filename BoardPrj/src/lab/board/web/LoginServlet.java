package lab.board.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.MemberDAO;
import domain.MemberVO;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberDAO dao;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		if(action.equals("logout")) {
			session.invalidate();
		response.sendRedirect("/M3/index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dao = new MemberDAO();
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		String url = "";
		try {
			String dbpw = dao.getPassword(userid);
			if(dbpw.equals(password)) {
				MemberVO member = dao.selectMember(userid);
				session.setAttribute("member", member);
				session.setAttribute("userid", userid);
				request.setAttribute("message", userid + "님 환영합니다.");
				url = "/M3/Board.do?action=list";
				response.sendRedirect(url);
				return;
			}else {
				session.invalidate();
				request.setAttribute("message", "비밀번호가 다릅니다.");
				url ="/login.jsp";
			}
		}catch(RuntimeException e) {
			session.invalidate();
			request.setAttribute("message","아이디가 존재하지않습니다.");
			url="/login.jsp";
			
		}
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
	}
}

