using Intranet;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using MySql.Data.MySqlClient;
using System.Data.Common;

namespace Intranet
{
    public class Controleur
    {
        private static Modele unModele = new Modele("localhost", "bdd_anti_gaspi", "root", "");

        public static void InsertUniversel(Dictionary<string, string> donnees, string table, Boolean id_is_null)
        {
            unModele.InsertUniversel(donnees,table,id_is_null);
        }
        public static void UpdateUniversel(Dictionary<string, string> donnees, string table, Dictionary<string, string> where, Boolean is_and)
        {
            unModele.UpdateUniversel(donnees,table,where,is_and);
        }
        public static void DeleteUniversel(string table, Dictionary<string, string> where, Boolean is_and)
        {
            unModele.DeleteUniversel(table, where, is_and);
        }
        public static void InsertDemande_autre(Demande_autre uneDemande_autre)
        {
            unModele.InsertDemande_autre(uneDemande_autre);
        }

        public static void InsertDemande_rh(Demande_rh uneDemande_rh)
        {
            unModele.InsertDemande_rh(uneDemande_rh);
        }

        public static void DeleteDemande_autre(int id_demande_autre)
        {
            unModele.DeleteDemande_autre(id_demande_autre);
        }

        public static void DeleteDemande_rh(int id_demande_rh)
        {
            unModele.DeleteDemande_rh(id_demande_rh);
        }

        public static void UpdateDemande_autre(Demande_autre uneDemande_autre)
        {
            unModele.UpdateDemande_autre(uneDemande_autre);
        }

        public static void UpdateDemande_rh(Demande_rh uneDemande_rh)
        {
            unModele.UpdateDemande_rh(uneDemande_rh);
        }

        public static Demande_autre SelectWhereDemande_autre(int id_demande_autre)
        {
            return unModele.SelectWhereDemande_autre(id_demande_autre);
        }
        public static Employe SelectWhereEmploye(string email, string mdp)
        {
            return unModele.SelectWhereEmploye(email, mdp);
        }


        public static Demande_rh SelectWhereDemande_rh(int id_demande_rh)
        {
            return unModele.SelectWhereDemande_rh(id_demande_rh);
        }

        public static List<VDemande_autre> SelectAllVDemande_autre()
        {
            return unModele.SelectAllVDemande_autre();
        }

        public static List<VDemande_rh> SelectAllVDemande_rh()
        {
            return unModele.SelectAllVDemande_rh();
        }

        public static List<Manager> SelectAllManager()
        {
            return unModele.SelectAllManager();
        }

        public static List<Employe> SelectAllEmploye()
        {
            return unModele.SelectAllEmploye();
        }
    }
}