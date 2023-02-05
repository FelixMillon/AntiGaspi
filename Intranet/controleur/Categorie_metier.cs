using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Categorie_metier
    {
        private int id_cat_met;
        private string libelle, description;

        public Categorie_metier()
        {
            this.id_cat_met = 0;
            this.libelle = this.description = "";
        }

        public Categorie_metier(string libelle, string description)
        {
            this.libelle = libelle;
            this.description = description;
        }

        public Categorie_metier(int id_cat_met, string libelle, string description)
        {
            this.id_cat_met = id_cat_met;
            this.libelle = libelle;
            this.description = description;
        }

        public int Id_cat_met
        {
            get => id_cat_met; set => id_cat_met = value;
        }

        public string Libelle
        {
            get => libelle; set => libelle = value;
        }

        public string Description
        {
            get => description; set => description = value;
        }

    }
}