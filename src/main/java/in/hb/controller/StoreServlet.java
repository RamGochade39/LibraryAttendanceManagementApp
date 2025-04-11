package in.hb.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.metamodel.SetAttribute;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import in.hb.model.RegisterStudent;
import in.hb.util.HibernateUtil2;

@WebServlet("/store")
public class StoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = null;
		try {
			id = Long.parseLong(request.getParameter("id"));
		} catch (NumberFormatException e) {
			request.setAttribute("error", "Invalid ID format. Please enter a valid number.");
			RequestDispatcher rd = request.getRequestDispatcher("attendance.jsp");
			rd.forward(request, response);
			return;
		}

		try {
			Session hibSession = HibernateUtil2.getSession();
			if (hibSession != null) {
				RegisterStudent res = (RegisterStudent) hibSession.get(RegisterStudent.class, id);

				if (res != null) {
					// Get the HTTP session and retrieve the student list

					request.setAttribute("id", res.getStdId());
					request.setAttribute("name", res.getStdName());
					request.setAttribute("course", res.getCourse());
					RequestDispatcher re = request.getRequestDispatcher("./storedb");
					re.forward(request, response);
					return;
				} else {
					request.setAttribute("error", "Id does not exist.");
				}
			} else {
				request.setAttribute("error", "Database connection issue.");
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			request.setAttribute("error", "An error occurred while processing your request.");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Unexpected error occurred.");
		}

		// Forward back to attendance.jsp with the error message if any issue occurs
		RequestDispatcher rd = request.getRequestDispatcher("attendance.jsp");
		rd.forward(request, response);
	}
}
