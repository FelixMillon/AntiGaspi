using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Badgeage
    {
        private int id_badgeage;
        private string date_heure, type;
        private int id_employe;

        public Badgeage()
        {
            this.id_badgeage = 0;
            this.date_heure = this.type = "";
            this.id_employe = 0;
        }

        public Badgeage(int id_badgeage, string date_heure, string type, int id_employe)
        {
            this.id_badgeage = id_badgeage;
            this.date_heure = date_heure;
            this.type = type;
            this.id_employe = id_employe;
        }

        public Badgeage(string date_heure, string type, int id_employe)
        {
            this.date_heure = date_heure;
            this.type = type;
            this.id_employe = id_employe;
        }


        public int Id_badgeage
        {
            get => id_badgeage; set => id_badgeage = value;
        }

        public string Date_heure
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




    }
}