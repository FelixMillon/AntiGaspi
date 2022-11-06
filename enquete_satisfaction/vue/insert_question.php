

<div class="col-md-7 col-lg-8">
<h2>Insertion d'une question dans l'enquête <?php echo $_COOKIE['session_enquete'];?></h2>
<hr class="my-5">
        <form method="post">
          <div class="row g-3">

			<div class="col-12" style="width:50%">
              <input type="text" class="form-control" placeholder="Libellé de la question" name="libelle" >
            </div>


			<div class="col-12" style="width:50%">
              <input type="text" class="form-control" placeholder="Question" name="question" >
            </div>


			<select class="form-select" style="width:50%" name="type_question" id="typequestion" onchange="genrequest();">
					<option value="" selected disabled hidden> ---- Type de question ----</option>
					<option value="note"> Question à note </option>
					<option value="note_image"> Question à note avec image </option>
					<option value="qcm"> Question à choix multiple </option>
					<option value="qcm_image"> Question à choix multiple avec image </option>
                    <option value="qcu"> Question à choix unique </option>
                    <option value="qcu_image" > Question à choix unique avec image </option>
            </select>

			<div class="col-12" style="width:50%" id="divreponses">
            </div>

			<div class="col-12" style="width:100%" id="divlesreponses">
            </div>

          </div>

          <hr class="my-5">
	
		  <input type="submit" class="btn btn-sm btn-outline-success" name="Valider" value="Valider">';
		 <input type="reset" name="Annuler" value="Annuler" class="btn btn-sm btn-outline-danger" > 		 
        </form>
      </div>

<script type="text/javascript">

	function genrequest()
	{
		type = document.getElementById("typequestion").value;
		if(type == 'qcu' || type == 'qcm' || type == 'qcu_image' || type == 'qcm_image')
		{
			let chaine = '';
			chaine +='<select class="form-select" style="width:50%" id="nbreponse" onchange="mesrep()">';
			chaine +='<option value="" selected disabled hidden> ---- Nombre de réponses ----</option>';
			chaine +='<option value="1"> Une Reponse </option>';
			chaine +='<option value="2"> Deux Reponses </option>';
			chaine +='<option value="3"> Trois Reponses </option>';
			chaine +='<option value="4"> Quatres Reponses </option>';
            chaine +='<option value="6"> Six Reponses </option>';
            chaine +='</select>';
			document.getElementById("divreponses").innerHTML = chaine;
		}else{
			document.getElementById("divreponses").innerHTML = '';
			document.getElementById("divlesreponses").innerHTML = '';
		}
	}
	function mesrep()
	{
		let n = document.getElementById("nbreponse").value;
		if(typeof(n) == 'string')
		{
			n = parseInt(n);
		}
		let chaine ='';
		for(let i=1; i<=n; i++)
		{
			chaine += '<div class="col-12" style="width:100%">';
			chaine += '<input type="text"  class="form-control" name="reponse_'+i.toString()+'" placeholder="reponse '+i.toString()+'">';
			chaine += '</div>';
		}
		document.getElementById("divlesreponses").innerHTML = chaine;
	}

</script>
