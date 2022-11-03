

<?php
if(!isset($_COOKIE['numquestion']))
{
	setcookie('numquestion', 1, time()+3600*24, '/');
}
if(!isset($_COOKIE['moyenne']))
{
	setcookie('moyenne', 0, time()+3600*24, '/');
}
if($laQuestion['type_question'] != "note" or $laQuestion['type_question'] != "note_image")
{
	$LesResponses = explode("|", $laQuestion['reponse']);
}
echo'
<form method="post">
	<div class="container d-flex justify-content-center">';
				if($laQuestion['type_question'] == "note" or $laQuestion['type_question'] == "note_image")
				{
					echo'
					<div class="box_question">
						<fieldset id="note">
							<div class="question">
								<div class="reponse">
									<div class="question">
									<h3>'.$laQuestion['libelle'].'</h3></div>';
									if($laQuestion['type_question'] == "note_image")
									{
										echo'<img class="image" src="img/caddie2.jpg">';
									}
									echo'
									<label> '.$laQuestion['question'].' :</label>
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

								';
				}
				if($laQuestion['type_question'] == "qcm" or $laQuestion['type_question'] == "qcm_image")
				{
					echo'
                    <div class="row box_question">
                    	<div class="col-12">
                        	<fieldset id="QCM">
                            	<div class="question">
                        			<h3>'.$laQuestion['libelle'].'</h3></div>';
									if($laQuestion['type_question'] == "qcm_image")
									{
										echo'<img class="image" src="img/super.jpg">';
									}
									echo'
									<div class="row">
										<label class="reponse" > '.$laQuestion['question'].' :</label>';
					for($i=0; $i<count($LesResponses);$i++) //boucle pour afficher les reponses en fonction du nombre de réponse
					{
						echo'
							<div class="col-md-'.(12/count($LesResponses)).' reponse">
								<input type="radio" id="'.($i+1).'" name="rep'.($i+1).'"/>'.$LesResponses[$i].'
							</div>
						';
					}
				}
				if($laQuestion['type_question'] == "qcu" or $laQuestion['type_question'] == "qcu_image")
				{
					echo'
						<div CLASS="container d-flex justify-content-center">
							<div class="row box_question">
								<div class="col-12">
								<fieldset id="QCU">
									<div class="question">
									<h3>'.$laQuestion['libelle'].'</h3></div>';
									if($laQuestion['type_question'] == "qcu_image")
									{
										echo'<img class="image" src="img/food_2.jpeg">';
									}
									echo'
									<div class="row">
									<label class="reponse" >'.$laQuestion['question'].'</label>';
					for($i=0; $i<count($LesResponses);$i++)
					{
						echo'
										<div class="col-md-'.(12/count($LesResponses)).' reponse">
											<input type="radio" id="'.($i+1).'" name="reponse"/>'.$LesResponses[$i].'
										</div>
						';
					}
				}
				echo '</div><div class="question">';
				if($_COOKIE['numquestion'] != 1)
				{
					echo'<button class="btn btn-secondary" id="prec" onclick="precedent()"> 👈🏼 </button>';
				}
				$nomcook="'reponse_".$_COOKIE['id_enquete']."_".$_COOKIE['numquestion']."'";
				if($_COOKIE['numquestion'] < $nbrQuestions['nb'])
				{
					
					echo'<button class="btn btn-primary" id="suiv" onclick="cookie_reponse('.$nomcook.','.count($LesResponses).",'".$laQuestion['type_question']."');suivant();".'"> 👉🏼 </button>';
				}else
				{
					echo'
					<a href="index.php?page=13">
						<input type="button" class="btn btn-primary" value="✔️" onclick="cookie_reponse('.$nomcook.','.count($LesResponses).",'".$laQuestion['type_question']."');moyenne(".$_COOKIE['id_enquete'].");".'">
				  	</a>';
				}
				echo'
			   </div>
			</fieldset>
		</div>';
		if($laQuestion['type_question'] != "note" or $laQuestion['type_question'] != "note_image")
		{
			echo'</div>';
		}
?>
	</div>
</form>