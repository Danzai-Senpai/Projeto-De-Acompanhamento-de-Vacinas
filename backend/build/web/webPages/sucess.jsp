<%-- 
    Document   : sucess
    Created on : Dec 2, 2023, 11:20:09 AM
    Author     : Adrian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileNotFoundException" %>
<html lang="pt-br">

<head>

  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <script src="../scripts/main.js"></script>

  <title>VacinaKids - Responsavel</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
  <link rel="stylesheet" href="../styles/parentProfile.css" id="profileStyles" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>

</head>

<body>

  <div id="overlay"></div>
  <div class="header__wrapper">
    <header></header>
    <div class="cols__container">
      <div class="left__col">
        <div class="img__container">
          <img src="../images/woman.png" alt="Anna Smith" />
          <span></span>
        </div>
     <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>
<!-- Add more fields as needed -->
                    <h2><%= session.getAttribute("nome_completo")%></h2>
<!--                    <p>32 anos</p>-->

                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                    <div class="content">
<!--                      <p>
                        Mãe de Enzo, de 3 anos, e de Maria de 8 meses.
                        Enzo nasceu com uma condição rara que pode influenciar se deve tomar uma vacina ou não.
                        (Resumo sobre a mãe e seus filhos)
                      </p>-->
                    <div class="userData">
                        <label>Email:</label>
                        <p><%= session.getAttribute("email")%></p>
                        
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                        <label>Endereço:</label>
                        <p><%= session.getAttribute("endereco")%></p>
                        
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                        <label>CEP:</label>
                        <p><%= session.getAttribute("cep")%></p>
                        
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                        <label>CPF:</label>
                        <p><%= session.getAttribute("cpf")%></p>
                        
                    <ul class="about">
<!--                                  <li><span></span></li>
                      <li><span>2</span>Filhos</li>
                                  <li><span></span></li>-->
                    </ul>

                        <label>Telefone:</label>
                        <p><%= session.getAttribute("telefone")%></p>
                    </div>
                   




                    </div>
     
      </div>

      <div class="right__col">
        <nav>
          <ul>
            <li><a href="#" id="criancasLink">crianças</a></li>
            <li><a href="#" id="noticiasLink">noticias</a></li>
            <li><a href="#" id="contatoLink">contato</a></li>
          </ul>
        </nav>

        <div class="criancas">
          <section>
    
            <div class="swiper mySwiper container">
              <div class="swiper-wrapper content">
        
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Ally Pearson</span>
                      <span class="profession">Web Developer</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Dominic Wells</span>
                      <span class="profession">Software Engineer</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Kylie Smith</span>
                      <span class="profession">UX/UI Desinger</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Stephanie Xia</span>
                      <span class="profession">Backend Developer</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Jordan Tapp</span>
                      <span class="profession">Network Engineer</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Caroline Parker</span>
                      <span class="profession">Systems Analyst</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Maddie Crox</span>
                      <span class="profession">Frontend Developer</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Simone Mitchell</span>
                      <span class="profession">Java Developer</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide card">
                  <div class="card-content">
                    <div class="image">
                      <img src="../images/boy.jpg" alt="">
                    </div>
        
                    <div class="name-profession">
                      <span class="name">Heather Cornwell</span>
                      <span class="profession">Systems Engineer</span>
                    </div>
        
                    <div class="button">
                      <button class="aboutMe">Acessar</button>
                    </div>
                  </div>
                </div>
        
              </div>
            </div>
  
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
  
          </section>
        </div>

        <div class="photos">
          
        </div>

        <div class="contatos">

        </div>

      </div>
    </div>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      // Função para mostrar a seção de crianças e trocar a folha de estilo
      function showChildrenSection() {
        document.querySelector('.criancas').style.display = 'block';
        document.querySelector('.photos').style.display = 'none';
        document.querySelector('.contatos').style.display = 'none';
        document.getElementById('profileStyles').href = '../styles/parentProfile.css';
      }
  
      // Função para mostrar a seção de notícias, trocar a folha de estilo e exibir a seção de fotos
      function showNewsSection() {
        document.querySelector('.criancas').style.display = 'none';
        document.querySelector('.photos').style.display = 'block';
        document.querySelector('.contatos').style.display = 'none';
        document.getElementById('profileStyles').href = '../styles/parentProfileGrid.css';
      }
  
      // Função para mostrar a seção de contatos, trocar a folha de estilo e esconder a seção de fotos
      function showContactsSection() {
        document.querySelector('.criancas').style.display = 'none';
        document.querySelector('.photos').style.display = 'none';
        document.querySelector('.contatos').style.display = 'block';
        document.getElementById('profileStyles').href = '../styles/parentProfileGrid.css';
      }
  
      // Adiciona event listeners aos links do menu
      document.getElementById('criancasLink').addEventListener('click', showChildrenSection);
      document.getElementById('noticiasLink').addEventListener('click', showNewsSection);
      document.getElementById('contatoLink').addEventListener('click', showContactsSection);
  
      // Mostra a seção de crianças por padrão ao carregar a página
      showChildrenSection();
    });
  </script>  

  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script src="../scripts/script.js"></script>

</body>

</html>
