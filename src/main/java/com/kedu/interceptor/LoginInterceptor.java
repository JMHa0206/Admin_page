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
        System.out.println("[Interceptor] 요청 URI: " + uri);

        // 로그인, 정적 파일, 루트는 허용
        if (uri.equals("/") || uri.contains("/login") || uri.contains("/resources")) {
            System.out.println("[Interceptor] 로그인 or 정적 리소스 → 통과");
            return true;
        }

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            System.out.println("[Interceptor] 세션 없음 또는 user 없음 → 리디렉션");
            response.sendRedirect("/");
            return false;
        }

        System.out.println("[Interceptor] 세션 존재 → 통과");
        return true;
    }
}
