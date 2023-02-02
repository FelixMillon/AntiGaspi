namespace Depannage
{
    public class Personne
    {
        protected int idPers;  // protected car la class personne est la class mere d'un heritage entre personne -> client / technicien
        protected string nom, prenom, email, mdp;

        public Personne()
        {
            this.idPers = 0;
            this.nom = this.prenom = "";
            this.email = this.mdp = "";
        }

        public Personne(int idPers, string nom, string prenom, string email, string mdp)
        {
            this.idPers = idPers;
            this.nom = nom;
            this.prenom = prenom;
            this.email = email;
            this.mdp = mdp;
        }

        public Personne(string nom, string prenom, string email, string mdp)
        {
            this.idPers = 0;
            this.nom = nom;
            this.prenom = prenom;
            this.email = email;
            this.mdp = mdp;
        }

        public Personne(int idPers, string nom, string prenom, string email)
        {
            this.idPers = idPers;
            this.nom = nom;
            this.prenom = prenom;
            this.email = email;
        }


        public int IdPers
        {
            get => idPers; set => idPers = value;
        }

        public string Nom
        {
            get => nom; set => nom = value;
        }

        public string Prenom
        {
            get => prenom; set => prenom = value;
        }

        public string Email
        {
            get => email; set => email = value;
        }

        public string Mdp
        {
            get => mdp; set => mdp = value;
        }
    }
}