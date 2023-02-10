using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class VGerer
    {
        private int id_employe;
        private int id_utilisateur;
        private string dateheure_action;
        private string libelle_action;
        private string description_action;
        private string nom_emp;
        private string prenom_emp;
        private string nom_user;
        private string prenom_user;


        public VGerer()
        {
            this.id_employe = 0;
            this.id_utilisateur = 0;
            this.dateheure_action = this.libelle_action = "";
            this.description_action = "";
        }

        public VGerer(int id_employe, int id_utilisateur, string dateheure_action, string libelle_action, string description_action,
                      string nom_emp, string prenom_emp, string nom_user, string prenom_user)
        {
            this.id_employe = id_employe;
            this.id_utilisateur = id_utilisateur;
            this.dateheure_action = dateheure_action;
            this.libelle_action = libelle_action;
            this.description_action = description_action;
            this.nom_emp = nom_emp;
            this.prenom_emp = prenom_emp;
            this.nom_user = nom_user;
            this.prenom_user = prenom_user;
        }

        public VGerer(string dateheure_action, string libelle_action, string description_action,
                      string nom_emp, string prenom_emp, string nom_user, string prenom_user)
        {
            this.dateheure_action = dateheure_action;
            this.libelle_action = libelle_action;
            this.description_action = description_action;
            this.nom_emp = nom_emp;
            this.prenom_emp = prenom_emp;
            this.nom_user = nom_user;
            this.prenom_user = prenom_user;
        }


        public int Id_employe
        {
            get => id_employe; set => id_employe = value;
        }

        public int Id_utilisateur
        {
            get => id_utilisateur; set => id_utilisateur = value;
        }


        public string Dateheure_action
        {
            get => dateheure_action; set => dateheure_action = value;
        }

        public string Libelle_action
        {
            get => libelle_action; set => libelle_action = value;
        }

        public string Description_action
        {
            get => description_action; set => description_action = value;
        }

        public string Nom_emp
        {
            get => nom_emp; set => nom_emp = value;
        }

        public string Prenom_emp
        {
            get => prenom_emp; set => prenom_emp = value;
        }

        public string Nom_user
        {
            get => nom_user; set => nom_user = value;
        }

        public string Prenom_user
        {
            get => prenom_user; set => prenom_user = value;
        }


    }
}