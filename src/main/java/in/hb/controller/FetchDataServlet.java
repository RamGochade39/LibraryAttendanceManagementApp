package in.hb.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

import in.hb.model.StudentEntry;
import in.hb.util.HibernateUtil;

@WebServlet("/fetch")
public class FetchDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<StudentEntry> studentList = null;
        try {
            Session session = HibernateUtil.getSession();
            Transaction tx = session.beginTransaction();
            Query query = session.createQuery("FROM StudentEntry WHERE date = :currentDate");
            query.setParameter("currentDate", new java.sql.Date(System.currentTimeMillis()));

            studentList = query.list();
            tx.commit();
            
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("studentList", studentList);
        RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
        rd.forward(request, response);
    }
}
