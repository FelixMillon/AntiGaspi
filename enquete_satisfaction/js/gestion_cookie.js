function stockerCookie(cle, valeur, delai) {
    let chaine = '';
    let uneDate = new Date();

    uneDate.setTime(uneDate.getTime() + delai * 24 * 3600 * 1000);
    let dt = uneDate.toUTCString();

    chaine = `${cle} = ${valeur}; expires= ${dt}; path=/`  
    document.cookie = chaine;
}

function lireCookie(cle) {
    let chaineCookies = document.cookie;
    let tab = chaineCookies.split(";");

    for (let i=0; i<tab.length; i++) {			
        let tab2 = tab[i].split("=");
       
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

 function supprimerCookie(cle) 
{
    stockerCookie(cle, '', -1);
}

function reponse_qcm(cle,n){

    if(typeof(n) == 'string')
    {
        n = parseInt(n);
    }

    let resu = 0;

    for(let i=1; i<=n;i++)
    {
        if(document.getElementById(i).checked == true){
            resu =  resu + 10/n ;
        }
    }

    stockerCookie(cle, resu, 2);
   
}

function reponse_qcu(cle,n){

    if(typeof(n) == 'string')
    {
        n = parseInt(n);
    }
    stockerCookie(cle, 0, 2);
    for(let i=1;i<=n;i++)
    {
        if(document.getElementById(i).checked == true){
            res = 10*((n-i)/(n-1));
            res = res.toFixed(2);
            stockerCookie(cle, res, 2);
            break;
        }
    }
}




function reponse_note(cle)
{
    resu=0;
    for(let i=0; i<=10;i++)
    {
        if(document.getElementById(i).checked == true)
        {
            resu=document.getElementById(i).value;
        }
    }
    stockerCookie(cle, resu, 2);
}

function cookie_reponse(cle,n,letype)
{
    if(letype=='note' || letype=='note_image')
    {
        reponse_note(cle);
    }else if(letype=='qcm' || letype=='qcm_image')
    {
        reponse_qcm(cle,n);
    }else if(letype=='qcu' || letype=='qcu_image')
    {
        reponse_qcu(cle,n);
    }
}

function suivant()
{
    let num = lireCookie('numquestion');
    if(typeof(num) == 'string') {
        num = parseInt(num);
      }
    num++;
    stockerCookie('numquestion',num,1)
}
function precedent()
{
    let num = lireCookie('numquestion');
    if(typeof(num) === 'string') {
        num = parseInt(num);
      }
    num-=1;
    stockerCookie('numquestion',num,1)
}