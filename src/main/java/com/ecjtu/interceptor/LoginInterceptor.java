package com.ecjtu.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ecjtu.po.Staff;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		// 获取请求的 URL
		String url = request.getRequestURI();
		// URL:除了 login.jsp 是可以公开访问的，其它的 URL 都进行拦截控制
		if (url.indexOf("/login") >= 0) {
			return true;
		}
		// 获取 Session
		HttpSession session = request.getSession();
		List<Staff> user = (List<Staff>) session.getAttribute("USER_SESSION");
		// 判断 Session 中是否有用户数据，如果有，则返回 true,继续向下执行
		if (user != null) {
			return true;
		}
		// 不符合条件的给出提示信息，并转发到登录页面
		request.setAttribute("msg", "您还没有登录，请先登录！");
		request.getRequestDispatcher("/WEB-INF/web/login.jsp").forward(request, response);
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("LoginInterceptorpostHandle");

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("LoginInterceptorafterCompletion");

	}

}
