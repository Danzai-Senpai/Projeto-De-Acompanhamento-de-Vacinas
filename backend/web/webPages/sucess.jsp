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

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <script src="../scripts/main.js"></script>

  <title>VacinaKids - Responsavel</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
  <link rel="stylesheet" href="../styles/parentProfile.css" id="profileStyles" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
  <link rel="stylesheet" href="../styles/lightbox.css">

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

        <h2><%= session.getAttribute("nome_completo")%></h2>
        <p>
            <% 
                String estadoFamiliar = (String) session.getAttribute("estadoFamiliar");
                
                if ("mae".equals(estadoFamiliar)) {
                    out.println("Mãe");
                } else if ("pai".equals(estadoFamiliar)) {
                    out.println("Pai");
                } else if ("ava".equals(estadoFamiliar)) {
                    out.println("Avó");
                } else if ("avo".equals(estadoFamiliar)) {
                    out.println("Avó");
                } else if ("padrinho".equals(estadoFamiliar)) {
                    out.println("Padrinho");
                } else if ("madrinha".equals(estadoFamiliar)) {
                    out.println("Madrinha");
                } else if ("tio".equals(estadoFamiliar)) {
                    out.println("Tio");
                } else if ("tia".equals(estadoFamiliar)) {
                    out.println("Tia");
                } else if ("guardiao".equals(estadoFamiliar)) {
                    out.println("Guardião Legal");
                } else if ("tutor".equals(estadoFamiliar)) {
                    out.println("Tutor");
                } else if ("cuidador".equals(estadoFamiliar)) {
                    out.println("Cuidador");
                } else {
                    out.println("Outro Estado Familiar");
                }
        %>
    </p>
        <p><span id="idadeUsuario"></span> anos</p>

        <ul class="about">
          <li><span></span></li>
          <li><span>2</span>Filhos</li>
          <li><span></span></li>
        </ul>

        <div class="content">
          <p>
            Mãe de Enzo, de 3 anos, e de Maria de 8 meses.
            Enzo nasceu com uma condição rara que pode influenciar se deve tomar uma vacina ou não.
            (Resumo sobre a mãe e seus filhos)
          </p>
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
                    <img src="../images/Circle.png" id="sign_child" alt="" width="240" height="240">
        
                    <div class="button">
                        <button class="aboutMe"><a href="signup_child.html">Cadastrar</a></button>
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
          <div class="box">
      
            <div class="dream">
      
              <a href="../images/test/istockphoto-1322277517-612x612.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/istockphoto-1322277517-612x612.jpg" alt="">
              </a>
              <a href="../images/test/gvQ9NhQP8wbbM32jXy4V3j.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/gvQ9NhQP8wbbM32jXy4V3j.jpg" alt="">
              </a>
              <a href="../images/test/download.jpeg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/download.jpeg" alt="">
              </a>
              <a href="../images/test/Landscape-Color.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/Landscape-Color.jpg" alt="">
              </a>
              <a href="../images/test/istockphoto-517188688-612x612.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/istockphoto-517188688-612x612.jpg" alt="">
              </a>
              <a href="../images/test/tree-736885_1280.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/tree-736885_1280.jpg" alt="">
              </a>
              <a href="../images/test/Photography-Camera-HD-Wallpaper1.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/Photography-Camera-HD-Wallpaper1.jpg" alt="">
              </a>
            </div>
            <div class="dream">
              <a href="../images/test/download.jpeg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/download.jpeg" alt="">
              </a>
              <a href="../images/test/gvQ9NhQP8wbbM32jXy4V3j.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/gvQ9NhQP8wbbM32jXy4V3j.jpg" alt="">
              </a>
              <a href="../images/test/istockphoto-1322277517-612x612.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/istockphoto-1322277517-612x612.jpg" alt="">
              </a>
              <a href="../images/test/istockphoto-517188688-612x612.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/istockphoto-517188688-612x612.jpg" alt="">
              </a>
              <a href="../images/test/Landscape-Color.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/Landscape-Color.jpg" alt="">
              </a>
              <a href="../images/test/Photography-Camera-HD-Wallpaper1.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/Photography-Camera-HD-Wallpaper1.jpg" alt="">
              </a>
              <a href="../images/test/tree-736885_1280.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/tree-736885_1280.jpg" alt="">
              </a>
            </div>
            <div class="dream">
              <a href="../images/test/tree-736885_1280.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/tree-736885_1280.jpg" alt="">
              </a>
              <a href="../images/test/Photography-Camera-HD-Wallpaper1.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/Photography-Camera-HD-Wallpaper1.jpg" alt="">
              </a>
              <a href="../images/test/Landscape-Color.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/Landscape-Color.jpg" alt="">
              </a>
              <a href="../images/test/istockphoto-517188688-612x612.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/istockphoto-517188688-612x612.jpg" alt="">
              </a>
              <a href="../images/test/istockphoto-1322277517-612x612.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/istockphoto-1322277517-612x612.jpg" alt="">
              </a>
              <a href="../images/test/gvQ9NhQP8wbbM32jXy4V3j.jpg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/gvQ9NhQP8wbbM32jXy4V3j.jpg" alt="">
              </a>
              <a href="../images/test/download.jpeg" data-lightbox="models" data-title="Caption1">
                <img src="../images/test/download.jpeg" alt="">
              </a>
            </div>
          </div>
        </div>

        <div class="contatos">

        </div>

      </div>
    </div>
  </div>

  <script>
    // main.js
    document.getElementById('criancasLink').addEventListener('click', function () {
      showSection('criancas');
    });

    document.getElementById('noticiasLink').addEventListener('click', function () {
      showSection('noticias');
    });

    document.getElementById('contatoLink').addEventListener('click', function () {
      showSection('contato');
    });

    function showSection(section) {
      document.getElementById('overlay').style.display = 'block';

      document.querySelector('.criancas').style.display = 'none';
      document.querySelector('.photos').style.display = 'none';

      if (section === 'criancas') {
        document.querySelector('.criancas').style.display = 'block';
        document.getElementById('profileStyles').setAttribute('href', '../styles/parentProfile.css');
      } else if (section === 'noticias') {
        document.querySelector('.photos').style.display = 'grid';
        document.getElementById('profileStyles').setAttribute('href', '../styles/parentProfileGrid.css');
      }

      // Remover a linha abaixo
      // document.getElementById('overlay').style.display = 'background:white;';
    }

    window.onload = function () {
      showSection('criancas');
    };
  </script>
  
  <script>
      window.onload = function () {
          showSection('criancas');
          calcularIdade();
      };
      
      function calcularIdade() {
          var dataNascimento = new Date('<%= session.getAttribute("dataNascimento") %>');
          var hoje = new Date();
          var diff = Math.abs(hoje - dataNascimento);
          var idade = Math.floor(diff / (1000 * 60 * 60 * 24 * 365.25));
          document.getElementById('idadeUsuario').textContent = idade;
      }
  </script>


  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <script src="../scripts/script.js"></script>
  <script src="../scripts/lightbox-plus-jquery.min.js"></script>

</body>

</html>


