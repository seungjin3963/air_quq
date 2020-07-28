package com.jhta.airqnq.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if (!excludeUrl(req) && session.getAttribute("logind") == null) {
			req.setAttribute("filterUrl", req.getRequestURI().toString().trim());
			req.getRequestDispatcher("/login").forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	private boolean excludeUrl(HttpServletRequest request) {
		String uri = request.getRequestURI().toString().trim();
		if (uri.equals("/")) {
			return true;
		} else if (uri.startsWith("/login")) {
			return true;
		} else if (uri.startsWith("/resources")) {
			return true;
		} else if (uri.startsWith("/favicon.ico")) {
			return true;
		} else if (uri.startsWith("/member")) {
			return true;
		} else if (uri.startsWith("/report")) {
			return true;
		} else if (uri.startsWith("/search")) {
			return true;
		} else if (uri.equals("/user/applyCheck")) {
			return false;
		} else if (uri.equals("/user/apply")) {
			return true;
		} else if (uri.startsWith("/upload")) {
			return true;
		} else if (uri.startsWith("/idchk")) {
			return true;
		} else if (uri.startsWith("/emailchk")) {
			return true;
		} else if(uri.startsWith("/kakao/login")) {
			return true;
		}
		return false;
	}
}
