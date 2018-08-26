<%@ Page Title="" Language="C#" MasterPageFile="~/View/Inicio/MasterInicio.master" AutoEventWireup="true" CodeFile="~/Controller/Inicio/InicioNosotros.aspx.cs" Inherits="View_Inicio_InicioNosotros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 800px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name:fade;
  -webkit-animation-duration:3s;
  animation-name: fade;
  animation-duration: 3s;
}

@-webkit-keyframes fade {
  from {opacity: 0} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
       .auto-style1 {
           text-align: center;
       }
       .auto-style3 {
           width: 100%;
       }
       .auto-style4 {
           width: 33%;
       }
       .auto-style5 {
           width: 33%;
       }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="slideshow-container">
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="../../Imagenes/1f.png" style="width: 100%">
            <div class="text">Kolegio</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="../../Imagenes/4f.png" style="width: 100%">
            <div class="text">Kolegio</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="../../Imagenes/3f.png" style="width: 100%">
            <div class="text">Kolegio</div>
        </div>
    </div>
    <br>

    <div style="text-align: center">
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>

    <script>
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
    </script>



    <div class="container">
        <div class="jumbotron">
            <h2>Plataforma Estudiantil</h2>
            <p>
                <asp:Label ID="L_Inicio" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
    </div>
    
    <div class="container">
        <div class="jumbotron" id="jumbo">
            <div class="auto-style1">
                <div class="card-body">
                    <h4 class="auto-style1">Bienvenidos</h4>
                    <p class="card-text">
                        Nuestras Instalaciones
                    </p>
                    <table class="auto-style3">
                        <tr>
                            <td class="auto-style4">
                                <div class="card" style="width: 300px">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/V1.jpg" Width="250px" />
                                </div>
                            </td>
                            <td class="auto-style5">
                                <div class="card" style="width: 300px">
                                    <div class="card" style="width: 300px">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Imagenes/V2.jpg" Width="260px" />
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="card" style="width: 300px">
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Imagenes/V3.jpg" Width="260px" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>









