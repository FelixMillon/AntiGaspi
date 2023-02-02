using System.Collections.Generic;

namespace Depannage
{
    public class Controleur
    {
        private static Modele unModele = new Modele("localhost", "depannage_sd_23", "root", "");

        public static void InsertClient(Client unClient)
        {
            unModele.InsertClient(unClient);
        }

        public static void InsertTechnicien(Technicien unTechnicien)
        {
            unModele.InsertTechnicien(unTechnicien);
        }

        public static void InsertIntervention(Intervention uneIntervention)
        {
            unModele.InsertIntervention(uneIntervention);
        }

        public static void DeleteClient(int idclient)
        {
            unModele.DeleteClient(idclient);

        }

        public static void DeleteTechnicien(int idtechnicien)
        {
            unModele.DeleteTechnicien(idtechnicien);
        }

        public static void DeleteIntervention(int idinter)
        {
            unModele.DeleteIntervention(idinter);
        }

        public static void UpdateClient(Client unClient)
        {
            unModele.UpdateClient(unClient);
        }

        public static void UpdateTechnicien(Technicien unTechnicien)
        {
            unModele.UpdateTechnicien(unTechnicien);
        }

        public static void UpdateIntervention(Intervention uneIntervention)
        {
            unModele.UpdateIntervention(uneIntervention);
        }

        public static Client SelectWhereClient(int idClient)
        {
            return unModele.SelectWhereClient(idClient);
        }

        public static Technicien SelectWhereTechnicien(string email, string mdp)
        {
            return unModele.SelectWhereTechnicien(email, mdp);
        }

        public static Technicien SelectWhereTechnicien(int idTechnicien)
        {
            return unModele.SelectWhereTechnicien(idTechnicien);
        }

        public static Intervention SelectWhereIntervention(int idInter)
        {
            return unModele.SelectWhereIntervention(idInter);
        }

        public static List<Client> SelectAllClient()
        {
            return unModele.SelectAllClient();
        }

        public static List<Technicien> SelectAllTechnicien()
        {
            return unModele.SelectAllTechnicien();
        }

        public static List<Intervention> SelectAllIntervention()
        {
            return unModele.SelectAllIntervention();
        }

        public static string coucou()
        {
            return "coucou";
        }

        public static string coucou(int n)
        {
            return "coucou" + n.ToString();
        }


    }
}