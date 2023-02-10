<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion locaux </h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Local leLocal =  null;
    if(Request["page"] != null && Request["action"] != null && Request["id_local"] != null)
    {
    string action = Request["action"];
    int id_local = int.Parse(Request["id_local"]);
    switch(action)
        {
            case "sup" : 
                where.Clear();
                where.Add("id_local",Request["id_local"]);
                Controleur.DeleteUniversel("locaux", where, true);
                break;
            case "edit": leLocal = Intranet.Controleur.SelectWhereLocal(id_local); break;
        }
    }

%>

<h4>Insertion d'un local</h4>
<!-- #include file="vue/vue_insert_local.aspx"-->


<%
    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["nom"]);
        valeurs.Add("numrue",Request.Form["numrue"]);
        valeurs.Add("rue",Request.Form["rue"]);
        valeurs.Add("ville",Request.Form["ville"]);
        valeurs.Add("cp","cp");
        Controleur.InsertUniversel(valeurs,"locaux",true);
        message = "<br> Insertion reussie";
    }
    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("nom",Request.Form["nom"]);
        valeurs.Add("numrue",Request.Form["numrue"]);
        valeurs.Add("rue",Request.Form["rue"]);
        valeurs.Add("ville",Request.Form["ville"]);
        valeurs.Add("cp","cp");
 
        where.Clear();
        where.Add("id_local",Request["id_local"]);
        Controleur.UpdateUniversel(valeurs,"locaux",where,true);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=15");
        
    }
%>

<%= message %>

<% 
    List<Intranet.Local> lesLocals = Intranet.Controleur.SelectAllLocal();
%>

 <!-- #include file="vue/vue_les_locaux.aspx"-->