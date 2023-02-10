using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class VManager
    {
        private int id_manager;
        private string nom, prenom;
        private int id_manag_supp;
        private string nom_sup, prenom_sup;
        private int id_planning;
        private string libelle, url_planning;
        private int id_local;
        private string nomLocal, numrue, rue, ville, cp;

        public VManager()
        {
            this.id_manager = 0;
            this.nom = this.prenom = "";
            this.id_manag_supp = 0;
            this.nom_sup = this.prenom_sup = "";
            this.id_planning = 0;
            this.libelle = this.url_planning = "";
            this.id_local = 0;
            this.nomLocal = this.numrue = this.rue = this.ville = this.cp;
        }

        public VManager(int id_manager, string nom, string prenom, int id_manag_supp, string nom_sup, string prenom_sup, int id_planning,
                        string libelle, string url_planning, int id_local, string nomLocal, string numrue, string rue, string ville, string cp)
        {
            this.id_manager = id_manager;
            this.nom = nom;
            this.prenom = prenom;
            this.id_manag_supp = id_manag_supp;
            this.nom_sup = nom_sup; 
            this.prenom_sup = prenom_sup;
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


        public int Id_manager
        {
            get => id_manager; set => id_manager = value;
        }

        public string Nom
        {
            get => nom; set => nom = value;
        }

        public string Prenom
        {
            get => prenom; set => prenom = value;
        }


        public int Id_manag_supp
        {
            get => id_manag_supp; set => id_manag_supp = value;
        }

        public string Nom_sup
        {
            get => nom_sup; set => nom_sup = value;
        }


        public string Prenom_sup
        {
            get => prenom_sup; set => prenom_sup = value;
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