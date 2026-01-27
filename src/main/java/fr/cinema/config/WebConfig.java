package fr.cinema.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import fr.cinema.filters.AdminInterceptor;
import fr.cinema.filters.AuthInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "fr.cinema")
public class WebConfig implements WebMvcConfigurer {

    // Freemarker configuration
    @Autowired
    private AuthInterceptor authInterceptor;
    @Autowired
    private AdminInterceptor adminInterceptor;

    // @Bean
    // public FreeMarkerConfigurer freeMarkerConfigurer() {
    //     FreeMarkerConfigurer configurer = new FreeMarkerConfigurer();
    //     configurer.setTemplateLoaderPath("/WEB-INF/views/");
    //     configurer.setDefaultEncoding("UTF-8");
    //     return configurer;
    // }
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    // File upload support
    // @Bean
    // public CommonsMultipartResolver multipartResolver() {
    //     CommonsMultipartResolver resolver = new CommonsMultipartResolver();
    //     resolver.setMaxUploadSize(10485760); // 10MB
    //     return resolver;
    // }
    // Static resources (images, CSS, JS)
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**")
                .addResourceLocations("file:/tmp/cinema-uploads/");
        registry.addResourceHandler("/static/**")
                .addResourceLocations("/static/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/**") // Apply to protected routes
                .excludePathPatterns("/signin", "/signup", "/"); // Exclude public routes
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/**");
    }
}
