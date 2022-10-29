
function stockerCookie(cle, valeur, delai) {
    let chaine = '';
    let uneDate = new Date();

    uneDate.setTime(uneDate.getTime() + delai * 24 * 3600 * 1000);
    let dt = uneDate.toUTCString();

    chaine = `${cle} = ${valeur}; expires= ${dt}; path=/`  
    document.cookie = chaine;
}



function qcu(cle,n){

    for(let i=1;i<=n;i++)
    {
        if(document.getElementById(i).checked == true){
            res = 10*((n-i)/(n-1));
            res = res.toFixed(2);
            alert(res);
            stockerCookie(cle, res, 2);
            break;
        }
    }
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

document.getElementById("qcu").innerHTML = "Note  : " + lireCookie("note");



