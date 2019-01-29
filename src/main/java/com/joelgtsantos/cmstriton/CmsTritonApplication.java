package com.joelgtsantos.cmstriton;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.context.annotation.Bean;

import com.joelgtsantos.cmstriton.filters.ErrorFilter;
import com.joelgtsantos.cmstriton.filters.PostFilter;
import com.joelgtsantos.cmstriton.filters.PreFilter;
import com.joelgtsantos.cmstriton.filters.RouteFilter;

@SpringBootApplication
@EnableZuulProxy
public class CmsTritonApplication {

	public static void main(String[] args) {
		SpringApplication.run(CmsTritonApplication.class, args);
	}
	
	@Bean
    public PreFilter preFilter() {
        return new PreFilter();
    }
    @Bean
    public PostFilter postFilter() {
        return new PostFilter();
    }
    @Bean
    public ErrorFilter errorFilter() {
        return new ErrorFilter();
    }
    @Bean
    public RouteFilter routeFilter() {
        return new RouteFilter();
    }
}