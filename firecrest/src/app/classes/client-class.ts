import { Client } from "../interfaces/Client";



export class ClientClass implements Client{

    public id_client : number = 0;
	public email : string = "";
	public mdp: string  = "";
	public nom : string  = "";
    public prenom : string  = "";
    public date_inscription : string  = "";
    public tel : string  = "";
    public rue : string  = "";
    public numrue : string  = "";
    public ville : string  = "";
    public cp : string  = "";
    public siren : string  = "";
    public libelle : string  = "";
    public Role_representant : string  = "";
    public Type_cli : string  = "";
    public Valide : string = "";
    public Role : string = "";

    constructor (
        id_client : number,
        email : string,
        mdp : string,
        nom : string,
        prenom : string,
        date_inscription : string,
        tel : string,
        rue : string, 
        numrue : string,
        ville : string,
        cp : string,
        siren : string,
        libelle : string,
        Role_representant : string,
        Type_cli : string,
        Valide : string,
        Role : string){
            this.id_client = id_client,
            this.email = email,
            this.mdp = mdp,
            this.nom = nom,
            this.prenom = prenom,
            this.date_inscription = date_inscription,
            this.tel = tel,
            this.rue = rue, 
            this.numrue = numrue,
            this.ville = ville,
            this.cp = cp,
            this.siren = siren
            this.libelle = libelle,
            this.Role_representant = Role_representant,
            this.Type_cli = Type_cli,
            this.Valide = Valide,
            this.Role = Role 
    }


}