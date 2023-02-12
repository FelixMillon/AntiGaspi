
<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Diagnostics" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" > Badgeages </h2>

            <!-- #include file="vue/vue_insert_badgeage.aspx"-->

<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"> </div>
    <div class="col-5" style="padding-right:3%;"> 


<%
    VBadgeage leBadgeage =  null;

    if(Request["page"] != null && Request["action"] != null && Request["id_badgeage"] != null)
    {
    string action = Request["action"];
    int id_badgeage = int.Parse(Request["id_badgeage"]);

    switch(action)
        {
            case "sup" :
                where.Clear();
                where.Add("id_badgeage",Request["id_badgeage"]);
                Controleur.DeleteUniversel("badgeage", where, true);
                break;
        }
    }

    List<Intranet.Employe> lesEmploye_badgeages = Intranet.Controleur.SelectAllEmploye();
    int leid = int.Parse(Session["id"].ToString());
    Debug.WriteLine(leid);
    List<Intranet.VBadgeage> lesBadgeagesCal = Intranet.Controleur.SelectAllVBadgeage(leid);
%>

 <!-- #include file="vue/vue_les_badgeages_temps.aspx"-->
</div>
<div class="col-5" style="padding-left:3%">

<%

    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("date_heure","null");
        valeurs.Add("type",null);
        valeurs.Add("id_employe",Session["id"].ToString());
        Controleur.InsertUniversel(valeurs,"badgeage",true);
        message = "<br> Insertion reussie";
    }
%>

<%= message %>

<% 
    List<Intranet.VBadgeage> lesBadgeages = Intranet.Controleur.SelectAllVBadgeage(leid);
%>

 <!-- #include file="vue/vue_les_badgeages.aspx"-->
<div class="col-1"> </div>

</div>