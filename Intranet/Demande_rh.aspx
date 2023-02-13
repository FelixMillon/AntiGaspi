<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>


<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion Demande rh </h2>
<div class="d-flex justifiy-content-center">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Demande_rh laDemande_rh = null;
    Employe leEmploye_rhs = null;
    string leEmploye_rhs_email = "";
    string leEmploye_rhs_nom = "";
    string leEmploye_rhs_prenom = "";
    string leEmploye_rhs_tel = "";
    string leEmploye_rhs_numrue = "";
    string leEmploye_rhs_rue = "";
    string leEmploye_rhs_ville = "";
    string leEmploye_rhs_cp = "";
    string leEmploye_rhs_fonction = "";
    string leEmploye_rhs_salaire = "";
    string leEmploye_rhs_droits = "";
    string leEmploye_rhs_id_planning = "";
    string leEmploye_rhs_niveau_diplome = "";
    string leEmploye_rhs_id_manager = "";
    string leEmploye_rhs_id_local = "";
    


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
            case "edit" : 
                laDemande_rh = Intranet.Controleur.SelectWhereDemande_rh(id_demande_rh);
                if(Request["id_employe"]!=null)
                {
                    int le_id_employe_rhs = int.Parse(Request["id_employe"]);
                    leEmploye_rhs = Intranet.Controleur.SelectWhereEmploye(le_id_employe_rhs);
                }
                break;
        }
    }
    List<Intranet.Employe> lesEmploye_rhs = Intranet.Controleur.SelectWhereEmployeEtSesTroufions(Session["id"].ToString());
    if(Session["droits"].ToString() == "administrateur_rh")
    {
        lesEmploye_rhs = Intranet.Controleur.SelectAllEmploye();
    }
    List<Intranet.Manager> lesManager_rhs = Intranet.Controleur.SelectAllManager();
    List<Intranet.Planning> lesPlanning_rhs = Intranet.Controleur.SelectAllPlanning();
    List<Intranet.Local> lesLocal_rhs = Intranet.Controleur.SelectAllLocal();
%>

<h4>Insertion d'une demande rh</h4>
<!-- #include file="vue/vue_insert_demande_rh.aspx"-->


<%
    string laRequete="";
    string LeNettoyeur= "";
    if(Request.Form["valider"] != null || Request.Form["modifier"] != null)
    {
        Debug.WriteLine(Request.Form["salaire"]);
        if(Request.Form["type_operation"] != null)
        {
            laRequete = Request.Form["type_operation"]+"|";
            if(Request.Form["type_operation"]=="insert")
            {
                laRequete+= "email=" + "null," ;
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["prenom"]+Request.Form["nom"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "mdp="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["nom"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "nom="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["prenom"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "prenom=" + LeNettoyeur + ",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["tel"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "tel="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["rue"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "rue="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["numrue"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "numrue="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["ville"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "ville="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["cp"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "cp="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["fonction"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "fonction="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["salaire"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "salaire="+LeNettoyeur+",";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["niveau_diplome"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "niveau_diplome="+LeNettoyeur+",";
                laRequete+= "date_embauche=sysdate,";
                laRequete+= "date_depart=null,";
                LeNettoyeur= "";
                LeNettoyeur= Request.Form["droits"];
                LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");

                laRequete+= "droits="+LeNettoyeur+",";
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
                string[] lesattributsupdate = {"email", "nom", "prenom", "tel","rue", "numrue", "ville", "cp","fonction","salaire","niveau_diplome","droits"};
                List<string> attributs = new List<string>();
                foreach(string unattribut in lesattributsupdate)
                {
                    if(Request.Form[unattribut] != "")
                    {
                        LeNettoyeur= "";
                        LeNettoyeur= Request.Form[unattribut];
                        if(Request.Form[unattribut] !=null)
                        {
                            LeNettoyeur= Regex.Replace(LeNettoyeur, ",", ".");
                            LeNettoyeur= Regex.Replace(LeNettoyeur, "\\|", "");
                            LeNettoyeur= Regex.Replace(LeNettoyeur, "=", "");
                        }
                        Debug.WriteLine(LeNettoyeur);
                        attributs.Add(unattribut+'='+LeNettoyeur);
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
    if(Request.Form["annuler"] != null ){
        Response.Redirect("Default.aspx?page=5");
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
        lesEmploye_rhs = Intranet.Controleur.SelectAllEmploye();
        Response.Redirect("Default.aspx?page=5");
    }
%>

<%= message %>

<% 
    List<Intranet.VDemande_rh> lesDemande_rhs = Intranet.Controleur.SelectAllVDemande_rh(Session["id"].ToString());
    if(Session["droits"].ToString() == "administrateur_rh")
    {
        lesDemande_rhs = Intranet.Controleur.SelectAllVDemande_rh();
    }
%>

 <!-- #include file="vue/vue_les_demandes_rhs.aspx"-->