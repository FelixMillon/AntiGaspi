
            <form method="post">
                <div class="container d-flex justify-content-center">
                  <div class="col-3"></div>
                  <div class="container box_question ">  

                    <div class="titreq">
                    <h3>A propos de vous</h3>   
                    </div>         
                                                      
                      <select class="test" id="civilite" name="civilite" value="Civilité">         
                        <option value="null">Civilité</option>          
                        <option value="Monsieur">Monsieur</option>
                        <option value="Madame">Madame</option>
                        <option value="Autres">Autres</option>
                      </select>
                    
                       
                      <select class="test" id="age" name="age" placeholder="Tranche d'âge"/>
                        <option value="null">Tranche d'âge</option>  
                        <option value="18-19">18-19</option>
                        <option value="20-29">20-29</option>
                        <option value="30-39">30-39</option>
                        <option value="40-49">40-49</option>
                        <option value="50-59">50-59</option>
                        <option value="60+">60+</option>
                      </select>

                    <div class="test" style="margin-left: 25%; margin-right: 25%;">
                        <input type="text" id="nom" class="inscricase form-control" placeholder="Nom" value="" required="" >
                      </div>
          
                      <div class="test" style="margin-left: 25%; margin-right: 25%;">
                        <input type="text" id="prenom" class="inscricase form-control" placeholder="Prénom">
                      </div>
                    
                      <div class="test" style="margin-left: 25%; margin-right: 25%;">
                          <input type="text" id="ville" class="inscricase form-control" placeholder="Ville">
                      </div>

                      <div class="question">
                      <a type="button" class="btn btn-primary btn-sm" href="index.php?page=2" onclick="gestion_perso()">  Participer </a> 
                      </div>

                  </div>
                  <div class="col-3"></div>
                </div>
            </form>