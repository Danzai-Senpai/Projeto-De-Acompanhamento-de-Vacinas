package com.example.application.views.initial;

import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.EmailField;
import com.vaadin.flow.component.textfield.PasswordField;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.router.Route;

@Route("Cadastro")
public class CadastroView extends VerticalLayout {

    private TextField nomeField;
    private EmailField emailField;
    private TextField enderecoField;
    private TextField cepField;
    private TextField cpfField;
    private TextField telefoneField;
    private PasswordField senhaField;

    public CadastroView() {
        Div cadastroContainer = new Div();
        cadastroContainer.addClassName("cadastro-container");

        FormLayout formLayout = new FormLayout();
        nomeField = new TextField("Nome");
        emailField = new EmailField("E-mail");
        enderecoField = new TextField("Endereço");
        cepField = new TextField("CEP");
        cpfField = new TextField("CPF");
        telefoneField = new TextField("Telefone");
        senhaField = new PasswordField("Senha");
        Button cadastrarButton = new Button("Cadastrar");

        cadastrarButton.addClickListener(e -> {
            // Coletar os dados dos campos
            String nome = nomeField.getValue();
            String email = emailField.getValue();
            String endereco = enderecoField.getValue();
            String cep = cepField.getValue();
            String cpf = cpfField.getValue();
            String telefone = telefoneField.getValue();
            String senha = senhaField.getValue();

            // Inserir os dados no banco de dados (substitua com sua lógica real)
            boolean cadastroSucesso = inserirNoBancoDeDados(nome, email, endereco, cep, cpf, telefone, senha);

            if (cadastroSucesso) {
                Notification.show("Cadastro realizado com sucesso!");
                limparCampos(); // Limpar os campos após o cadastro
            } else {
                Notification.show("Falha ao cadastrar. Tente novamente.");
            }
        });

        formLayout.add(
            nomeField,
            emailField,
            enderecoField,
            cepField,
            cpfField,
            telefoneField,
            senhaField
        );

        cadastroContainer.add(formLayout, cadastrarButton);
        add(cadastroContainer);
    }

    private boolean inserirNoBancoDeDados(String nome, String email, String endereco, String cep, String cpf, String telefone, String senha) {
        // Implemente a lógica de inserção no banco de dados aqui (substitua com sua lógica real).
        // Retorne true se o cadastro for bem-sucedido, caso contrário, retorne false.
        return true; // Exemplo de retorno bem-sucedido
    }

    private void limparCampos() {
        // Limpar os campos após o cadastro.
        nomeField.clear();
        emailField.clear();
        enderecoField.clear();
        cepField.clear();
        cpfField.clear();
        telefoneField.clear();
        senhaField.clear();
    }
}

