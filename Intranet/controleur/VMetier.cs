using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class vMetier
    {
        private int id_met;
        private string libelle;
        private float niveau_salaire;
        private int id_cat_met;
        private string nomcatmet;

        public vMetier()
        {
            this.id_met = 0;
            this.libelle =  "";
            this.niveau_salaire = 0;
            this.id_cat_met = 0;
            this.nomcatmet = "";
        }

        public vMetier(string libelle, float niveau_salaire, int id_cat_met, string nomcatmet)
        {
            this.libelle = libelle;
            this.niveau_salaire = niveau_salaire;
            this.id_cat_met = id_cat_met;
            this.nomcatmet = nomcatmet;
        }

        public vMetier(int id_met, string libelle, float niveau_salaire, int id_cat_met, string nomcatmet)
        {
            
            this.id_met = id_met;
            this.libelle = libelle;
            this.niveau_salaire = niveau_salaire;
            this.id_cat_met = id_cat_met;
            this.nomcatmet = nomcatmet;
        }

        public int Id_met
        {
            get => id_met; set => id_met = value;
        }

        public string Libelle
        {
            get => libelle; set => libelle = value;
        }

        public float Niveau_salaire
        {
            get => niveau_salaire; set => niveau_salaire = value;
        }

        public int Id_cat_met
        {
            get => id_cat_met; set => id_cat_met = value;
        }

        public string Nomcatmet
        {
            get => nomcatmet; set => nomcatmet = value;
        }


    }
}