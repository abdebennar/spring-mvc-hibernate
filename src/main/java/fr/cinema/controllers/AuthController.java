package fr.cinema.controllers;

import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fr.cinema.entities.User;
import fr.cinema.models.JwtService;
import fr.cinema.services.UserService;
import fr.cinema.types.RoleType;

@Controller
public class AuthController {

    @Autowired
    private JwtService jwtService;
    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/signup")
    public String showSignupPage() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(
            @RequestParam String username,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            Model model
    ) {
        try {
            if (!password.equals(confirmPassword)) {
                model.addAttribute("error", "Passwords do not match");
                return "signup";
            }

            userService.registerUser(username, email, password);
            model.addAttribute("success", "Account created successfully! Please sign in.");
            return "signin";

        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "signup";
        }
    }

    @GetMapping("/signin")
    public String showSigninPage() {
        return "signin";
    }

    @PostMapping("/signin")
    public String signin(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            HttpServletResponse response,
            Model model
    ) {
        Optional<User> userOpt = userService.authenticateUser(email, password);

        if (userOpt.isPresent()) {
            User user = userOpt.get();

            String userName = user.getUsername();
            String jwtToken = jwtService.generateToken(userName, RoleType.USER);

            // set as cockie
            Cookie cookie = new Cookie("jwtToken", jwtToken);
            cookie.setPath("/");
            cookie.setHttpOnly(true);
            cookie.setMaxAge(24 * 60 * 60); // 1 day

            response.addCookie(cookie);

            return "redirect:/dashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "signin";
        }
    }

    @GetMapping("/logout")
    public String logout(
            HttpSession session,
            HttpServletResponse response
    ) {
        Cookie cookie = new Cookie("jwtToken", null);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        cookie.setMaxAge(0);

        response.addCookie(cookie);
        session.invalidate();
        return "redirect:/signin";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, HttpServletRequest request, Model model) {

        String userName = (String) request.getAttribute("username");
        if (userName == null) {
            return "redirect:/signin";
        }
        model.addAttribute("username", userName);
        return "dashboard";
    }
}
