
            <div class="album bg-light">
               <div class="container">           
                  <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
 
<?php 

foreach ($lesEnquetes as $uneEnquete)
{
    $valeur="'".$uneEnquete['id_enquete']."'"; 
    $cle = "'"."id_enquete"."'"; 

    echo'
                    <div class="col">
                      <div class="card shadow-sm ">
                        <img src="img/super.jpg" class="bd-placeholder-img " width="100%" height="225" role="img" alt="">     
                        <div class="card-body">
                          <h3>'.$uneEnquete['libelle'].'</h3>
                          <p class="card-text">'.$uneEnquete['description_enquete'].'</p>
                          <div class="d-flex justify-content-center align-items-center">
                            <div class="btn-group">
                              <a href="index.php?page=1">
                                <input type="submit" class="btn btn-sm btn-outline-secondary" value="Participer" onclick="stockerCookie('.$cle.','.$valeur.',2)">
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>

    ';
}
?>


                  </div>
                </div>
              </div>

        