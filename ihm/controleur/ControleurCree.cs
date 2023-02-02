using System.Collections.Generic;


namespace DepannageAA
{
    public class ControleurCree
    {
        private static Depannage.Modele unModele = new Depannage.Modele("localhost", "depannage_sd_23", "root", "");

        public static void InsertClient(Depannage.Client unClient)
        {
            unModele.InsertClient(unClient);
        }

        public static void InsertTechnicien(Depannage.Technicien unTechnicien)
        {
            unModele.InsertTechnicien(unTechnicien);
        }

        public static void InsertIntervention(Depannage.Intervention uneIntervention)
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

        public static void UpdateClient(Depannage.Client unClient)
        {
            unModele.UpdateClient(unClient);
        }

        public static void UpdateTechnicien(Depannage.Technicien unTechnicien)
        {
            unModele.UpdateTechnicien(unTechnicien);
        }

        public static void UpdateIntervention(Depannage.Intervention uneIntervention)
        {
            unModele.UpdateIntervention(uneIntervention);
        }

        public static Depannage.Client SelectWhereClient(int idClient)
        {
            return unModele.SelectWhereClient(idClient);
        }

        public static Depannage.Technicien SelectWhereTechnicien(string email, string mdp)
        {
            return unModele.SelectWhereTechnicien(email, mdp);
        }

        public static Depannage.Technicien SelectWhereTechnicien(int idTechnicien)
        {
            return unModele.SelectWhereTechnicien(idTechnicien);
        }

        public static Depannage.Intervention SelectWhereIntervention(int idInter)
        {
            return unModele.SelectWhereIntervention(idInter);
        }

        public static List<Depannage.Client> SelectAllClient()
        {
            return unModele.SelectAllClient();
        }

        public static List<Depannage.Technicien> SelectAllTechnicien()
        {
            return unModele.SelectAllTechnicien();
        }

        public static List<Depannage.Intervention> SelectAllIntervention()
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