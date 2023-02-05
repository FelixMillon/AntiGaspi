using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class VDemande_autre
    {
        private int id_demande_autre;
        private string libelle, description, etat;
        private int id_employe, id_manager;
        private DateTime date_demande, date_resolution;
        private string nomE, prenomE, nomM, prenomM;

        public VDemande_autre()
        {
            this.id_demande_autre = 0;
            this.libelle = this.description = "";
            this.date_demande = this.date_resolution = new DateTime(0000, 00, 00, 00, 00, 00);
            this.etat = "";
            this.id_employe = this.id_manager = 0;
            this.nomE = this.prenomE = "";
            this.nomM = this.prenomM = "";
        }

        public VDemande_autre(string libelle, string description, DateTime date_demande,
            DateTime date_resolution, string etat, int id_employe, int id_manager, string nomE, string prenomE, string nomM, string prenomM)
        {
            this.libelle = libelle;
            this.description = description;
            this.date_demande = date_demande;
            this.date_resolution = date_resolution;
            this.etat = etat;
            this.id_employe = id_employe;
            this.id_manager = id_manager;
            this.nomE = nomE;
            this.prenomE = prenomE;
            this.nomM = nomM;
            this.prenomM = prenomM;
        }

        public VDemande_autre(int id_demande_autre, string libelle, string description, DateTime date_demande,
            DateTime date_resolution, string etat, int id_employe, int id_manager, string nomE, string prenomE, string nomM, string prenomM)
        {
            this.libelle = libelle;
            this.description = description;
            this.date_demande = date_demande;
            this.date_resolution = date_resolution;
            this.etat = etat;
            this.id_employe = id_employe;
            this.id_manager = id_manager;
            this.nomE = nomE;
            this.prenomE = prenomE;
            this.nomM = nomM;
            this.prenomM = prenomM;
        }

        public int Id_demande_autre
        {
            get => id_demande_autre; set => id_demande_autre = value;
        }

        public string Libelle
        {
            get => libelle; set => libelle = value;
        }

        public string Description
        {
            get => description; set => description = value;
        }

        public DateTime Date_demande
        {
            get => date_demande; set => date_demande = value;
        }

        public DateTime Date_resolution
        {
            get => date_resolution; set => date_resolution = value;
        }

        public string Etat
        {
            get => etat; set => etat = value;
        }

        public int Id_employe
        {
            get => id_employe; set => id_employe = value;
        }
        public int Id_manager
        {
            get => id_manager; set => id_manager = value;
        }

        public string NomM
        {
            get => nomM; set => nomM = value;
        }
        public string PrenomM
        {
            get => prenomM; set => prenomM = value;
        }

        public string NomE
        {
            get => nomE; set => nomE = value;
        }
        public string PrenomE
        {
            get => prenomE; set => prenomE = value;
        }




    }
}