package com.starshot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(AuthenticationFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession();
         logger.info("http request " + httpRequest.getRequestURI());

         // Exclude webjars login and assets mapping
         if (httpRequest.getRequestURI().endsWith("login") || httpRequest.getRequestURI().indexOf("assets") > 0
                || httpRequest.getRequestURI().indexOf("webjars") > 0) {
            chain.doFilter(request, response);
        } else if (session.getAttribute("username") == null) {
            httpResponse.sendRedirect("login");
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
