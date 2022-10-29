function stockerCookie(cle, valeur, delai) {
    let chaine = '';
    let uneDate = new Date();

    uneDate.setTime(uneDate.getTime() + delai * 24 * 3600 * 1000);
    let dt = uneDate.toUTCString();

    chaine = `${cle} = ${valeur}; expires= ${dt}; path=/`  
    document.cookie = chaine;
}



function qcm(cle,n){

    let resu = 0;

    for(let i=1; i<=n;i++)
    {
        if(document.getElementById(i).checked == true){
            resu =  resu + 2.5 ;
        }
    }

    stockerCookie(cle, resu, 2);
   
}


function lireCookie(cle) {
    let chaineCookies = document.cookie;
    let tab = chaineCookies.split(";");

    for (let i=0; i<tab.length; i++) {			
        let tab2 = tab[i].split("=");
        console.log(tab2);
       
        while(tab2[0].charAt(0) == ' ') {
            tab2[0] = tab2[0].substring(1);
        }
        if (tab2[0] == cle) {
            let valeur = tab2[1];
            return valeur;
        }
    }

    return null;
 }

 function supprimerCookie(cle) {
    stockerCookie(cle, '', -1);
}

document.getElementById("qcm").innerHTML = "Note  : " + lireCookie("note");



