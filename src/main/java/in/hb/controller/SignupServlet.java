package in.hb.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import in.hb.model.Signup;
import in.hb.util.HibernateUtil;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Session session = null;
		Transaction transaction = null;
		boolean flag = false;

		try {

			session = HibernateUtil.getSession();

			if (session != null) {
				transaction = session.beginTransaction();
			}
			if (transaction != null) {
				String name = request.getParameter("name");
				String userName = request.getParameter("username");
				String pass = request.getParameter("password");

				Signup s1 = new Signup();
				s1.setName(name);
				s1.setUserName(userName);
				s1.setPassword(pass);

				session.persist(s1);
				flag = true;

			}

		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (flag) {
				if (transaction != null)
					transaction.commit();
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			} else {
				if (transaction != null)
					transaction.rollback();
			}
			
		}

	}

}
