using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class VEmploye
    {
        private int id_employe;
        private string nom, prenom;
        private int id_manager;
        private string nom_manager, prenom_manager;
        private int id_planning;
        private string libelle, url_planning;
        private int id_local;
        private string nomLocal, numrue, rue, ville, cp;

        public VEmploye()
        {
            this.id_employe = 0;
            this.nom = this.prenom = "";
            this.id_manager = 0;
            this.nom_manager = this.prenom_manager = "";
            this.id_planning = 0;
            this.libelle = this.url_planning = "";
            this.id_local = 0;
            this.nomLocal = this.numrue = this.rue = this.ville = this.cp;
        }

        public VEmploye(int id_employe, string nom, string prenom, int id_manager, string nom_manager, string prenom_manager, int id_planning,
                        string libelle, string url_planning, int id_local, string nomLocal, string numrue, string rue, string ville, string cp)
        {
            this.id_employe = id_employe;
            this.nom = nom;
            this.prenom = prenom;
            this.id_manager = id_manager;
            this.nom_manager = nom_manager;
            this.prenom_manager = prenom_manager;
            this.id_planning = id_planning;
            this.libelle = libelle;
            this.url_planning = url_planning;
            this.id_local = id_local;
            this.nomLocal = nomLocal;
            this.numrue = numrue;
            this.rue = rue;
            this.ville = ville;
            this.cp = cp;
        }


        public int Id_employe
        {
            get => id_employe; set => id_employe = value;
        }

        public string Nom
        {
            get => nom; set => nom = value;
        }

        public string Prenom
        {
            get => prenom; set => prenom = value;
        }


        public int Id_manager
        {
            get => id_manager; set => id_manager = value;
        }

        public string Nom_manager
        {
            get => nom_manager; set => nom_manager = value;
        }


        public string Prenom_manager
        {
            get => prenom_manager; set => prenom_manager = value;
        }


        public int Id_planning
        {
            get => id_planning; set => id_planning = value;
        }

        public string Libelle
        {
            get => libelle; set => libelle = value;
        }

        public string Url_planning
        {
            get => url_planning; set => url_planning = value;
        }

        public int Id_local
        {
            get => id_local; set => id_local = value;
        }

        public string NomLocal
        {
            get => nomLocal; set => nomLocal = value;
        }

        public string Numrue
        {
            get => numrue; set => numrue = value;
        }

        public string Rue
        {
            get => rue; set => rue = value;
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