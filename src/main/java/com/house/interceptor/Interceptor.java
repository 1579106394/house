package com.house.interceptor;

import com.house.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 * @author
 */
public class Interceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String url = request.getRequestURI();
        // 不是登录和注册的功能，就进行拦截，如果session中没有用户登陆的信息，就跳到登录页面
        if(!url.contains("login.html") && !url.contains("register.html")) {
            User user = (User) request.getSession().getAttribute("user");
            if(user==null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
