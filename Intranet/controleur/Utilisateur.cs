using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Utilisateur
    {
        private int id;
        private string email, mdp, nom, prenom, tel, rue, numrue, ville, cp;


        public Utilisateur()
        {
            this.id = 0;
            this.email = this.mdp = this.nom = this.prenom = this.tel = this.rue = this.numrue = this.ville = this.cp = "";
        }

        public Utilisateur(int id, string email, string mdp, string nom, string prenom,
                            string tel, string rue, string numrue, string ville, string cp)
        {
            this.id = id;
            this.email = email;
            this.mdp = mdp;
            this.nom = nom;
            this.prenom = prenom;
            this.tel = tel;
            this.rue = rue;
            this.numrue = numrue;
            this.ville = ville;
            this.cp = cp;
        }

        public Utilisateur(string email, string mdp, string nom, string prenom,
        string tel, string rue, string numrue, string ville, string cp)
        {
            this.email = email;
            this.mdp = mdp;
            this.nom = nom;
            this.prenom = prenom;
            this.tel = tel;
            this.rue = rue;
            this.numrue = numrue;
            this.ville = ville;
            this.cp = cp;
        }

        public int Id
        {
            get => id; set => id = value;
        }

        public string Email
        {
            get => email; set => email = value;
        }

        public string Mdp
        {
            get => mdp; set => mdp = value;
        }

        public string Nom
        {
            get => nom; set => nom = value;
        }

        public string Prenom
        {
            get => prenom; set => prenom = value;
        }

        public string Tel
        {
            get => tel; set => tel = value;
        }

        public string Rue
        {
            get => rue; set => rue = value;
        }

        public string Numrue
        {
            get => numrue; set => numrue = value;
        }

        public string Ville
        {
            get => ville; set => ville = value;
        }

        public string Cp
        {
            get => cp; set => cp = value;
        }

    }
}