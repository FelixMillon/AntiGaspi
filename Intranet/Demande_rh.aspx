
<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Diagnostics" %>


<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion Demande rh </h2>
<div class="d-flex justifiy-content-center">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Demande_rh laDemande_rh = null; 

    if (Request["page"] != null && Request["action"] != null && Request["id_demande_rh"] != null)
    {
    string action = Request["action"];
    int id_demande_rh = int.Parse(Request["id_demande_rh"]);

    switch(action)
        {
            case "sup" :
                where.Clear();
                where.Add("id_demande_rh",Request["id_demande_rh"]);
                Controleur.DeleteUniversel("demande_rh", where, true);
                break;
            case "edit" : laDemande_rh = Intranet.Controleur.SelectWhereDemande_rh(id_demande_rh); break;
        }
    }

    List<Intranet.Employe> lesEmploye_rhs = Intranet.Controleur.SelectAllEmploye();
    List<Intranet.Manager> lesManager_rhs = Intranet.Controleur.SelectAllManager();
%>

<h4>Insertion d'une demande rh</h4>
<!-- #include file="vue/vue_insert_demande_rh.aspx"-->


<%
    string laRequete="";
    if(Request.Form["valider"] != null || Request.Form["modifier"] != null)
    {
        if(Request.Form["type_operation"] != null)
        {
            laRequete = Request.Form["type_operation"]+"|";
            if(Request.Form["type_operation"]=="insert")
            {
                laRequete+= "email=" + "null," ;
                laRequete+= "mdp="+Request.Form["prenom"]+Request.Form["nom"]+",";
                laRequete+= "nom="+Request.Form["nom"]+",";
                laRequete+= "prenom=" + Request.Form["prenom"] + ",";
                laRequete+= "tel="+Request.Form["tel"]+",";
                laRequete+= "rue="+Request.Form["rue"]+",";
                laRequete+= "numrue="+Request.Form["numrue"]+",";
                laRequete+= "ville="+Request.Form["ville"]+",";
                laRequete+= "cp="+Request.Form["cp"]+",";
                laRequete+= "fonction="+Request.Form["fonction"]+",";
                laRequete+= "salaire="+Request.Form["salaire"]+",";
                laRequete+= "niveau_diplome="+Request.Form["niveau_diplome"]+",";
                laRequete+= "date_embauche=sysdate,";
                laRequete+= "date_depart=null,";
                laRequete+= "droits="+Request.Form["droits"]+",";
                laRequete+= "id_planning=1,";
                laRequete+= "id_manager=null,";
                laRequete+= "id_local=null";
            }
            if(Request.Form["type_operation"]=="delete")
            {
                laRequete+=Request.Form["id_employe"];
            }
            if(Request.Form["type_operation"]=="update")
            {
                string[] lesattributsupdate = {"email", "nom", "prenom", "tel","rue", "numrue", "ville", "cp","fonction","niveau_diplome","droits"};
                List<string> attributs = new List<string>();
                foreach(string unattribut in lesattributsupdate)
                {
                    if(Request.Form[unattribut] != "")
                    {
                        attributs.Add(unattribut+'='+Request.Form[unattribut]);
                    }
                }
                laRequete+=String.Join(",", attributs)+'|';
                laRequete+=Request.Form["id_employe"];
            }
            Debug.WriteLine(laRequete);
        }
    }

        

    
    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("objet",Request.Form["objet"]);
        valeurs.Add("requete_sql",laRequete);
        valeurs.Add("date_demande","sysdate");
        valeurs.Add("date_resolution","null");
        valeurs.Add("etat","attente");
        valeurs.Add("id_employe",Session["id"].ToString());
        valeurs.Add("id_manager","null");

        Controleur.InsertUniversel(valeurs,"demande_rh",true);
        Debug.WriteLine(laRequete);
        message = "<br> Insertion reussie";
    }

    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("objet",Request.Form["objet"]);
        if(laRequete == "")
        {
            valeurs.Add("requete_sql",laDemande_rh.Requete_sql);
        }else
        {
            valeurs.Add("requete_sql",laRequete);
        }
        
        valeurs.Add("etat",Request.Form["etat"]);
        valeurs.Add("id_employe",Session["id"].ToString());

        where.Clear();
        where.Add("id_demande_rh",Request["id_demande_rh"]);
        Debug.WriteLine(laRequete);
        Controleur.UpdateUniversel(valeurs,"demande_rh",where,true);
        if(Request.Form["etat"] == "accepte")
        {
            if(laRequete == "")
            {
                Controleur.constructeurrequete(laDemande_rh.Requete_sql);
            }else
            {
                Controleur.constructeurrequete(laRequete);
            }
            
        }

        message = "<br> Modification reussie";
        //Response.Redirect("Default.aspx?page=5");
    }
%>

<%= message %>

<% 
    List<Intranet.VDemande_rh> lesDemande_rhs = Intranet.Controleur.SelectAllVDemande_rh();
%>

 <!-- #include file="vue/vue_les_demandes_rhs.aspx"-->