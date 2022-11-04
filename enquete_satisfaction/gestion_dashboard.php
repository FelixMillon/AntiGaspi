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



require_once("vue/dashboard.php");
?>