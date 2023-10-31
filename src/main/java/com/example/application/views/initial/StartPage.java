package com.example.application.views.initial;

import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.dom.Style;
import com.vaadin.flow.component.html.Div;

@Route("carousel")
@PageTitle("Carousel")
public class StartPage extends VerticalLayout {
    private int currentImageIndex = 0;
    private Image[] images = {
        new Image("images/image1.jpg", "Descrição 1"),
        new Image("images/image2.jpg", "Descrição 2"),
        new Image("images/image3.jpeg", "Descrição 3")
    };

    public StartPage() {
        addClassName("custom-carousel");
        setHeight("100vh"); // Define a altura como 100% da altura da janela
        setJustifyContentMode(JustifyContentMode.CENTER); // Centraliza verticalmente
        setAlignItems(Alignment.CENTER); // Centraliza horizontalmente

        Div backgroundDiv = new Div();
        backgroundDiv.addClassName("background-div");
        backgroundDiv.getStyle().set("background-image", "none");
        showCurrentImage();

        // Botão para a imagem anterior (seta para a esquerda)
        Image previousButton = new Image("images/left.png", "");
        previousButton.setWidth("100px"); // Define a largura da imagem
        previousButton.setHeight("100px"); // Define a altura da imagem
        previousButton.addClickListener(e -> showPreviousImage());

        // Botão para a próxima imagem (seta para a direita)
        Image nextButton = new Image("images/right.png", "");
        nextButton.setWidth("100px"); // Define a largura da imagem
        nextButton.setHeight("100px"); // Define a altura da imagem
        nextButton.addClickListener(e -> showNextImage());

        Div buttonContainer = new Div(previousButton, nextButton);
        buttonContainer.addClassName("button-container");

        Div rectangle = new Div();
        rectangle.addClassName("rectangle");

        Div bottomContainer = new Div(rectangle, buttonContainer);
        bottomContainer.addClassName("bottom-container");

        add(backgroundDiv, bottomContainer);
    }

    private void showCurrentImage() {
        Image currentImage = images[currentImageIndex];
        String imageUrl = currentImage.getSrc();

        Style backgroundStyle = getElement().getStyle();
        backgroundStyle.set("background-image", "url(" + imageUrl + ")");
        backgroundStyle.set("background-size", "cover");
        backgroundStyle.set("background-position", "center");
        backgroundStyle.set("background-repeat", "no-repeat");
    }

    private void showPreviousImage() {
        if (currentImageIndex > 0) {
            currentImageIndex--;
            showCurrentImage();
        }
    }

    private void showNextImage() {
        if (currentImageIndex < images.length - 1) {
            currentImageIndex++;
            showCurrentImage();
        }
    }
}
