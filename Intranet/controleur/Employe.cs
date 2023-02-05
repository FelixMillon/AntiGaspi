using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Employe
    {
        private int id_employe;
        private string email, mdp, nom, prenom, tel, rue, numrue, ville, cp, fonction, salaire;
        private string niveau_diplome, droits;
        private int id_planning, id_manager, id_local;
        private DateTime date_embauche, date_depart;

        public Employe()
        {
            this.id_employe = 0;
            this.email = this.mdp = this.nom = this.prenom = this.tel = this.rue = this.numrue = this.ville = this.cp = "";
            this.fonction = this.salaire = this.niveau_diplome = this.droits =  "";
            this.date_embauche = this.date_depart = new DateTime(0000, 00, 00, 00, 00, 00);
            this.id_planning = this.id_manager = this.id_local = 0;
        }

        public Employe(string email, string mdp, string nom, string prenom,
        string tel, string rue, string numrue, string ville, string cp, string fonction, string salaire,
        string niveau_diplome, DateTime date_embauche, DateTime date_depart, string droits,
        int id_planning, int id_manager, int id_local)
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
            this.fonction = fonction;
            this.salaire = salaire;
            this.niveau_diplome = niveau_diplome;
            this.date_embauche = date_embauche;
            this.date_depart = date_depart;
            this.droits = droits;
            this.id_planning = id_planning;
            this.id_manager = id_manager;
            this.id_local = id_local;
        }

        public Employe(int id_employe, string email, string mdp, string nom, string prenom,
        string tel, string rue, string numrue, string ville, string cp, string fonction, string salaire,
        string niveau_diplome, DateTime date_embauche, DateTime date_depart, string droits,
        int id_planning, int id_manager, int id_local)
        {
            this.id_employe = id_employe;
            this.email = email;
            this.mdp = mdp;
            this.nom = nom;
            this.prenom = prenom;
            this.tel = tel;
            this.rue = rue;
            this.numrue = numrue;
            this.ville = ville;
            this.cp = cp;
            this.fonction = fonction;
            this.salaire = salaire;
            this.niveau_diplome = niveau_diplome;
            this.date_embauche = date_embauche;
            this.date_depart = date_depart;
            this.droits = droits;
            this.id_planning = id_planning;
            this.id_manager = id_manager;
            this.id_local = id_local;
        }

        public int Id_employe
        {
            get => id_employe; set => id_employe = value;
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

        public string Fonction
        {
            get => fonction; set => fonction = value;
        }

        public string Salaire
        {
            get => salaire; set => salaire = value;
        }

        public string Niveau_diplome
        {
            get => niveau_diplome; set => niveau_diplome = value;
        }

        public DateTime Date_embauche
        {
            get => date_embauche; set => date_embauche = value;
        }
        public DateTime Date_depart
        {
            get => date_depart; set => date_depart = value;
        }

        public string Droits
        {
            get => droits; set => droits = value;
        }

        public int Id_planning
        {
            get => id_planning; set => id_planning = value;
        }

        public int Id_manager
        {
            get => id_manager; set => id_manager = value;
        }

        public int Id_local
        {
            get => id_local; set => id_local = value;
        }





    }
}