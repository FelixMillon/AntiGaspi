using Intranet;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using MySql.Data.MySqlClient;
using System.Data.Common;
using System.Web;

namespace Intranet
{
    public class Controleur
    {
        private static Modele unModele = new Modele("192.168.23.134", "bdd_anti_gaspi", "root", "root");

        public static void InsertUniversel(Dictionary<string, string> donnees, string table, Boolean id_is_null)
        {
            unModele.InsertUniversel(donnees, table, id_is_null);
        }
        public static void constructeurrequete(string donnees)
        {
            unModele.constructeurrequete(donnees);
        }
        public static void UpdateUniversel(Dictionary<string, string> donnees, string table, Dictionary<string, string> where, Boolean is_and)
        {
            unModele.UpdateUniversel(donnees, table, where, is_and);
        }
        public static void DeleteUniversel(string table, Dictionary<string, string> where, Boolean is_and)
        {
            unModele.DeleteUniversel(table, where, is_and);
        }
        public static Demande_autre SelectWhereDemande_autre(int id_demande_autre)
        {
            return unModele.SelectWhereDemande_autre(id_demande_autre);
        }
        public static Employe SelectWhereEmploye(string email, string mdp)
        {
            return unModele.SelectWhereEmploye(email, mdp);
        }
        public static Employe SelectWhereEmploye(int id_employe)
        {
            return unModele.SelectWhereEmploye(id_employe);
        }

        public static Demande_rh SelectWhereDemande_rh(int id_demande_rh)
        {
            return unModele.SelectWhereDemande_rh(id_demande_rh);
        }

        public static List<VDemande_autre> SelectAllVDemande_autre()
        {
            return unModele.SelectAllVDemande_autre();
        }

                public static List<VDemande_autre> SelectAllVDemande_autre(string id_employe)
        {
            return unModele.SelectAllVDemande_autre(id_employe);
        }

        public static List<VDemande_rh> SelectAllVDemande_rh()
        {
            return unModele.SelectAllVDemande_rh();
        }
        public static string SelectAllEmployeJson()
        {
            return unModele.SelectAllEmployeJson();
        }
        public static string constructeurObjet(string donnees)
        {
            return unModele.constructeurObjet(donnees);
        }
        public static List<Manager> SelectAllManager()
        {
            return unModele.SelectAllManager();
        }
        public static string DashboardDataAll()
        {
            return unModele.DashboardDataAll();
        }
        public static string DashboardDataPerso(int id_employe)
        {
            return unModele.DashboardDataPerso(id_employe);
        }
        public static List<Employe> SelectAllEmploye()
        {
            return unModele.SelectAllEmploye();
        }

        public static List<VBadgeage> SelectAllVBadgeage()
        {
            return unModele.SelectAllVBadgeage();
        }
        public static List<VBadgeage> SelectAllVBadgeage(int id)
        {
            return unModele.SelectAllVBadgeage(id);
        }
        public static VBadgeage SelectWhereVBadgeage(int id_badgeage)
        {
            return unModele.SelectWhereVBadgeage(id_badgeage);
        }

        public static List<Utilisateur> SelectAllUtilisateur()
        {
            return unModele.SelectAllUtilisateur();
        }

        public static List<VGerer> SelectAllVGestion()
        {
            return unModele.SelectAllVGestion();
        }

        public static VGerer SelectWhereGerer(int id_employe, int id_utilisateur, string dateheure_action)
        {
            return unModele.SelectWhereGerer(id_employe, id_utilisateur, dateheure_action);
        }

        public static VArticle SelectWhereVArticle(int id_article)
        {
            return unModele.SelectWhereVArticle(id_article);
        }

        public static List<VArticle> SelectAllVArticle()
        {
            return unModele.SelectAllVArticle();
        }
        public static List<Employe> SelectWhereEmployeEtSesTroufions(string id_employe)
        {
            return unModele.SelectWhereEmployeEtSesTroufions(id_employe);
        }
        public static Categorie_article SelectWhereCategorie_article(int id_cat_art)
        {
            return unModele.SelectWhereCategorie_article(id_cat_art);
        }

        public static List<Categorie_article> SelectAllCategorie_article()
        {
            return unModele.SelectAllCategorie_article();
        }
        public static List<VDemande_rh> SelectAllVDemande_rh( string id_employe)
        {
            return unModele.SelectAllVDemande_rh(id_employe);
        }
        public static List<Planning> SelectAllPlanning()
        {
            return unModele.SelectAllPlanning();
        }

        public static Local SelectWhereLocal(int id_local)
        {
            return unModele.SelectWhereLocal(id_local);
        }

        public static List<Local> SelectAllLocal()
        {
            return unModele.SelectAllLocal();
        }

    }
}