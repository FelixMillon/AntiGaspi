using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Intranet
{
    public class Local
    {
        private int id_local;
        private string nom;
        private string numrue;
        private string rue;
        private string ville;
        private string cp;

        public Local()
        {
            this.id_local = 0;
            this.nom = "";
            this.numrue = "";
            this.rue = "";
            this.ville = "";
            this.cp = "";
        }

        public Local(string nom, string numrue, string rue, string ville, string cp)
        {
            this.nom = nom;
            this.numrue = numrue;
            this.rue = rue;
            this.ville = ville;
            this.cp = cp;
        }

        public Local(int id_local, string nom, string numrue, string rue, string ville, string cp)
        {
            this.id_local = id_local;
            this.nom = nom;
            this.numrue = numrue;
            this.rue = rue;
            this.ville = ville;
            this.cp = cp;
        }

        public int Id_local
        {
            get => id_local; set => id_local = value;
        }

        public string Nom
        {
            get => nom; set => nom = value;
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