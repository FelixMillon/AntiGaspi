using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Gerer
    {
        private int id_employe;
        private int id_utilisateur;
        private string dateheure_action;
        private string libelle_action;
        private string description_action;


        public Gerer()
        {
            this.id_employe = 0;
            this.id_utilisateur = 0;
            this.dateheure_action =  this.libelle_action = "";
            this.description_action = "";
        }

        public Gerer(int id_employe, int id_utilisateur, string dateheure_action, string libelle_action, string description_action)
        {
            this.id_employe = id_employe;
            this.id_utilisateur = id_utilisateur;
            this.dateheure_action = dateheure_action;
            this.libelle_action = libelle_action;
            this.description_action = description_action;
        }

        public Gerer(string dateheure_action, string libelle_action, string description_action)
        {
            this.dateheure_action = dateheure_action;
            this.libelle_action = libelle_action;
            this.description_action = description_action;
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


    }
}