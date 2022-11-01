
        

        <main>

            
            <form method="post">
                <div class="container d-flex justify-content-center">
                    <div class="row box_question">
                      <div class="col-12">
                        <fieldset id="QCU">
                          <div class="question">
                            <h3>Question 1</h3>
        
                            <div class="row">
                                <label class="reponse" > QCU :</label>
                                
                                <div class="col-md-3 reponse">
                                <input class="reponse" type="radio" name="reponse-qcu" id="1"/>Très bien
                                </div>

                                <div class="col-md-3 reponse">
                                <input class="reponse" type="radio" name="reponse-qcu" id="2"/>Bien
                                </div>

                                <div class="col-md-3 reponse">
                                <input class="reponse" type="radio" name="reponse-qcu" id="3"/>Mauvais
                                </div>

                                <div class="col-md-3 reponse">
                                <input class="reponse" type="radio" name="reponse-qcu" id="4"/>Très mauvais
                                </div>
                               
                            </div>

                            <div id="qcu"></div>
                            

                            <div class="question">
                              <button class="btn btn-secondary"> 👈🏼 </button>
                      
                              <button class="btn btn-primary" onclick="qcu('questionunique',4)"> 👉🏼 </button>

                              <button class="btn btn-primary" onclick="moyenne(1)"> test moyenne  </button>
                             </div>
                           
                          </div>
                        </fieldset>
                      </div>
                    </div>                   
                </div>
            </form>
        </main>
