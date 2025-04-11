package in.hb.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query; // Corrected import

import in.hb.model.StudentEntry;
import in.hb.util.HibernateUtil;

@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Long id = Long.parseLong(request.getParameter("Id"));

		if (id != null) {

			Session session = HibernateUtil.getSession();
			try {

				// Fetch student record by ID
				StudentEntry student = (StudentEntry) session.get(StudentEntry.class, id);
				int x = student.getCount();

				if (student != null && student.getId().equals(id)) {
					// Update exit time

					session.delete(student); // Use merge to update
				}

			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}

		// Fetch updated student list based on today's date
		List<StudentEntry> studentList = null;
		Session session = HibernateUtil.getSession();
		try {
			Transaction tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			Query query = session.createQuery("FROM StudentEntry WHERE date = :currentDate");
			query.setParameter("currentDate", new java.sql.Date(System.currentTimeMillis()));
			studentList = query.list();
			tx.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}

		// Forward updated data to display.jsp
		request.setAttribute("studentList", studentList);
		RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
		rd.forward(request, response);
	}
}
