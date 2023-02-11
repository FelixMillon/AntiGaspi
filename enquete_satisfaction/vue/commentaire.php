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
                    <div class="question">
                      <h3>Commentaire</h3></div>
                      <div class="reponse">
                            <div class="reponse">
                                <label> Qqch à ajouter :</label></div>
                                
                                <input type="text" id="name" name="name" required maxlength="280" size="50">
                            </div>
                           
                            <div class="question">
                              <button class="btn btn-secondary"> 👈🏼 </button>
                      
                              <button class="btn btn-primary"> 👉🏼 </button>
                            </div>
                        </fieldset>
                      </div>
                  </div>
                </div>
            </form>



        </main>

            <footer class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-3 border-top colorHeader">
              <p class="col-md-4 mb-0 text-light" style="padding-left: 6%; white-space: nowrap;" >©Copyright 2022 FireCrest</p>
          
              <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
              </a>
          
              <ul class="nav col-md-4 justify-content-end" style="padding-right: 6%; white-space: nowrap;">
                <li class="nav-item"><a href="#" class="nav-link px-2 text-light">Mentions légales</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-light">Conditions générle d'uilisation</a></li>
              </ul>
            </footer>
          
    <script src="../js/front.js"></script>
    </body>
</html>