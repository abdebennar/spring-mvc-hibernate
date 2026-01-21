package fr.cinema.filters;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import fr.cinema.models.JwtService;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Autowired
    private JwtService jwtService;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String jwtToken = null;
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("jwtToken")) {
                jwtToken = cookie.getValue();
                break;
            }
        }

        if (jwtToken != null) {
            if (jwtService.isTokenValid(jwtToken)) {
                request.setAttribute("username", jwtService.extractUsername(jwtToken));
                return true; // Token is valid, proceed with the request
            }
        }
        response.sendRedirect("/signin");
        return false;
    }
}
