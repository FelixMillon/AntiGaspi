using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class VArticle
    {
        private int id_article;
        private string titre, sous_titre;
        private int id_cat_art;
        private string categorie;
        private int id_employe
        private string auteur

        public VArticle()
        {
            this.id_article = 0;
            this.titre = this.sous_titre = "";
            this.id_cat_art = 0;
            this.categorie = "";
            this.id_employe =  0;
            this.auteur = "";
        }

        public VArticle(string titre, string sous_titre, int id_cat_art, string categorie, int id_employe, string auteur)
        {
            this.titre = titre;
            this.sous_titre = sous_titre;
            this.id_cat_art = id_cat_art;
            this.categorie = categorie;
            this.id_employe = id_employe;
            this.auteur = auteur;
        }

        public VArticle(int id_article, string titre, string sous_titre, int id_cat_art, string categorie, int id_employe, string auteur)
        {
            this.id_article = id_article;
            this.titre = titre;
            this.sous_titre = sous_titre;
            this.id_cat_art = id_cat_art;
            this.categorie = categorie;
            this.id_employe = id_employe;
            this.auteur = auteur;
        }

        public int Id_article
        {
            get => id_article; set => id_article = value;
        }

        public string Titre
        {
            get => titre; set => titre = value;
        }

        public string Sous_titre
        {
            get => sous_titre; set => sous_titre = value;
        }

        public int Id_cat_art
        {
            get => id_cat_art; set => id_cat_art = value;
        }

        public string Categorie
        {
            get => categorie; set => categorie = value;
        }

        public int Id_employe
        {
            get => id_employe; set => id_employe = value;
        }

        public string Auteur
        {
            get => auteur; set => auteur = value;
        }

    }
}