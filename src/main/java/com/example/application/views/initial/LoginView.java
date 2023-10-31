package com.example.application.views.initial;

import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.Hr;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.PasswordField;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.component.html.Anchor;


@PageTitle("VacinaKids - Login")
@Route(value = "Login")
public class LoginView extends VerticalLayout {

    public LoginView() {

        Div iconDiv = new Div();
        iconDiv.addClassName("login-icon");

        Image icon = new Image("icons/vacinakids.png", "Ícone de Usuário");

        icon.setWidth("124px");
        icon.setHeight("124px");
        icon.getElement().getStyle().set("margin-top", "50px");
        icon.getElement().getStyle().set("margin-bottom", "50px");


        iconDiv.add(icon);

        Div loginContainer = new Div();
        loginContainer.addClassName("login-container");

        FormLayout formLayout = new FormLayout();
        TextField cpfField = new TextField("CPF");
        PasswordField passwordField = new PasswordField("Senha");
        Button loginButton = new Button("Login");
        loginButton.addClassName("login-button");

        // Linha horizontal
        Hr horizontalLine = new Hr();

        // Botão "Esqueceu Senha"
        Anchor forgotPasswordLink = new Anchor("#", "Esqueceu Senha");
        forgotPasswordLink.getElement().getStyle().set("color", "grey");
        forgotPasswordLink.getElement().getStyle().set("margin-top", "10px");

        // Texto "ou"
        Div orText = new Div();
        orText.setText("ou");
        orText.getElement().getStyle().set("margin-top", "10px");
        orText.getElement().getStyle().set("margin-bottom", "10px");

        // Botão "Cadastre-se"
        Anchor signUpLink = new Anchor("cadastro", "Cadastre-se");
        signUpLink.getElement().getStyle().set("color", "orange");
        signUpLink.getElement().getStyle().set("margin-bottom", "20px");

        loginButton.addClickListener(e -> {
            String cpf = cpfField.getValue();
            String password = passwordField.getValue();

            if (authenticate(cpf, password)) {
                Notification.show("Login bem-sucedido!");
                getUI().ifPresent(ui -> ui.navigate(""));
            } else {
                Notification.show("CPF ou senha incorretos.");
            }
        });

        formLayout.add(iconDiv, cpfField, passwordField, loginButton, horizontalLine, forgotPasswordLink, orText, signUpLink);
        loginContainer.add(formLayout);
        add(loginContainer);

    }

    private boolean authenticate(String cpf, String password) {
        return true; // Autenticação de exemplo, substitua com sua lógica real.
    }
}