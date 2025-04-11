package in.hb.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;

import org.dom4j.swing.BranchTreeNode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import in.hb.model.RegisterStudent;
import in.hb.util.HibernateUtil2;

@WebServlet("/put")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Session session = null;
		Transaction transaction = null;
		boolean flag = false;

		try {
			session = HibernateUtil2.getSession();
			if (session != null) {
				transaction = session.beginTransaction();
			}
			if (transaction != null) {
				RegisterStudent res = new RegisterStudent();
				res.setStdId(Long.parseLong(request.getParameter("id")));
				res.setStdName(request.getParameter("name"));
				res.setCourse(request.getParameter("class"));
				res.setMobileNumber(Long.parseLong(request.getParameter("mobile")));
			//	res.setEntryTime(new Time(0));

				session.persist(res);
				flag = true;
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (flag) {
				if (transaction != null) {
					transaction.commit();
					System.out.println("obj saved");
				} else {
					if (transaction != null) {
						transaction.rollback();
						System.out.println("obj not saved");
					}
				}
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher("attendance.jsp");
		rd.forward(request, response);

	}

}
