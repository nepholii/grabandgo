package filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter("/*")
public class AuthFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        System.out.println("AuthFilter triggered for: " + uri);

       
        if (uri.endsWith("login.jsp") || uri.endsWith("register.jsp")
                || uri.endsWith("LoginServlet") || uri.endsWith("RegisterServlet")) {
            chain.doFilter(request, response);
            return;
        }

        String role = (session != null) ? (String) session.getAttribute("role") : null;
        System.out.println("Session: " + session + ", Role: " + role);

        if (session == null || role == null) {
            res.sendRedirect(contextPath + "/login.jsp?error=Please login first");
            return;
        }

    
        if (uri.contains("admin-dashboard.jsp") && !"admin".equalsIgnoreCase(role)) {
            res.sendRedirect(contextPath + "/login.jsp?error=Access denied: Admins only");
            return;
        } else if (uri.contains("staff-dashboard.jsp") && !"staff".equalsIgnoreCase(role)) {
            res.sendRedirect(contextPath + "/login.jsp?error=Access denied: Staff only");
            return;
        } else if (uri.contains("customer-dashboard.jsp") && !"customer".equalsIgnoreCase(role)) {
            res.sendRedirect(contextPath + "/login.jsp?error=Access denied: Customers only");
            return;
        }

      
        chain.doFilter(request, response);
    }

    public void destroy() {}
}
