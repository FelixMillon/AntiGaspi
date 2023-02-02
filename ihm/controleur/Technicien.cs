namespace Depannage
{
    public class Technicien : Personne
    {
        private string qualification;
        public Technicien() : base()
        {
            this.qualification = "";
        }

        public Technicien(int idPers, string nom, string prenom, string email, string mdp, string qualification) : base(idPers, nom, prenom, email, mdp)
        {
            this.qualification = qualification;
        }
        public Technicien(int idPers, string nom, string prenom, string email, string qualification) : base(idPers, nom, prenom, email)
        {
            this.qualification = qualification;
        }


        public Technicien(string nom, string prenom, string email, string mdp, string qualification) : base(nom, prenom, email, mdp)
        {
            this.qualification = qualification;
        }
        public string Qualification
        {
            get => this.qualification; set => this.qualification = value;
        }
    }
}