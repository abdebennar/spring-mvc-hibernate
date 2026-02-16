package fr.cinema.filters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import fr.cinema.models.JwtService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AdminInterceptor implements HandlerInterceptor {

    @Autowired
    private JwtService jwtService;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String jwtToken = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("jwtToken")) {
                    jwtToken = cookie.getValue();
                    break;
                }
            }
        }

        if (jwtToken != null) {
            if (jwtService.isTokenValid(jwtToken)
                    && jwtService.extractUserRole(jwtToken).equals("ADMIN")) {
                request.setAttribute("username", jwtService.extractUsername(jwtToken));
                return true; // Token is valid, proceed with the request
            }
        }
        // response.sendRedirect("/signin");
        response.getWriter().write("Access Denied: Admins Only and you are not, your place is nothing you piece of shit");
        return false;
    }
}
