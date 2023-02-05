using System;
using System.Collections.Generic;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Text;
using MySql.Data.MySqlClient;
using System.Diagnostics;
using System.Runtime.Remoting.Messaging;


namespace Intranet
{
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

        public static string getStringSafe(DbDataReader reader, int numero)
        {
            string valeur = null;
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

        public void InsertDemande_autre(Demande_autre uneDemande_autre)
        {
            string requete = "insert into demande_autre values (null, @libelle, @description, @date_demande, @date_resolution, @etat, @id_employe, @id_manager);";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables Mysql et C#
                uneCmde.Parameters.AddWithValue("@libelle", uneDemande_autre.Libelle);
                uneCmde.Parameters.AddWithValue("@description", uneDemande_autre.Description);
                uneCmde.Parameters.AddWithValue("@date_demande", uneDemande_autre.Date_demande);
                uneCmde.Parameters.AddWithValue("@date_resolution", uneDemande_autre.Date_resolution);
                uneCmde.Parameters.AddWithValue("@etat", uneDemande_autre.Etat);
                uneCmde.Parameters.AddWithValue("@id_employe", uneDemande_autre.Id_employe);
                uneCmde.Parameters.AddWithValue("@id_manager", uneDemande_autre.Id_manager);
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


        public void InsertDemande_rh(Demande_rh uneDemande_rh)
        {
            string requete = "insert into demande_rh values (null, @libelle, @objet, @requete_sql, @date_demande, @date_resolution, @etat, @id_employe, @id_manager);";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables Mysql et C#
                uneCmde.Parameters.AddWithValue("@libelle", uneDemande_rh.Libelle);
                uneCmde.Parameters.AddWithValue("@objet", uneDemande_rh.Objet);
                uneCmde.Parameters.AddWithValue("@requete_sql", uneDemande_rh.Requete_sql);
                uneCmde.Parameters.AddWithValue("@date_demande", uneDemande_rh.Date_demande);
                uneCmde.Parameters.AddWithValue("@date_resolution", uneDemande_rh.Date_resolution);
                uneCmde.Parameters.AddWithValue("@etat", uneDemande_rh.Etat);
                uneCmde.Parameters.AddWithValue("@id_employe", uneDemande_rh.Id_employe);
                uneCmde.Parameters.AddWithValue("@id_manager", uneDemande_rh.Id_manager);
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

        public void DeleteDemande_rh(int id_demande_rh)
        {
            string requete = "delete from demande_rh where id_demande_rh = @id_demande_rh;";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                uneCmde.Parameters.AddWithValue("@id_demande_rh", id_demande_rh);
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



        public void DeleteDemande_autre(int id_demande_autre)
        {
            string requete = "delete from demande_autre where id_demande_autre = @id_demande_autre;";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;

                uneCmde.Parameters.AddWithValue("@id_demande_autre", id_demande_autre);
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

        public void UpdateDemande_rh(Demande_rh uneDemande_rh)
        {
            string requete = "update demande_rh set libelle = @libelle, objet = @objet, requete_sql = @requete_sql,";
            requete += "date_demande = @date_demande, date_resolution = @date_resolution, etat = @etat, id_employe = @id_employe, id_manager = @id_manager";
            requete += "where id_demande_rh = @id_demande_rh;";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_demande_rh", uneDemande_rh.Id_demande_rh);

                uneCmde.Parameters.AddWithValue("@libelle", uneDemande_rh.Libelle);
                uneCmde.Parameters.AddWithValue("@objet", uneDemande_rh.Objet);
                uneCmde.Parameters.AddWithValue("@requete_sql", uneDemande_rh.Requete_sql);
                uneCmde.Parameters.AddWithValue("@date_demande", uneDemande_rh.Date_demande);
                uneCmde.Parameters.AddWithValue("@date_resolution", uneDemande_rh.Date_resolution);
                uneCmde.Parameters.AddWithValue("@etat", uneDemande_rh.Etat);
                uneCmde.Parameters.AddWithValue("@id_employe", uneDemande_rh.Id_employe);
                uneCmde.Parameters.AddWithValue("@id_manager", uneDemande_rh.Id_manager);
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

        public void UpdateDemande_autre(Demande_autre uneDemande_autre)
        {
            string requete = "update demande_autre set libelle = @libelle, description = @description,";
            requete += "date_demande = @date_demande, date_resolution = @date_resolution, etat = @etat, id_employe = @id_employe, id_manager = @id_manager";
            requete += "where id_demande_autre = @id_demande_autre;";
            MySqlCommand uneCmde = null;
            try
            {
                this.maConnexion.Open();
                uneCmde = this.maConnexion.CreateCommand();
                uneCmde.CommandText = requete;
                //les correspondances entre variables MYSQL ET C#
                uneCmde.Parameters.AddWithValue("@id_demande_autre", uneDemande_autre.Id_demande_autre);

                uneCmde.Parameters.AddWithValue("@libelle", uneDemande_autre.Libelle);
                uneCmde.Parameters.AddWithValue("@description", uneDemande_autre.Description);
                uneCmde.Parameters.AddWithValue("@date_demande", uneDemande_autre.Date_demande);
                uneCmde.Parameters.AddWithValue("@date_resolution", uneDemande_autre.Date_resolution);
                uneCmde.Parameters.AddWithValue("@etat", uneDemande_autre.Etat);
                uneCmde.Parameters.AddWithValue("@id_employe", uneDemande_autre.Id_employe);
                uneCmde.Parameters.AddWithValue("@id_manager", uneDemande_autre.Id_manager);
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

                //creation d'un curseur de résultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {

                            //instanciation d'un client
                            VDemande_autre uneVDemande_autre = new VDemande_autre(
                                getIntSafe(unReader, 0),
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

                //creation d'un curseur de résultats 
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        while (unReader.Read())
                        {
                            //instanciation d'un client
                            VDemande_rh uneVDemande_rh = new VDemande_rh(
                                unReader.GetInt16(0),
                                unReader.GetString(1),
                                unReader.GetString(2), 
                                unReader.GetString(3),
                                unReader.GetString(4),
                                unReader.GetString(5),
                                unReader.GetString(6),
                                unReader.GetInt16(7),
                                unReader.GetInt16(8),
                                unReader.GetString(9),
                                unReader.GetString(10),
                                unReader.GetString(11),
                                unReader.GetString(12)
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

                //creation d'un cruseur de résultats
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

                //creation d'un cruseur de résultats
                DbDataReader unReader = uneCmde.ExecuteReader();
                try
                {
                    if (unReader.HasRows)
                    {
                        if (unReader.Read())
                        {
                            //instanciation d'un client

                            uneDemande_rh = new Demande_rh(
                            unReader.GetInt16(0),
                            unReader.GetString(1),
                            unReader.GetString(2),
                            unReader.GetString(3),
                            unReader.GetString(4),
                            unReader.GetString(5),
                            unReader.GetString(6),
                            unReader.GetInt16(7),
                            unReader.GetInt16(8)
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

                Debug.WriteLine(uneCmde.CommandText);
                foreach (MySqlParameter unParam in uneCmde.Parameters)
                {
                    Debug.WriteLine(unParam.ParameterName + ": " + unParam.Value);
                }


                //creation d'un curseur de résultats 
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

                //creation d'un curseur de résultats 
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



    }
}