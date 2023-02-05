using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Metier
    {
        private int id_met;
        private string libelle;
        private float niveau_salaire;
        private int id_cat_met;

        public Metier()
        {
            this.id_met = 0;
            this.libelle = "";
            this.niveau_salaire = 0;
            this.id_cat_met = 0;
        }

        public Metier(string libelle, float niveau_salaire, int id_cat_met)
        {
            this.libelle = libelle;
            this.niveau_salaire = niveau_salaire;
            this.id_cat_met = id_cat_met;
        }

        public Metier(int id_met, string libelle, float niveau_salaire, int id_cat_met)
        {
            this.id_met = id_met;
            this.libelle = libelle;
            this.niveau_salaire = niveau_salaire;
            this.id_cat_met = id_cat_met;
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

    }
}