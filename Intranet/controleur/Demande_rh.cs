using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Demande_rh
    {
        private int id_demande_rh;
        private string libelle, objet, requete_sql, date_demande, date_resolution, etat;
        private int id_employe, id_manager;

        public Demande_rh()
        {
            this.id_demande_rh = 0;
            this.libelle = this.objet = this.requete_sql = this.date_demande = "";
            this.date_resolution = this.etat = "";
            this.id_employe = this.id_manager = 0;
        }

        public Demande_rh(string libelle, string objet, string requete_sql, string date_demande,
            string date_resolution, string etat, int id_employe, int id_manager)
        {
            this.libelle = libelle;
            this.objet = objet;
            this.requete_sql = requete_sql;
            this.date_demande = date_demande;
            this.date_resolution = date_resolution;
            this.etat = etat;
            this.id_employe = id_employe;
            this.id_manager = id_manager;
        }

        public Demande_rh(int id_demande_rh, string libelle, string objet, string requete_sql, string date_demande,
            string date_resolution, string etat, int id_employe, int id_manager)
        {
            this.id_demande_rh = id_demande_rh;
            this.libelle = libelle;
            this.objet = objet;
            this.requete_sql = requete_sql;
            this.date_demande = date_demande;
            this.date_resolution = date_resolution;
            this.etat = etat;
            this.id_employe = id_employe;
            this.id_manager = id_manager;
        }

        public int Id_demande_rh
        {
            get => id_demande_rh; set => id_demande_rh = value;
        }

        public string Libelle
        {
            get => libelle; set => libelle = value;
        }

        public string Objet
        {
            get => objet; set => objet = value;
        }
        public string Requete_sql
        {
            get => requete_sql; set => requete_sql = value;
        }


        public string Date_demande
        {
            get => date_demande; set => date_demande = value;
        }

        public string Date_resolution
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

    }
}