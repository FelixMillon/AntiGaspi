using System;
using System.Collections.Generic;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Diagnostics;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web.Services.Description;
using System.Collections;
using System.Web.UI.WebControls;

namespace Intranet
{

    /*      >>>>>>>> UTILITAIRES <<<<<<<<      */
    public class Modele
    {
        private string serveur, bdd, user, mdp;
        private MySqlConnection maConnexion;
        public Modele(string serveur, string bdd, string user, string mdp)
        {
            this.serveur = serveur;
            this.bdd = bdd;
            this.user = user;
            this.mdp = mdp;
            string url = "SslMode=None; SERVER=" + this.serveur + "; Database=" + this.bdd + "; User Id =" + this.user + "; Password=" + this.mdp+ "; Convert Zero Datetime=True; Allow Zero Datetime=True";

            try
            {
                this.maConnexion = new MySqlConnection(url);
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de connexion a : " + url);
            }

        }

        public static string Sha256(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }



        public static string getStringSafe(DbDataReader reader, int numero)
        {
            string valeur = "";
            if (!reader.IsDBNull(numero))
            {
                valeur = reader.GetString(numero);
            }
            return valeur;
        }
        public static int getIntSafe(DbDataReader reader, int numero)
        {
            int valeur = 0;
            if (!reader.IsDBNull(numero))
            {
                valeur = reader.GetInt32(numero);
            }
            return valeur;
        }
        public static DateTime getDateTimeSafe(DbDataReader reader, int numero)
        {
            DateTime valeur = new DateTime();
            if (!reader.IsDBNull(numero))
            {
                valeur = reader.GetDateTime(numero);
            }
            return valeur;
        }

        /*      >>>>>>>> UNIVERSEL <<<<<<<<      */
        public void InsertUniversel(Dictionary<string, string> donnees, string table,Boolean id_is_null)
        {
            List<string> attributs = new List<string>();
            Dictionary<string, string> valeurs = new Dictionary<string, string>();
            foreach(KeyValuePair<string, string> unedonnee in donnees)
            {
                if(unedonnee.Value == "null")
                {
                    attributs.Add("null");
                }else if(unedonnee.Value == "sysdate")
                {
                    attributs.Add("sysdate()");
                }else{
                    attributs.Add("@"+unedonnee.Key);
                    if(unedonnee.Key == "mdp")
                        {
                            valeurs.Add("@"+unedonnee.Key,Sha256(unedonnee.Value));
                        }else{
                            valeurs.Add("@"+unedonnee.Key,unedonnee.Value);
                        }
                }
            }
            string null_or_not="";
            if(id_is_null)
            {
                null_or_not="null,";
            }
            string requete = "insert into "+table+" values ("+null_or_not+String.Join(",", attributs)+");";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables Mysql et C#
                foreach(KeyValuePair<string, string> unevaleur in valeurs)
                {
                    uneCmde.Parameters.AddWithValue(unevaleur.Key,unevaleur.Value);
                }
                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
        }

        public void DeleteUniversel(string table,Dictionary<string, string> where, Boolean is_and)
        {
            List<string> lesconditions = new List<string>();
            Dictionary<string, string> valeurswhere = new Dictionary<string, string>();
            foreach (KeyValuePair<string, string> unecondition in where)
            {
                lesconditions.Add(unecondition.Key + "= @" + unecondition.Key);
                valeurswhere.Add("@" + unecondition.Key, unecondition.Value);
            }
            string operateur = "";
            if (is_and)
            {
                operateur = "and";
            }
            else
            {
                operateur = "or";
            }
            string requete = "delete from " + table + " where " + String.Join(" " + operateur + " ", lesconditions) + ";";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                foreach (KeyValuePair<string, string> unevaleurwhere in valeurswhere)
                {
                    uneCmde.Parameters.AddWithValue(unevaleurwhere.Key, unevaleurwhere.Value);
                }
                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
        }

        public void UpdateUniversel(Dictionary<string, string> donnees, string table, Dictionary<string, string> where, Boolean is_and)
        {
            List<string> attributs = new List<string>();
            List<string> lesconditions = new List<string>();
            Dictionary<string, string> valeurs = new Dictionary<string, string>();
            Dictionary<string, string> valeurswhere = new Dictionary<string, string>();
            foreach(KeyValuePair<string, string> unedonnee in donnees)
            {
                if(unedonnee.Value != "" && unedonnee.Value != null)
                {
                    if(unedonnee.Value == "sysdate")
                    {
                        attributs.Add(unedonnee.Key+"= sysdate()");
                    }else{
                        attributs.Add(unedonnee.Key+"=@"+unedonnee.Key);
                        if(unedonnee.Key == "mdp")
                        {
                            valeurs.Add("@"+unedonnee.Key,Sha256(unedonnee.Value));
                        }else{
                            valeurs.Add("@"+unedonnee.Key,unedonnee.Value);
                        }
                    }
                }
            }
            foreach(KeyValuePair<string, string> unecondition in where)
            {
                lesconditions.Add(unecondition.Key+"= @w"+unecondition.Key);
                valeurswhere.Add("@w"+unecondition.Key,unecondition.Value);
            }
            string operateur="";
            if(is_and)
            {
                operateur="and";
            }else{
                operateur="or";
            }

            string requete = "update "+table+" set "+String.Join(",", attributs)+" where "+String.Join(" "+operateur+" ", lesconditions)+";";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                //les correspondances entre variables MYSQL ET C#
                foreach(KeyValuePair<string, string> unevaleur in valeurs)
                {
                    uneCmde.Parameters.AddWithValue(unevaleur.Key,unevaleur.Value);
                }
                foreach(KeyValuePair<string, string> unevaleurwhere in valeurswhere)
                {
                    uneCmde.Parameters.AddWithValue(unevaleurwhere.Key,unevaleurwhere.Value);
                }
                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();

            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
        }

        /*      >>>>>>>> DEMANDE_RH <<<<<<<<      */

        public List<VDemande_rh> SelectAllVDemande_rh()
        {
            string requete = "select * from VDemande_rh;";
            List<VDemande_rh> lesVDemande_rhs = new List<VDemande_rh>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            VDemande_rh uneVDemande_rh = new VDemande_rh(
                                getIntSafe(unReader,0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getIntSafe(unReader, 7),
                                getIntSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11),
                                getStringSafe(unReader, 12)
                                );
                            //ajouter dans la liste
                            lesVDemande_rhs.Add(uneVDemande_rh);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesVDemande_rhs;
        }

        public List<VDemande_rh> SelectAllVDemande_rh(string id_employe)
        {
            string requete = "call recursedemande_rh(@id_employe);";
            List<VDemande_rh> lesVDemande_rhs = new List<VDemande_rh>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            VDemande_rh uneVDemande_rh = new VDemande_rh(
                                getIntSafe(unReader,0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getIntSafe(unReader, 7),
                                getIntSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11),
                                getStringSafe(unReader, 12)
                                );
                            //ajouter dans la liste
                            lesVDemande_rhs.Add(uneVDemande_rh);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesVDemande_rhs;
        }

        public Demande_rh SelectWhereDemande_rh(int id_demande_rh)
        {
            string requete = "select * from VDemande_rh where id_demande_rh = @id_demande_rh;";
            Demande_rh uneDemande_rh = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_demande_rh", id_demande_rh);

                //creation d'un cruseur de r�sultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                            uneDemande_rh = new Demande_rh(
                            getIntSafe(unReader,0),
                            getStringSafe(unReader,1),
                            getStringSafe(unReader,2),
                            getStringSafe(unReader,3),
                            getStringSafe(unReader,4),
                            getStringSafe(unReader,5),
                            getStringSafe(unReader,6),
                            getIntSafe(unReader,7),
                            getIntSafe(unReader,8)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return uneDemande_rh;

        }


        public void constructeurrequete(string donnees)
        {
            string[] subs = donnees.Split('|');
            Dictionary<string, string> data = new Dictionary<string, string>();
            string operation = subs[0];
            if(operation=="insert")
            {
                string[] lesattribs = subs[1].Split(',');
                foreach(string pairattrib in lesattribs)
                {
                    data.Add(pairattrib.Split('=')[0], pairattrib.Split('=')[1]);
                }
                InsertUniversel(data, "employe", true);
            }
            if (operation == "update")
            {
                Dictionary<string, string> where = new Dictionary<string, string>();
                string[] lesattribs = subs[1].Split(',');
                foreach (string pairattrib in lesattribs)
                {
                    data.Add(pairattrib.Split('=')[0], pairattrib.Split('=')[1]);
                }
                where.Add("id_employe", subs[2]);
                
                UpdateUniversel( data,"employe", where, true);
            }
            if (operation == "delete")
            {
                Dictionary<string, string> where = new Dictionary<string, string>();
                where.Add("id_employe", subs[1]);
                DeleteUniversel("employe", where, true);
            }
        }

        public string constructeurObjet(string donnees)
       {
            string[] subs = donnees.Split('|');
            string operation = subs[0];
            string objet = "";
            if(operation=="insert")
            {
                string[] lesattribs = subs[1].Split(',');
                objet+="Creation de l\'employe "+lesattribs[3].Split('=')[1]+" "+lesattribs[2].Split('=')[1]+" avec les droits "+lesattribs[14].Split('=')[1]+".";
            }
            if(operation=="delete")
            {
                Employe leEmploye = SelectWhereEmploye(int.Parse(subs[1]));
                objet+="Suppression de l\'employe "+leEmploye.Prenom+" "+leEmploye.Nom+".";
            }
            if (operation == "update")
            {
                Employe leEmploye = SelectWhereEmploye(int.Parse(subs[2]));
                objet+="Modification de l\'employe "+leEmploye.Prenom + " "+leEmploye.Nom+". ";
                objet+="Nouvelles informations: "+subs[1];
            }
            return objet;
        }


        /*      >>>>>>>> EMPLOYE <<<<<<<<      */

        public Employe SelectWhereEmploye(string email, string mdp)
        {
            string requete = "select * from employe where email = @email and mdp = @mdp;";
            Employe unEmploye = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@email", email);
                uneCmde.Parameters.AddWithValue("@mdp", Sha256(mdp));
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            unEmploye = new Employe(
                                getIntSafe(unReader, 0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getStringSafe(unReader, 7),
                                getStringSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11),
                                getStringSafe(unReader, 12),
                                getDateTimeSafe(unReader, 13),
                                getDateTimeSafe(unReader, 14),
                                getStringSafe(unReader, 15),
                                getIntSafe(unReader, 16),
                                getIntSafe(unReader, 17),
                                getIntSafe(unReader, 18)
                                ); 
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return unEmploye;
        }

        public Employe SelectWhereEmploye(int id_employe)
        {
            string requete = "select * from employe where id_employe = @id_employe;";
            Employe unEmploye = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            unEmploye = new Employe(
                                getIntSafe(unReader, 0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getStringSafe(unReader, 7),
                                getStringSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11),
                                getStringSafe(unReader, 12),
                                getDateTimeSafe(unReader, 13),
                                getDateTimeSafe(unReader, 14),
                                getStringSafe(unReader, 15),
                                getIntSafe(unReader, 16),
                                getIntSafe(unReader, 17),
                                getIntSafe(unReader, 18)
                                ); 
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return unEmploye;
        }

        public List<Employe> SelectAllEmploye()
        {
            string requete = "select * from employe;";
            List<Employe> lesEmployes = new List<Employe>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Employe unEmploye = new Employe(
                                getIntSafe(unReader,0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getStringSafe(unReader, 7),
                                getStringSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11),
                                getStringSafe(unReader, 12),
                                getDateTimeSafe(unReader, 13),
                                getDateTimeSafe(unReader, 14),
                                getStringSafe(unReader, 15),
                                getIntSafe(unReader, 16),
                                getIntSafe(unReader, 17),
                                getIntSafe(unReader, 18)
                                );
                            //ajouter dans la liste
                            lesEmployes.Add(unEmploye);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete : " + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesEmployes;
        }

        public List<Employe> SelectWhereEmployeEtSesTroufions(string id_employe)
        {
            string requete = "call recursemanager(@id_employe);";
            List<Employe> lesEmployes = new List<Employe>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Employe unEmploye = new Employe(
                                getIntSafe(unReader,0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getStringSafe(unReader, 7),
                                getStringSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11),
                                getStringSafe(unReader, 12),
                                getDateTimeSafe(unReader, 13),
                                getDateTimeSafe(unReader, 14),
                                getStringSafe(unReader, 15),
                                getIntSafe(unReader, 16),
                                getIntSafe(unReader, 17),
                                getIntSafe(unReader, 18)
                                );
                            //ajouter dans la liste
                            lesEmployes.Add(unEmploye);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete : " + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesEmployes;
        }

        /*      >>>>>>>> DEMANDE_AUTRE <<<<<<<<      */

        public List<VDemande_autre> SelectAllVDemande_autre()
        {
            string requete = "select * from VDemande_autre;";
            List<VDemande_autre> lesVDemande_autres = new List<VDemande_autre>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {

                            //instanciation d'un client
                            VDemande_autre uneVDemande_autre = new VDemande_autre(
                                getIntSafe(unReader,0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getDateTimeSafe(unReader, 3),
                                getDateTimeSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getIntSafe(unReader, 6),
                                getIntSafe(unReader, 7),
                                getStringSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11)
                                );
                            //ajouter dans la liste
                            lesVDemande_autres.Add(uneVDemande_autre);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesVDemande_autres;
        }

        public List<VDemande_autre> SelectAllVDemande_autre(string id_employe)
        {
            string requete = "call recursedemande_autre(@id_employe);";
            List<VDemande_autre> lesVDemande_autres = new List<VDemande_autre>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);
                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {

                            //instanciation d'un client
                            VDemande_autre uneVDemande_autre = new VDemande_autre(
                                getIntSafe(unReader,0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getDateTimeSafe(unReader, 3),
                                getDateTimeSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getIntSafe(unReader, 6),
                                getIntSafe(unReader, 7),
                                getStringSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11)
                                );
                            //ajouter dans la liste
                            lesVDemande_autres.Add(uneVDemande_autre);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesVDemande_autres;
        }

        public Demande_autre SelectWhereDemande_autre(int id_demande_autre)
        {
            string requete = "select * from VDemande_autre where id_demande_autre = @id_demande_autre;";
            Demande_autre uneDemande_autre = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_demande_autre", id_demande_autre);

                //creation d'un cruseur de r�sultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                            uneDemande_autre = new Demande_autre(
                            getIntSafe(unReader,0),
                            getStringSafe(unReader, 1),
                            getStringSafe(unReader, 2),
                            getDateTimeSafe(unReader, 3),
                            getDateTimeSafe(unReader, 4),
                            getStringSafe(unReader, 5),
                            getIntSafe(unReader, 6),
                            getIntSafe(unReader, 7)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return uneDemande_autre;

        }

        /*      >>>>>>>> MANAGER <<<<<<<<      */

        public List<Manager> SelectAllManager()
        {
            string requete = "select * from manager;";
            List<Manager> lesManagers = new List<Manager>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Manager unManager = new Manager(
                                getIntSafe(unReader,0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getStringSafe(unReader, 7),
                                getStringSafe(unReader, 8),
                                getStringSafe(unReader, 9),
                                getStringSafe(unReader, 10),
                                getStringSafe(unReader, 11),
                                getStringSafe(unReader, 12),
                                getDateTimeSafe(unReader, 13),
                                getDateTimeSafe(unReader, 14),
                                getStringSafe(unReader, 15),
                                getIntSafe(unReader, 16),
                                getIntSafe(unReader, 17),
                                getIntSafe(unReader, 18)
                                );
                            //ajouter dans la liste
                            lesManagers.Add(unManager);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesManagers;
        }

        /*      >>>>>>>> PLANNING <<<<<<<<      */

        public List<Planning> SelectAllPlanning()
        {
            string requete = "select * from planning;";
            List<Planning> lesPlannings = new List<Planning>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Planning unPlanning = new Planning(
                                getIntSafe(unReader,0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2)
                                );
                            //ajouter dans la liste
                            lesPlannings.Add(unPlanning);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesPlannings;
        }

        /*      >>>>>>>> METIER <<<<<<<<      */

        public void UpdateMetier(Metier unMetier)
        {
            string requete = "update metier set libelle = @libelle, niveau_salaire = @niveau_salaire, id_cat_met = @id_cat_met where id_met = @id_met;";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_met", unMetier.Id_met);

                uneCmde.Parameters.AddWithValue("@libelle", unMetier.Libelle);
                uneCmde.Parameters.AddWithValue("@niveau_salaire", unMetier.Niveau_salaire);
                uneCmde.Parameters.AddWithValue("@id_cat_met", unMetier.Id_cat_met);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
        }

        public Metier SelectWhereMetier(int id_met)
        {
            string requete = "select * from vMetier where id_met = @id_met;";
            Metier unMetier = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_met", id_met);

                //creation d'un cruseur de r�sultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                            unMetier = new Metier(
                            unReader.GetInt16(0),
                            unReader.GetString(1),
                            unReader.GetFloat(2),
                            unReader.GetInt16(3)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return unMetier;

        }

        /*      >>>>>>>> LOCAL <<<<<<<<      */

        public void InsertLocal(Local unLocal)
        {
            string requete = "insert into locaux values (null, @nom, @numrue, @rue, @ville, @cp);";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables Mysql et C#
                uneCmde.Parameters.AddWithValue("@nom", unLocal.Nom);
                uneCmde.Parameters.AddWithValue("@numrue", unLocal.Numrue);
                uneCmde.Parameters.AddWithValue("@rue", unLocal.Rue);
                uneCmde.Parameters.AddWithValue("@ville", unLocal.Ville);
                uneCmde.Parameters.AddWithValue("@cp", unLocal.Cp);
                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
        }

        public void DeleteLocal(int id_local)
        {
            string requete = "delete from locaux where id_local = @id_local;";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                uneCmde.Parameters.AddWithValue("@id_local", id_local);
                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }

        }


        public void UpdateLocal(Local unLocal)
        {
            string requete = "update locaux set nom = @nom, numrue = @numrue, rue = @rue, ville = @ville, cp = @cp where id_local = @id_local;";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_local", unLocal.Id_local);

                uneCmde.Parameters.AddWithValue("@nom", unLocal.Nom);
                uneCmde.Parameters.AddWithValue("@numrue", unLocal.Numrue);
                uneCmde.Parameters.AddWithValue("@rue", unLocal.Rue);
                uneCmde.Parameters.AddWithValue("@ville", unLocal.Ville);
                uneCmde.Parameters.AddWithValue("@cp", unLocal.Cp);

                uneCmde.ExecuteNonQuery();
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
        }

        public List<Local> SelectAllLocal()
        {
            string requete = "select * from locaux;";
            List<Local> lesLocals = new List<Local>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {

                            //instanciation d'un client
                            Local unLocal = new Local(
                                getIntSafe(unReader, 0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5)
                                );
                            //ajouter dans la liste
                            lesLocals.Add(unLocal);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesLocals;
        }

        public Local SelectWhereLocal(int id_local)
        {
            string requete = "select * from locaux where id_local = @id_local;";
            Local unLocal = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_local", id_local);

                //creation d'un cruseur de r�sultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                            unLocal = new Local(
                                getIntSafe(unReader, 0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return unLocal;

        }

        /*      >>>>>>>> CATEGORIE ARTICLE <<<<<<<<      */

        public List<Categorie_article> SelectAllCategorie_article()
        {
            string requete = "select * from categorie_article;";
            List<Categorie_article> lesCategories_articles = new List<Categorie_article>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Categorie_article uneCategorie_article = new Categorie_article(
                                unReader.GetInt16(0),
                                unReader.GetString(1),
                                unReader.GetString(2)
                                );
                            //ajouter dans la liste
                            lesCategories_articles.Add(uneCategorie_article);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesCategories_articles;
        }

        public Categorie_article SelectWhereCategorie_article(int id_cat_art)
        {
            string requete = "select * from categorie_article where id_cat_art = @id_cat_art;";
            Categorie_article uneCategorie_article = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_cat_art", id_cat_art);

                //creation d'un cruseur de r�sultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                            uneCategorie_article = new Categorie_article(
                            getIntSafe(unReader, 0),
                            getStringSafe(unReader, 1),
                            getStringSafe(unReader, 2)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return uneCategorie_article;

        }

        /*      >>>>>>>> ARTICLE <<<<<<<<      */

        public List<VArticle> SelectAllVArticle()
        {
            string requete = "select * from VArticle;";
            List<VArticle> lesVArticles = new List<VArticle>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            VArticle uneVArticle = new VArticle(
                                getIntSafe(unReader, 0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getIntSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getIntSafe(unReader, 6),
                                getStringSafe(unReader, 7)
                                );
                            //ajouter dans la liste
                            lesVArticles.Add(uneVArticle);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesVArticles;
        }


        public VArticle SelectWhereVArticle(int id_article)
        {
            string requete = "select * from vArticle where id_article = @id_article;";
            VArticle uneVArticle = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_article", id_article);

                //creation d'un cruseur de r sultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation 

                            uneVArticle = new VArticle(
                                getIntSafe(unReader, 0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getIntSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getIntSafe(unReader, 6),
                                getStringSafe(unReader, 7)
                            );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return uneVArticle;

        }

        /*      >>>>>>>> BADGEAGE <<<<<<<<      */

        public List<VBadgeage> SelectAllVBadgeage()
        {
            string requete = "select * from VBadgeage;";
            List<VBadgeage> lesVBadgeages = new List<VBadgeage>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            VBadgeage unVBageage = new VBadgeage(
                                getIntSafe(unReader, 0),
                                getDateTimeSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getIntSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5)
                                );
                            //ajouter dans la liste
                            lesVBadgeages.Add(unVBageage);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesVBadgeages;
        }

        public List<VBadgeage> SelectAllVBadgeage(int id)
        {
            string requete = "select * from VBadgeage where id_employe = @id_employe;";
            List<VBadgeage> lesVBadgeages = new List<VBadgeage>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_employe", id);

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {

                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            VBadgeage unVBageage = new VBadgeage(
                                getIntSafe(unReader, 0),
                                getDateTimeSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getIntSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5)
                                );
                            //ajouter dans la liste
                            lesVBadgeages.Add(unVBageage);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesVBadgeages;
        }

        public VBadgeage SelectWhereVBadgeage(int id_badgeage)
        {
            string requete = "select * from categorie_article where id_badgeage = @id_badgeage;";
            VBadgeage unVBadgeage = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_badgeage", id_badgeage);

                //creation d'un cruseur de r�sultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                            unVBadgeage = new VBadgeage(
                                getIntSafe(unReader, 0),
                                getDateTimeSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getIntSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5)
                                );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return unVBadgeage;

        }

        /*      >>>>>>>> UTILISATEUR <<<<<<<<      */

        public List<Utilisateur> SelectAllUtilisateur()
        {
            string requete = "select * from utilisateur;";
            List<Utilisateur> lesUtilisateurs = new List<Utilisateur>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Utilisateur unUtilisateur = new Utilisateur(
                                getIntSafe(unReader, 0),
                                getStringSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getStringSafe(unReader, 7),
                                getStringSafe(unReader, 8),
                                getStringSafe(unReader, 9)
                                );
                            //ajouter dans la liste
                            lesUtilisateurs.Add(unUtilisateur);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesUtilisateurs;
        }

        /*      >>>>>>>> GESTION <<<<<<<<      */

        public List<VGerer> SelectAllVGestion()
        {
            string requete = "select * from VGerer;";
            List<VGerer> lesGestions = new List<VGerer>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            VGerer unVGerer = new VGerer(
                                getIntSafe(unReader, 0),
                                getIntSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getStringSafe(unReader, 7),
                                getStringSafe(unReader, 8)
                                );
                            //ajouter dans la liste
                            lesGestions.Add(unVGerer);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesGestions;
        }

        public VGerer SelectWhereGerer(int id_employe, int id_utilisateur, string dateheure_action)
        {
            string requete = "select * from vgerer where id_employe = @id_employe and id_utilisateur = @id_utilisateur and dateheure_action = @dateheure_action  ;";
            VGerer unVGerer = null;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);
                uneCmde.Parameters.AddWithValue("@id_utilisateur", id_utilisateur);
                uneCmde.Parameters.AddWithValue("@dateheure_action", dateheure_action);

                //creation d'un cruseur de r�sultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                                unVGerer = new VGerer(
                                getIntSafe(unReader, 0),
                                getIntSafe(unReader, 1),
                                getStringSafe(unReader, 2),
                                getStringSafe(unReader, 3),
                                getStringSafe(unReader, 4),
                                getStringSafe(unReader, 5),
                                getStringSafe(unReader, 6),
                                getStringSafe(unReader, 7),
                                getStringSafe(unReader, 8)
                                );
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine(uneCmde.CommandText);
                    foreach (MySqlParameter unParam in uneCmde.Parameters)
                    {
                        Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                    }
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return unVGerer;

        }

        /*      >>>>>>>> DATAJSON <<<<<<<<      */

        public string SelectAllEmployeJson()
        {
            List<string> lesempjson = new List<string>();
            string json = "{";
            string unempjson="";
            List<Employe> lesEmployes = new List<Employe>();
            lesEmployes = SelectAllEmploye();
            foreach(Employe unEmploye in lesEmployes)
            {
                unempjson=" \\\""+unEmploye.Id_employe.ToString()+"\\\": {";
                unempjson+=" \\\"email\\\": \\\""+unEmploye.Email+"\\\",";
                unempjson+=" \\\"nom\\\": \\\""+unEmploye.Nom+"\\\",";
                unempjson+=" \\\"prenom\\\": \\\""+unEmploye.Prenom+"\\\",";
                unempjson+=" \\\"tel\\\": \\\""+unEmploye.Tel+"\\\",";
                unempjson+=" \\\"rue\\\": \\\""+unEmploye.Rue+"\\\",";
                unempjson+=" \\\"numrue\\\": \\\""+unEmploye.Numrue+"\\\",";
                unempjson+=" \\\"ville\\\": \\\""+unEmploye.Ville+"\\\",";
                unempjson+=" \\\"cp\\\": \\\""+unEmploye.Cp+"\\\",";
                unempjson+=" \\\"fonction\\\": \\\""+unEmploye.Fonction+"\\\",";
                unempjson+=" \\\"salaire\\\": \\\""+unEmploye.Salaire+"\\\",";
                unempjson+=" \\\"niveau_diplome\\\": \\\""+unEmploye.Niveau_diplome+"\\\",";
                unempjson+=" \\\"droits\\\": \\\""+unEmploye.Droits+"\\\",";
                unempjson+=" \\\"id_planning\\\": \\\""+unEmploye.Id_planning+"\\\",";
                unempjson+=" \\\"id_manager\\\": \\\""+unEmploye.Id_manager+"\\\",";
                unempjson+=" \\\"id_local\\\": \\\""+unEmploye.Id_local+"\\\"}";
                lesempjson.Add(unempjson);
            }
            json+= String.Join(",", lesempjson)+"}";
            return json;
        }

        public string DashboardDataAll()
        {
            string date_resolution = DemandeRhResoluParMoisJSon();
            int TotalTraite = CountTraiteDemandeRh();
            int TotalAccepte = CountAccepteDemandeRh();
            int TotalRefuse = TotalTraite-TotalAccepte;
            int TotalNonTraite = CountNonTraiteDemandeRh();
            int Total = TotalTraite + TotalNonTraite;
            string lesDatas = "{ \\\"demande_RH\\\": { \\\"total\\\": "+Total.ToString()+", \\\"accepte\\\": "+TotalAccepte.ToString()+", \\\"refuse\\\": "+TotalRefuse.ToString()+", \\\"traite\\\": "+TotalTraite.ToString()+", \\\"non_traite\\\": "+TotalNonTraite.ToString()+","+date_resolution+"}";
            TotalTraite = CountTraiteDemandeAutre();
            TotalAccepte = CountAccepteDemandeAutre();
            TotalRefuse = TotalTraite-TotalAccepte;
            TotalNonTraite = CountNonTraiteDemandeAutre();
            Total = TotalTraite + TotalNonTraite;
            date_resolution = DemandeAutreResoluParMoisJSon();
            lesDatas += ", \\\"demande_Autre\\\": { \\\"total\\\": "+Total.ToString()+", \\\"accepte\\\": "+TotalAccepte.ToString()+", \\\"refuse\\\": "+TotalRefuse.ToString()+", \\\"traite\\\": "+TotalTraite.ToString()+", \\\"non_traite\\\": "+TotalNonTraite.ToString()+","+date_resolution+"}";
            Dictionary<string,int> lesCounts = CountArticleParCat();
            lesDatas +=", \\\"article\\\": { ";
            List<string> lesArticles = new List<string>();
            foreach(KeyValuePair<string, int> entry in lesCounts)
            {
                lesArticles.Add("\\\""+entry.Key+"\\\": "+entry.Value);
            }
            lesDatas+= String.Join(",",lesArticles)+"}";
            lesDatas+="}";
            Debug.WriteLine(lesDatas);
            return lesDatas;
        }

        public string DashboardDataPerso(int id_employe)
        {
            int TotalTraite = CountTraiteDemandeRh(id_employe);
            int TotalAccepte = CountAccepteDemandeRh(id_employe);
            int TotalRefuse = TotalTraite-TotalAccepte;
            int TotalNonTraite = CountNonTraiteDemandeRh(id_employe);
            int Total = TotalTraite + TotalNonTraite;
            string lesDatas = "{ \\\"demande_RH\\\": { \\\"total\\\": "+Total.ToString()+", \\\"accepte\\\": "+TotalAccepte.ToString()+", \\\"refuse\\\": "+TotalRefuse.ToString()+", \\\"traite\\\": "+TotalTraite.ToString()+", \\\"non_traite\\\": "+TotalNonTraite.ToString()+"}";
            TotalTraite = CountTraiteDemandeAutre(id_employe);
            TotalAccepte = CountAccepteDemandeAutre(id_employe);
            TotalRefuse = TotalTraite-TotalAccepte;
            TotalNonTraite = CountNonTraiteDemandeAutre(id_employe);
            Total = TotalTraite + TotalNonTraite;
            lesDatas += ", \\\"demande_Autre\\\": { \\\"total\\\": "+Total.ToString()+", \\\"accepte\\\": "+TotalAccepte.ToString()+", \\\"refuse\\\": "+TotalRefuse.ToString()+", \\\"traite\\\": "+TotalTraite.ToString()+", \\\"non_traite\\\": "+TotalNonTraite.ToString()+"}";
            lesDatas+="}";
            Debug.WriteLine(lesDatas);
            return lesDatas;
        }

        /*      >>>>>>>> DATAJSON_DEMANDE_RH <<<<<<<<      */
        public int CountTraiteDemandeRh()
        {
            string requete = "select count(id_demande_rh) from Archi_Demande_rh;";
            int Total =0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public int CountAccepteDemandeRh()
        {
            string requete = "select count(id_demande_rh) from Archi_Demande_rh where etat='accepte';";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public int CountNonTraiteDemandeRh()
        {
            string requete = "select count(id_demande_rh) from Demande_rh;";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        /*Perso*/
        public int CountTraiteDemandeRh(int id_employe)
        {
            string requete = "select count(id_demande_rh) from Archi_Demande_rh where id_employe = @id_employe ;";
            int Total =0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public int CountAccepteDemandeRh(int id_employe)
        {
            string requete = "select count(id_demande_rh) from Archi_Demande_rh where etat='accepte' and id_employe = @id_employe ;";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public int CountNonTraiteDemandeRh(int id_employe)
        {
            string requete = "select count(id_demande_rh) from Demande_rh where id_employe = @id_employe ;";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        /*      >>>>>>>> DATAJSON_DEMANDE_AUTRE <<<<<<<<      */

        public int CountTraiteDemandeAutre()
        {
            string requete = "select count(id_demande_autre) from demande_autre where etat='accepte' or etat='refuse';";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public int CountAccepteDemandeAutre()
        {
            string requete = "select count(id_demande_autre) from demande_autre where etat='accepte';";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public int CountNonTraiteDemandeAutre()
        {
            string requete = "select count(id_demande_autre) from Demande_autre where etat='attente';";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        /*Perso*/

        public int CountTraiteDemandeAutre(int id_employe)
        {
            string requete = "select count(id_demande_autre) from demande_autre where (etat='accepte' or etat='refuse') and id_employe = @id_employe;";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);
                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public int CountAccepteDemandeAutre(int id_employe)
        {
            string requete = "select count(id_demande_autre) from demande_autre where etat='accepte' and id_employe = @id_employe;";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);
                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public int CountNonTraiteDemandeAutre(int id_employe)
        {
            string requete = "select count(id_demande_autre) from Demande_autre where etat='attente' and id_employe = @id_employe;";
            int Total = 0;
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                uneCmde.Parameters.AddWithValue("@id_employe", id_employe);

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            Total = getIntSafe(unReader,0);
                            //ajouter dans la liste
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return Total;
        }

        public string DemandeAutreResoluParMoisJSon()
        {
            string requete = "select * from demande_autre_resolu_par_mois;";
            string monjson ="\\\"resolution_mois\\\": {";
            List<string> leslignes = new List<string>();
            string machaine = "";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            machaine = "\\\""+getStringSafe(unReader,0)+"\\\": {";
                            machaine +="\\\"janvier\\\": "+getStringSafe(unReader,1)+", ";
                            machaine +="\\\"fevrier\\\": "+getStringSafe(unReader,2)+", ";
                            machaine +="\\\"mars\\\": "+getStringSafe(unReader,3)+", ";
                            machaine +="\\\"avril\\\": "+getStringSafe(unReader,4)+", ";
                            machaine +="\\\"mai\\\": "+getStringSafe(unReader,5)+", ";
                            machaine +="\\\"juin\\\": "+getStringSafe(unReader,6)+", ";
                            machaine +="\\\"juillet\\\": "+getStringSafe(unReader,7)+", ";
                            machaine +="\\\"aout\\\": "+getStringSafe(unReader,8)+", ";
                            machaine +="\\\"septembre\\\": "+getStringSafe(unReader,9)+", ";
                            machaine +="\\\"octobre\\\": "+getStringSafe(unReader,10)+", ";
                            machaine +="\\\"novembre\\\": "+getStringSafe(unReader,11)+", ";
                            machaine +="\\\"decembre\\\": "+getStringSafe(unReader,12)+", ";
                            machaine +="\\\"total\\\": "+getStringSafe(unReader,13)+"}";
                            leslignes.Add(machaine);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            monjson+= String.Join(",",leslignes)+"}";
            return monjson;
        }

        public string DemandeRhResoluParMoisJSon()
        {
            string requete = "select * from demande_rh_resolu_par_mois;";
            string monjson ="\\\"resolution_mois\\\": {";
            List<string> leslignes = new List<string>();
            string machaine = "";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            machaine = "\\\""+getStringSafe(unReader,0)+"\\\": {";
                            machaine +="\\\"janvier\\\": "+getStringSafe(unReader,1)+", ";
                            machaine +="\\\"fevrier\\\": "+getStringSafe(unReader,2)+", ";
                            machaine +="\\\"mars\\\": "+getStringSafe(unReader,3)+", ";
                            machaine +="\\\"avril\\\": "+getStringSafe(unReader,4)+", ";
                            machaine +="\\\"mai\\\": "+getStringSafe(unReader,5)+", ";
                            machaine +="\\\"juin\\\": "+getStringSafe(unReader,6)+", ";
                            machaine +="\\\"juillet\\\": "+getStringSafe(unReader,7)+", ";
                            machaine +="\\\"aout\\\": "+getStringSafe(unReader,8)+", ";
                            machaine +="\\\"septembre\\\": "+getStringSafe(unReader,9)+", ";
                            machaine +="\\\"octobre\\\": "+getStringSafe(unReader,10)+", ";
                            machaine +="\\\"novembre\\\": "+getStringSafe(unReader,11)+", ";
                            machaine +="\\\"decembre\\\": "+getStringSafe(unReader,12)+", ";
                            machaine +="\\\"total\\\": "+getStringSafe(unReader,13)+"}";
                            leslignes.Add(machaine);
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            monjson+= String.Join(",",leslignes)+"}";
            return monjson;
        }

        /*      >>>>>>>> DATAJSON_ARTICLE <<<<<<<<      */

        public Dictionary<string,int> CountArticleParCat()
        {
            string requete = "select * from viewarticlecountparcat;";
            Dictionary<string,int> lesCounts = new Dictionary<string,int>();
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                //creation d'un curseur de r�sultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            lesCounts.Add(getStringSafe(unReader,0),getIntSafe(unReader,1));
                        }
                    }
                }
                catch (Exception exp)
                {
                    Debug.WriteLine("Erreur de requete :" + requete);
                    Debug.WriteLine(exp.Message);
                }
                this.maConnexion.Close();
            }
            catch (Exception exp)
            {
                Debug.WriteLine("Erreur de requete :" + requete);
                Debug.WriteLine(exp.Message);
            }
            return lesCounts;
        }

    }
}