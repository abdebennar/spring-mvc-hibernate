package fr.cinema.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;

// https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/WebApplicationInitializer.html
public class WebApplicationConfig implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.register(WebConfig.class);

        DispatcherServlet dispatcherServlet = new DispatcherServlet(context);
        ServletRegistration.Dynamic registration = servletContext.addServlet("dispatcher", dispatcherServlet);
        registration.setLoadOnStartup(1);
        registration.addMapping("/");
        
        // Enable multipart for file upload
        registration.setMultipartConfig(
            new jakarta.servlet.MultipartConfigElement(
                "/tmp",      // location
                10485760,    // max file size (10MB)
                20971520,    // max request size (20MB)
                5242880      // file size threshold (5MB)
            )
        );

        // Register H2 Console Servlet
        try {
            ServletRegistration.Dynamic h2ConsoleServlet = servletContext.addServlet(
                    "H2Console",
                    new org.h2.server.web.JakartaWebServlet()
            );
            h2ConsoleServlet.addMapping("/h2-console/*");
            h2ConsoleServlet.setLoadOnStartup(2);
        } catch (Exception e) {
            System.err.println("Failed to register H2 Console: " + e.getMessage());
        }
    }

}
