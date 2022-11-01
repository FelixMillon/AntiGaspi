<!DOCTYPE html>
<html lang="fr">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../js/style.css">
    <link rel="stylesheet" href="../js/style_ambrine.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FireCrest | Pré-connexion </title>
</head>
    <body>
        <!-- <header>
            <h1>Emplacement Header</h1>
            <button type="button" id="btn" onclick="changePage('home')">home</button>
            <button type="button" id="btn" onclick="changePage('page_1')">page 1</button>
            <button type="button" id="btn" onclick="changePage('page_2')">page 2</button>
        </header> -->
        
            <header class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-2 mb-4 border-bottom colorHeader">
              <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none" >
                <img src="../img/logo1.png" class="bi me-2 " style="width: 10vw;" role="img" alt="">
              </a>
              
        
              <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-light">Collaborateur</a></li>
                <li><a href="#" class="nav-link px-2 link-light">Assistance</a></li>
                <li><a href="#" class="nav-link px-2 link-light">à propos</a></li>
              </ul>
        
              <div class="nav col-md-3 text-end" style="padding-left: 17%; white-space: nowrap;">
                <li><a href="#" class="nav-link px-2 link-light">Nom Prénom</a></li>
              </div>
            </header>
        

        <main>
            
          
          <form method="post">
            <div class="container d-flex justify-content-center">
              

                <div class="box_question">
                    <fieldset id="note">
                      <div class="question">
                        <h3>Question 1</h3></div>

                            <img class="image" src="../img/quizz.jpg"> 

                        
                        <div class="question">
                          <div class="reponse">
                            <label> Note :</label>
                          </div>
                           
                            <input class="reponse-note" type="radio" name="reponse-note" value="0" id="0"/>
                            <label for="0">0</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="1" id="1"/>
                            <label for="1">1</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="2" id="2"/>
                            <label for="2">2</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="3" id="3"/>
                            <label for="3">3</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="4" id="4"/>
                            <label for="4">4</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="5" id="5"/>
                            <label for="5">5</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="6" id="6"/>
                            <label for="6">6</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="7" id="7"/>
                            <label for="7">7</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="8" id="8"/>
                            <label for="8">8</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="9" id="9"/>
                            <label for="9">9</label>
                            <input class="reponse-note" type="radio" name="reponse-note" value="10" id="10"/>
                            <label for="10">10</label>
    
                        </div>
                        
                        <div class="question">                        
                          <button class="btn btn-secondary"> 👈🏼 </button>
                      
                          <button class="btn btn-primary"> 👉🏼 </button>
                          
                        </div>  
                    </fieldset>
                </div> 
            </div>
          </form>



        </main>
