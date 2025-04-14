package com.kedu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        String uri = request.getRequestURI();
        System.out.println("[Interceptor] ��û URI: " + uri);

        // �α���, ���� ����, ��Ʈ�� ���
        if (uri.equals("/") || uri.contains("/login") || uri.contains("/resources")) {
            System.out.println("[Interceptor] �α��� or ���� ���ҽ� �� ���");
            return true;
        }

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            System.out.println("[Interceptor] ���� ���� �Ǵ� user ���� �� ���𷺼�");
            response.sendRedirect("/");
            return false;
        }

        System.out.println("[Interceptor] ���� ���� �� ���");
        return true;
    }
}
