namespace Depannage
{
    public class Intervention
    {
        private int idInter;
        private string materiel, prix, dateinter;
        private int idPersC, idPersT;

        public Intervention()
        {
            this.idInter = 0;
            this.materiel = this.prix = this.dateinter = "";
            this.idPersC = 0;
            this.idPersT = 0;
        }

        public Intervention(string materiel, string prix, string dateinter, int idPersC, int idPersT)
        {
            this.materiel = materiel;
            this.prix = prix;
            this.dateinter = dateinter;
            this.idPersC = idPersC;
            this.idPersT = idPersT;
        }

        public Intervention(int idInter, string materiel, string prix, string dateinter, int idPersC, int idPersT)
        {
            this.idInter = idInter;
            this.materiel = materiel;
            this.prix = prix;
            this.dateinter = dateinter;
            this.idPersC = idPersC;
            this.idPersT = idPersT;
        }


        public int IdInter
        {
            get => idInter; set => idInter = value;
        }

        public string Materiel
        {
            get => materiel; set => materiel = value;
        }

        public string Prix
        {
            get => prix; set => prix = value;
        }

        public string Dateinter
        {
            get => dateinter; set => dateinter = value;
        }

        public int IdPersC
        {
            get => idPersC; set => idPersC = value;
        }

        public int IdPersT
        {
            get => idPersT; set => idPersT = value;
        }


    }
}