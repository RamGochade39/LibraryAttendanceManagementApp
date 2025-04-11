package in.hb.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import in.hb.model.Signup;
import in.hb.util.HibernateUtil;

@WebServlet("/test")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(password);
		request.setAttribute("password", password);
		try {
			Session session = HibernateUtil.getSession();
			if (session != null)
			{
				Signup sign = (Signup) session.get(Signup.class, email);

				if (sign != null)
				{
					if (password.equals(sign.getPassword()))
					{
						System.out.println("Login Successful! Redirecting to home page...");
						request.getSession().setAttribute("user", email);
						request.setAttribute("password", sign.getPassword());
						System.out.println(sign.getPassword());
						System.out.println("====================================");
						//System.out.println(request.getAttribute(password));
						RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
						rd.forward(request, response);
						return;
					} else
					{
						request.setAttribute("errorMessage", "Invalid password. Please try again.");
					}
				}
				else
				{
					request.setAttribute("errorMessage", "User does not exist. Please sign up first.");
				}
			}
			else
			{
				request.setAttribute("errorMessage", "Database connection failed.");
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "An error occurred while processing your request.");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Unexpected error occurred.");
		}

		// Forward back to login.jsp with an error message
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
}
