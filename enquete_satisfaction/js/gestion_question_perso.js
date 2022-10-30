function stockerCookie(cle, valeur, delai)
{
    let chaine = ""; 

    //récupérer la date système
    let uneDate = new Date();

    //on va lui ajouter le délai
    uneDate.setTime (uneDate.getTime() + delai *24*3600*1000); 

    //transformer en chaine
    let dt = uneDate.toUTCString(); 

    //on concatène le tout : clé = valeur ; expires = dt ; path=/
    chaine =cle+"="+valeur+ ";expires="+ dt +"path=/";

    //pour stocker dans le cookie : 
    document.cookie = chaine; 
    //alert(chaine);

}

function gestion_perso()
{
    let civilite = document.getElementById("civilite").value;  
    stockerCookie("civil", civilite, 2); 

    let nom = document.getElementById("nom").value; 
    stockerCookie("nompers", nom, 2); 

    let prenom = document.getElementById("prenom").value; 
    stockerCookie("prenompers", prenom, 2); 

    let ages = document.getElementById("age").value; 
    alert(ages);
    stockerCookie("agepers", ages, 2);

    let ville = document.getElementById("ville").value; 
    stockerCookie("villepers", ville, 2); 
}