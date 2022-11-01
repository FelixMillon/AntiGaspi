<?php
$unControleur->setTable("avis_enquete"); //se mettre sur la bonne table
$lesAvis= $unControleur->selectAll();

$unControleur->setTable("viewmoyparenquete");
$lesEnquetes= $unControleur->selectAll();
$nbEnquetes= $unControleur->count();
$nbEnquetes= $nbEnquetes['nb'];

$unControleur->setTable("viewmpartparenquete");
$lesParticipations= $unControleur->selectAll();



$nomEnquetes = [];
$moyEnquete = [];
$nomParticip =[];
$countParticip = [];



$j=0;
foreach($lesEnquetes as $uneEnquete)
{
	$nomEnquetes[$j] = $uneEnquete['libelle'];
	$moyEnquete[$j] = $uneEnquete['moyenne'];
	$j++;
}
$j=0;
foreach($lesParticipations as $uneParticipation)
{
	$nomParticip[$j] = $uneParticipation['libelle'];
	$countParticip[$j] = $uneParticipation['nb'];
	$j++;
}
$tot = 0;
for($i=0;$i< $nbEnquetes;$i++)
{
	$tot = $tot + $countParticip[$i];
}
$max = 0;
for($i=0;$i< $nbEnquetes;$i++)
{
	if($max < $countParticip[$i])
	{
	$max = $countParticip[$i];
	}
}

//par age

$unControleur->setTable("viewmoypartrancheage");
$LesMoyParAge= $unControleur->selectAll();

$unControleur->setTable("viewcountpartrancheage");
$LesCountParAge= $unControleur->selectAll();

$LibParAge =[];
$MoyParAge =[];
$CountParAge =[];
$j=0;
foreach($LesMoyParAge as $uneMoyParAge)
{
	$LibParAge[$j] = $uneMoyParAge['tranche_age'];
	$MoyParAge[$j] = $uneMoyParAge['nb'];
	$j++;
}
$j=0;
foreach($LesCountParAge as $unCountParAge)
{
	$CountParAge[$j] = $unCountParAge['nb'];
	$j++;
}

//par ville

$unControleur->setTable("viewmoyparville");
$LesMoyParVille= $unControleur->selectAll();

$unControleur->setTable("viewcountparville");
$LesCountParVille= $unControleur->selectAll();

$LibParVille =[];
$MoyParVille  =[];
$CountParVille  =[];
$j=0;
foreach($LesMoyParVille as $uneMoyParVille)
{
	$LibParVille[$j] = $uneMoyParVille['ville'];
	$MoyParVille[$j] = $uneMoyParVille['nb'];
	$j++;
}
$j=0;
foreach($LesCountParVille as $unCountParVille)
{
	$CountParVille[$j] = $unCountParVille['nb'];
	$j++;
}

//par civilite

$unControleur->setTable("viewcountparcivil");
$LesMoyParCivil= $unControleur->selectAll();

$unControleur->setTable("viewmoyparcivil");
$LesCountParCivil= $unControleur->selectAll();

$LibParCivil =[];
$MoyParCivil  =[];
$CountParCivil  =[];
$j=0;
foreach($LesMoyParCivil as $uneMoyParCivil)
{
	$LibParCivil[$j] = $uneMoyParCivil['civilite'];
	$MoyParCivil[$j] = $uneMoyParCivil['nb'];
	$j++;
}
$j=0;
foreach($LesCountParCivil as $unCountParCivil)
{
	$CountParCivil[$j] = $unCountParCivil['nb'];
	$j++;
}
// par age et enquete

$moyAge18 =[];
$moyAge20 =[];
$moyAge30 =[];
$moyAge40 =[];
$moyAge50 =[];
$moyAge60 =[];

$libelleAE = [];

$unControleur->setTable("viewcountparageenquete");
$LesMoyParAgeEtEnquete= $unControleur->selectAll();

$unControleur->setTable("viewmoyparageenquete");
$LesCountParAgeEtEnquete= $unControleur->selectAll();

$j=0;
foreach($LesMoyParAgeEtEnquete as $uneMoyParAgeEtEnquete)
{
	if (!in_array($uneMoyParAgeEtEnquete['libelle'], $libelleAE))
	{
		$libelleAE[count($libelleAE)] = $uneMoyParAgeEtEnquete['libelle'];
		foreach($LesMoyParAgeEtEnquete as $uneMoyParAgeEtEnquete2)
		{
			if($libelleAE[$j]==$uneMoyParAgeEtEnquete2['libelle'])
			{
				if($uneMoyParAgeEtEnquete2['tranche_age']=='18-19')
				{
					$moyAge18[$j] = $uneMoyParAgeEtEnquete2['nb'];
				}
				else
				{
					$moyAge18[$j] = null;
				}
				if($uneMoyParAgeEtEnquete2['tranche_age']=='20-29')
				{
					$moyAge20[$j] = $uneMoyParAgeEtEnquete2['nb'];
				}
				else
				{
					$moyAge20[$j] = null;
				}
				if($uneMoyParAgeEtEnquete2['tranche_age']=='30-39')
				{
					$moyAge30[$j] = $uneMoyParAgeEtEnquete2['nb'];
				}
				else
				{
					$moyAge30[$j] = null;
				}
				if($uneMoyParAgeEtEnquete2['tranche_age']=='40-49')
				{
					$moyAge40[$j] = $uneMoyParAgeEtEnquete2['nb'];
				}
				else
				{
					$moyAge40[$j] = null;
				}
				if($uneMoyParAgeEtEnquete2['tranche_age']=='50-59')
				{
					$moyAge50[$j] = $uneMoyParAgeEtEnquete2['nb'];
				}
				else
				{
					$moyAge50[$j] = null;
				}
				if($uneMoyParAgeEtEnquete2['tranche_age']=='60+')
				{
					$moyAge60[$j] = $uneMoyParAgeEtEnquete2['nb'];
				}else
				{
					$moyAge60[$j] = 0;
				}
			}
		}
		$j++;
	}
}



require_once("vue/dashboard.php");
?>