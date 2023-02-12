using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class VBadgeage
    {
        private int id_badgeage;
        private DateTime date_heure;
        private string type;
        private int id_employe;
        private string nom, prenom;

        public VBadgeage()
        {
            this.id_badgeage = 0;
            this.date_heure = new DateTime(0000, 00, 00, 00, 00, 00);
            this.type = "";
            this.id_employe = 0;
            this.nom = this.prenom = "";
        }

        public VBadgeage(int id_badgeage, DateTime date_heure, string type, int id_employe, string nom, string prenom)
        {
            this.id_badgeage = id_badgeage;
            this.date_heure = date_heure;
            this.type = type;
            this.id_employe = id_employe;
            this.nom = nom;
            this.prenom = prenom;
        }

        public VBadgeage(DateTime date_heure, string type, int id_employe, string nom, string prenom)
        {
            this.date_heure = date_heure;
            this.type = type;
            this.id_employe = id_employe;
            this.nom = nom;
            this.prenom = prenom;
        }


        public int Id_badgeage
        {
            get => id_badgeage; set => id_badgeage = value;
        }

        public DateTime Date_heure
        {
            get => date_heure; set => date_heure = value;
        }

        public string Type
        {
            get => type; set => type = value;
        }

        public int Id_employe
        {
            get => id_employe; set => id_employe = value;
        }

        public string Nom
        {
            get => nom; set => nom = value;
        }

        public string Prenom
        {
            get => prenom; set => prenom = value;
        }

    }
}