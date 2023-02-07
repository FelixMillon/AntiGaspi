using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Categorie_article
    {
        private int id_cat_art;
        private string libelle, description;

        public Categorie_article()
        {
            this.id_cat_art = 0;
            this.libelle = this.description = "";
        }

        public Categorie_article(string libelle, string description)
        {
            this.libelle = libelle;
            this.description = description;
        }

        public Categorie_article(int id_cat_art, string libelle, string description)
        {
            this.id_cat_art = id_cat_art;
            this.libelle = libelle;
            this.description = description;
        }

        public int Id_cat_art
        {
            get => id_cat_art; set => id_cat_art = value;
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