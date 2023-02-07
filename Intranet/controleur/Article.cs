using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Article
    {
        private int id_article;
        private string titre;
        private string sous_titre;
        private int id_cat_art;
        private int id_auteur;

        public Article()
        {
            this.id_article = 0;
            this.titre = "";
            this.sous_titre = "";
            this.id_cat_art = 0;
            this.id_auteur = 0;
        }

        public Article(string titre, string sous_titre, int id_cat_art, int id_auteur)
        {
            this.titre = titre;
            this.sous_titre = sous_titre;
            this.id_cat_art = id_cat_art;
            this.id_auteur = id_auteur;
        }

        public Article(int id_article, string titre, string sous_titre, int id_cat_art, int id_auteur)
        {
            this.id_article = id_article;
            this.titre = titre;
            this.sous_titre = sous_titre;
            this.id_cat_art = id_cat_art;
            this.id_auteur = id_auteur;
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

        public int Id_auteur
        {
            get => id_auteur; set => id_auteur = value;
        }


    }
}