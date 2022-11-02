
function moyenne(id_enquete)
{   
    lesCookies = list_value(id_enquete);
    let moy = 0;
    for(let y=0; y<lesCookies.length; y++){
        moy = moy + parseFloat(lesCookies[y]);
    }
    moy = moy / lesCookies.length;
    stockerCookie('moyenne', moy, 1);
}


function list_value(id_enquete)
{
    let chaineCookies = document.cookie;
    let tab = chaineCookies.split(";");
    let lesCookies = [];
    var reg = new RegExp('reponse_'+id_enquete+'_[0-9]+');

    for (let i=0; i<tab.length; i++) {            
        let tab2 = tab[i].split("=");
        while(tab2[0].charAt(0) == ' ') {
            tab2[0] = tab2[0].substring(1);
        }
        if (reg.test(tab2[0])) {
            lesCookies.push(tab2[1]);
        }
    }
    return lesCookies;
}





