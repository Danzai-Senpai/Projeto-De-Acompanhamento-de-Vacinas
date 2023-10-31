package com.example.application;

import com.vaadin.flow.component.page.AppShellConfigurator;
import com.vaadin.flow.theme.Theme;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.vaadin.flow.component.page.Viewport;
import com.vaadin.flow.component.page.BodySize;


@SpringBootApplication
@Theme(value = "my-app")
@Viewport("width=device-width, initial-scale=1")
@BodySize(height = "100vh", width = "100vw")
public class Application implements AppShellConfigurator {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

