using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Planning
    {
        private int id_planning;
        private string libelle;
        private string url_planning;

        public Planning()
        {
            this.id_planning = 0;
            this.libelle = "";
            this.url_planning = "";
        }

        public Planning(string libelle, string url_planning)
        {
            this.libelle = libelle;
            this.url_planning = url_planning;
        }

        public Planning(int id_planning, string libelle, string url_planning)
        {
            this.id_planning = id_planning;
            this.libelle = libelle;
            this.url_planning = url_planning;
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
    }
}