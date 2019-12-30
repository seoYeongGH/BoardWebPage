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
 * Servlet implementation class MemberServlet
 */
@WebServlet("/Member.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MemberDAO dao;

	public MemberServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO();
		String url = "";
		if (action.equals("insert")) {
			request.setAttribute("action", action);
			request.setAttribute("message", "회원 가입");
			url = "/memberform.jsp";
		} else if (action.equals("update")) {
			try {
				member = dao.selectMember(userid);
				request.setAttribute("member", member);
				request.setAttribute("action", action);
				request.setAttribute("message", "회원 정보 수정");
			} catch (RuntimeException e) {
				request.setAttribute("message", e.getMessage());
			}
			url = "/memberform.jsp";
		} else if (action.equals("delete")) {
			try {
				member = dao.selectMember(userid);
				request.setAttribute("member", member);
				request.setAttribute("action", action);
			} catch (RuntimeException e) {
				request.setAttribute("message", e.getMessage());
			}
			url = "/board/memberDelete.jsp";
		}
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address;
		try {
			address = request.getParameter("address");
		} catch (NullPointerException e) {
			address = "";
		}

		String url = null;
		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO();
		member.setUserid(userid);
		member.setPassword(password);
		member.setName(name);
		member.setEmail(email);
		member.setAddress(address);
		if (action.equals("insert")) {
			try {
				dao.insert(member);
				member = dao.selectMember(userid);
				request.setAttribute("message", "회원가입성공");
				request.setAttribute("member", member);
			} catch (RuntimeException e) {
				request.setAttribute("message", e.getMessage());
			}
			url = "/login.jsp";
		} else if (action.equals("update")) {
			try {
				dao.updateMember(member);
			} catch (RuntimeException e) {
				request.setAttribute("message", e.getMessage());
			}
			response.sendRedirect("/M3/Board.do?action=member");
			return;
		} else if (action.equals("delete")) {
			dao.deleteMember(userid, password);
			request.setAttribute("message", "회원 정보 삭제 완료");
			url = "/login.jsp";
		}
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);
	}

}
