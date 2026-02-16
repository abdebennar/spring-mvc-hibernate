package fr.cinema.config;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

// https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/WebApplicationInitializer.html
public class WebApplicationConfig implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.register(WebConfig.class);

        DispatcherServlet dispatcherServlet = new DispatcherServlet(context);
        servletContext.addServlet("dispatcher", dispatcherServlet).setLoadOnStartup(1);
        servletContext.getServletRegistration("dispatcher").addMapping("/");

        // Register H2 Console Servlet
        ServletRegistration.Dynamic h2ConsoleServlet = servletContext.addServlet(
                "H2Console",
                new org.h2.server.web.WebServlet()
        );
        h2ConsoleServlet.addMapping("/h2-console/*");
        h2ConsoleServlet.setLoadOnStartup(2);
    }

}
