drop database if exists bdd_anti_gaspi;
create database bdd_anti_gaspi;
	use bdd_anti_gaspi;



create table utilisateur
(
	id int(5) not null auto_increment,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    tel varchar(20) not null,
    primary key (id)
)engine=innodb;

create table enquete
(
    id_enquete int(5) not null auto_increment,
    libelle varchar(100) not null,
    description_enquete varchar(255) not null,
    primary key(id_enquete)
)engine=innodb;

create table sujet
(
	id_sujet int(5) not null auto_increment,
    numquestion int(3) not null,
	libelle varchar(100) not null,
	question varchar(255) not null,
    type_question enum('note','note_image','qcm','qcm_image','qcu','qcu_image'),
    reponse varchar(255),
    id_enquete int(5) not null,
    primary key (id_sujet),
    foreign key(id_enquete) references enquete(id_enquete)
    on update cascade
    on delete cascade
)engine=innodb;


create table consommateur
(
	id_consommateur int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(3, 2) not null,
    tel varchar(20) not null,
    valide enum('valide','invalide','attente') not null,
    primary key (id_consommateur)
)engine=innodb;

create table client
(
	id_client int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(3, 2) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    siren varchar(100),
    libelle varchar(100),
    role_representant varchar(100),
    type_cli enum('particulier','association','entreprise') not null,
    valide enum('valide','invalide','attente') not null,
    primary key (id_client)
)engine=innodb;

create table entreprise
(
	id_entreprise int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(3, 2) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    siret varchar(100) not null,
    libelle varchar(100) not null,
    notepublic decimal(3, 2),
    role_represenant varchar(100),
    type_ent varchar(255),
    valide enum('valide','invalide','attente') not null,
    primary key (id_entreprise)
)engine=innodb;

create table type_vehicule
(
	id_type_vehicule int(5) not null,
	libelle varchar(100) not null,
    primary key (id_type_vehicule)
)engine=innodb;

create table vehicule
(
    id_vehicule int(5) not null,
    immatriculation varchar(100) UNIQUE,
	poids_max decimal(6,2) not null,
    annee_fabrication date not null,
    volume decimal(3,2) not null,
	energie enum('essence','diesel','biocarburant','electrique','hybride','mecanique') not null,
    cons_100_km decimal(3,2) not null,
    id_type_vehicule int(5) not null,
    primary key (id_vehicule),
    foreign key(id_type_vehicule) references type_vehicule(id_type_vehicule)
    on update cascade
    on delete cascade
)engine=innodb;

create table livreur
(
	id_livreur int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(3, 2) not null,
    tel varchar(20) not null,
    id_vehicule int(5),
    notepublic decimal(3, 2),
    valide enum('valide','invalide','attente') not null,
    primary key (id_livreur),
    foreign key(id_vehicule) references vehicule(id_vehicule)
    on update cascade
    on delete cascade
)engine=innodb;

create table candidat
(
	id_candidat int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(3, 2) not null,
    tel varchar(20) not null,
    niveau_diplome varchar(100)not null,
    branche_metier varchar(100)not null,
    valide enum('valide','invalide','attente') not null,
    primary key (id_candidat)
)engine=innodb;

create table planning
(
    id_planning int(5) not null auto_increment,
    libelle varchar(100) not null,
    url_planning varchar(255) not null,
    primary key(id_planning)
)engine=innodb;

create table manager
(
	id_manager int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    tel varchar(20) not null,
    fonction varchar(255) not null,
    salaire decimal(6,2) not null,
    niveau_diplome varchar(100) not null,
    date_embauche date not null,
    date_depart date,
    droits enum('administrateur','developpeur','collaborateur','consultant','invite','client') not null,
    niveau_manager varchar(100) not null,
    id_planning int(5) not null,
    id_manager_sup int(5),
    primary key (id_manager),
    foreign key(id_manager_sup) references manager(id_manager)
    on update cascade
    on delete cascade,
    foreign key(id_planning) references planning(id_planning)
    on update cascade
    on delete cascade
)engine=innodb;

create table employe
(
	id_employe int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    tel varchar(20) not null,
    fonction varchar(255) not null,
    salaire decimal(6,2) not null,
    niveau_diplome varchar(100) not null,
    date_embauche date not null,
    date_depart date,
    droits enum('administrateur','developpeur','collaborateur','consultant','invite','client') not null,
    id_planning int(5) not null,
    id_manager int(5),
    primary key (id_employe),
    foreign key(id_manager) references manager(id_manager)
    on update cascade
    on delete cascade,
    foreign key(id_planning) references planning(id_planning)
    on update cascade
    on delete cascade
)engine=innodb;


create table avis_enquete  
(
	id_avis_enquete int(5) not null auto_increment,
	reponse varchar(255) not null,
    note decimal(3, 2),
    id_sujet int(5) not null,
    id_consommateur int(5),
    primary key(id_avis_enquete),
    foreign key(id_sujet) references sujet(id_sujet)
    on update cascade
    on delete cascade,
    foreign key(id_consommateur) references consommateur(id_consommateur)
    on update cascade
    on delete cascade
)engine=innodb;

create table categorie_produit   
(
	id_categorie int(5) not null auto_increment,
	libelle varchar(100) not null,
	description varchar(255) not null,
    primary key(id_categorie)
)engine=innodb;

create table produit
(
	id_produit int(5) not null auto_increment,
	libelle varchar(100) not null,
	description varchar(255) not null,
    regime_alim enum('crudivore','vegan','vegetalien','vegetarien','glutenfree'),
    numrue_depot varchar(50) not null,
    rue_depot varchar(100) not null,
    ville_depot varchar(100) not null,
    cp_depot varchar(10) not null,
    prix_base decimal(5, 2),
    reduction decimal(2, 2),
    poids_unite decimal(6, 2),
    note decimal(3, 2),
    id_categorie int(5) not null,
    id_entreprise int(5) not null,
    primary key(id_produit),
    foreign key(id_categorie) references categorie_produit(id_categorie)
    on update cascade
    on delete cascade,
    foreign key(id_entreprise) references entreprise(id_entreprise)
    on update cascade
    on delete cascade
)engine=innodb;

create table image
(
	id_image int(5) not null auto_increment,
	path_image varchar(255),
	url_image varchar(255),
    id_produit int(5),
    id_utilisateur int(5),
    primary key(id_image),
    foreign key(id_produit) references produit(id_produit)
    on update cascade
    on delete cascade,
    foreign key(id_utilisateur) references utilisateur(id)
    on update cascade
    on delete cascade
)engine=innodb;

create table commande  
(
    id_commande int(5) auto_increment not null,
    id_livreur int(5),
	dateheure_debut datetime not null,
	dateheure_fin_reel datetime,
    dateheure_fin_estimee datetime,
    primary key(id_commande),
    foreign key(id_livreur) references livreur(id_livreur)
    on update cascade
    on delete cascade
)engine=innodb;

create table ligne_commande  
(
    id_ligne_commande int(5) auto_increment not null,
    id_client int(5) not null,
    id_produit int(5) not null,
    id_commande int(5) not null,
    quantite int(5) not null,
    primary key(id_ligne_commande),
    foreign key(id_client) references client(id_client)
    on update cascade
    on delete cascade,
    foreign key(id_produit) references produit(id_produit)
    on update cascade
    on delete cascade,
    foreign key(id_commande) references commande(id_commande)
    on update cascade
    on delete cascade
)engine=innodb;

create table commentaire
(
    id_commentaire int(5) not null auto_increment,
	titre varchar(50) not null,
    texte varchar(255) not null,
    note decimal(3, 2) not null,
    id_consommateur_source int(5) not null,
    id_consommateur_cible int(5),
    id_produit int(5),
    primary key(id_commentaire),
    foreign key(id_consommateur_source) references consommateur(id_consommateur)
    on update cascade
    on delete cascade,
    foreign key(id_consommateur_cible) references consommateur(id_consommateur)
    on update cascade
    on delete cascade,
    foreign key(id_produit) references produit(id_produit)
    on update cascade
    on delete cascade
)engine=innodb;

create table categorie_metier   
(
    id_cat_met int(5) not null auto_increment,
    libelle varchar(100) not null,
    description varchar(255) not null,
    primary key(id_cat_met)
)engine=innodb;

create table metier
(
    id_met int(5) not null auto_increment,
    libelle varchar(100) not null,
	niveau_salaire decimal(5, 2) not null,
    id_cat_met int(5) not null,
    primary key(id_met),
    foreign key(id_cat_met) references categorie_metier(id_cat_met)
    on update cascade
    on delete cascade
)engine=innodb;

create table locaux   
(
    id_local int(5) not null auto_increment,
    nom varchar(255) not null,
    numrue varchar(50) not null,
    rue varchar(100) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    primary key(id_local)
)engine=innodb;

create table poste
(
    id_poste int(5) not null auto_increment,
    libelle varchar(100) not null,
	date_debut date not null,
	date_fin date,
	salaire_propose decimal(5, 2) not null,
    description varchar(255) not null,
    type_poste enum('cdi','cdd','contrat_prestation'),
    id_local int(5) not null,
    id_met int(5) not null,
    primary key(id_poste),
    foreign key(id_local) references locaux(id_local)
    on update cascade
    on delete cascade,
    foreign key(id_met) references metier(id_met)
    on update cascade
    on delete cascade
)engine=innodb;

create table site
(
    id_site int(5) not null auto_increment,
    libelle varchar(100) not null,
    descriptif varchar(255) not null,
    url_site varchar(255) not null,
    primary key(id_site)
)engine=innodb;

create table page
(
    id_page int(5) not null auto_increment,
    descriptif varchar(255) not null,
    url_page varchar(255) not null,
    id_site int(5) not null,
    primary key(id_page),
    foreign key(id_site) references site(id_site)
    on update cascade
    on delete cascade
)engine=innodb;

create table composant
(
    id_composant int(5) not null auto_increment,
    type_composant enum('article','graphique','tableau','camembert'),
    titre varchar(255) not null,
    id_page int(5) not null,
    primary key(id_composant),
    foreign key(id_page) references page(id_page)
    on update cascade
    on delete cascade
)engine=innodb;


create table donnee
(
    id_data int(5) not null auto_increment,
    libelle varchar(100) not null,
    type_data enum('int','float','dict','list','bool','str') not null,
    valeur varchar(255) not null,
    id_composant int(5),
    primary key(id_data),
    foreign key(id_composant) references composant(id_composant)
    on update cascade
    on delete cascade
)engine=innodb;


create table enregister  
(
    id_composant int(5) not null,
    id_data int(5) not null,
    primary key (id_composant, id_data),
    foreign key(id_composant) references composant(id_composant)
    on update cascade
    on delete cascade,
    foreign key(id_data) references donnee(id_data)
    on update cascade
    on delete cascade
)engine=innodb;

create table gerer  
(
    id_employe int(5) not null,
    dateheure_action datetime not null,
    id_utilisateur int(5) not null,
    libelle_action varchar(100),
    description_action varchar(255),
    primary key (id_employe,id_utilisateur,dateheure_action),
    foreign key(id_employe) references employe(id_employe)
    on update cascade
    on delete cascade,
    foreign key(id_utilisateur) references utilisateur(id)
    on update cascade
    on delete cascade
)engine=innodb;

create table moderer  
(
    id_employe int(5) not null,
    dateheure_action datetime not null,
    id_commentaire int(5) not null,
    libelle_action varchar(100),
    description_action varchar(255),
    primary key (id_employe,id_commentaire,dateheure_action),
    foreign key(id_employe) references employe(id_employe)
    on update cascade
    on delete cascade,
    foreign key(id_commentaire) references commentaire(id_commentaire)
    on update cascade
    on delete cascade
)engine=innodb;

create table donnee_bancaire
(
	id_donnee_bancaire int(5) not null auto_increment,
	type_donnee varchar(100) not null,
	carte varchar(40) UNIQUE,
	iban varchar(40) UNIQUE,
	bic varchar(40) UNIQUE,
    validite date,
    crypto int(8),
    id int(5) not null,
    primary key (id_donnee_bancaire),
    foreign key(id) references utilisateur(id)
    on update cascade
    on delete cascade
)engine=innodb;

drop trigger if exists consommateur_before_insert;
delimiter // 
create trigger consommateur_before_insert 
before insert on consommateur
for each row
begin
    insert into utilisateur values(null,new.email,new.mdp,new.nom,new.prenom,new.tel);
    set new.id_consommateur = (select id from utilisateur where email=new.email);
end //
delimiter ;

drop trigger if exists consommateur_before_delete;
delimiter // 
create trigger consommateur_before_delete 
before delete on consommateur
for each row
begin
    delete from utilisateur where id=old.id_consommateur;
end //
delimiter ;

drop trigger if exists employe_before_insert;
delimiter // 
create trigger employe_before_insert 
before insert on employe
for each row
begin
    insert into utilisateur values(null,new.email,new.mdp,new.nom,new.prenom,new.tel);
    set new.id_employe= (select id from utilisateur where email=new.email);
end //
delimiter ;

drop trigger if exists employe_before_delete;
delimiter // 
create trigger employe_before_delete 
before delete on employe
for each row
begin
    delete from utilisateur where id=old.id_employe;
end //
delimiter ;

drop trigger if exists client_before_insert;
delimiter // 
create trigger client_before_insert 
before insert on client
for each row
begin
    if new.id_client is null
    then
        set new.noteconfemp=2.5;
        set new.valide='attente';
        set new.date_inscription=curdate();
        insert into consommateur values(null,new.email,new.mdp,new.nom,new.prenom,new.date_inscription,new.noteconfemp,new.tel,new.valide);
        set new.id_client = (select id_consommateur from consommateur where email=new.email);
    elseif new.id_client = (select id_consommateur from consommateur where email=new.email)
    and new.email = (select email from consommateur where id_consommateur = new.id_client)
    and new.mdp = (select mdp from consommateur where id_consommateur = new.id_client)
    and new.nom = (select nom from consommateur where id_consommateur = new.id_client)
    and new.prenom = (select prenom from consommateur where id_consommateur = new.id_client)
    and new.tel = (select tel from consommateur where id_consommateur = new.id_client)
    then
        set new.id_client = (select id_consommateur from consommateur where email=new.email);
        set new.noteconfemp = (select noteconfemp from consommateur where email=new.email);
        set new.valide  = (select valide from consommateur where email=new.email);
        set new.date_inscription = (select date_inscription from consommateur where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "le consommateur n'existe pas impossible de lui attribuer un nouveau role";
    end if;
end //
delimiter ;

drop trigger if exists candidat_before_insert;
delimiter // 
create trigger candidat_before_insert 
before insert on candidat
for each row
begin
    if new.id_candidat is null
    then
        set new.noteconfemp=2.5;
        set new.valide='attente';
        set new.date_inscription=curdate();
        insert into consommateur values(null,new.email,new.mdp,new.nom,new.prenom,new.date_inscription,new.valide,new.tel,new.noteconfemp);
        set new.id_candidat = (select id_consommateur from consommateur where email=new.email);
    elseif new.id_candidat = (select id_consommateur from consommateur where email=new.email)
    and new.email = (select email from consommateur where id_consommateur = new.id_candidat)
    and new.mdp = (select mdp from consommateur where id_consommateur = new.id_candidat)
    and new.nom = (select nom from consommateur where id_consommateur = new.id_candidat)
    and new.prenom = (select prenom from consommateur where id_consommateur = new.id_candidat)
    and new.tel = (select tel from consommateur where id_consommateur = new.id_candidat)
    then
        set new.id_candidat = (select id_consommateur from consommateur where email=new.email);
        set new.noteconfemp = (select noteconfemp from consommateur where email=new.email);
        set new.valide  = (select valide from consommateur where email=new.email);
        set new.date_inscription = (select date_inscription from consommateur where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "le consommateur n'existe pas impossible de lui attribuer un nouveau role";
    end if;
end //
delimiter ;

drop trigger if exists entreprise_before_insert;
delimiter // 
create trigger entreprise_before_insert 
before insert on entreprise
for each row
begin
    if new.id_entreprise is null
    then
        set new.noteconfemp=2.5;
        set new.valide='attente';
        set new.date_inscription=curdate();
        insert into consommateur values(null,new.email,new.mdp,new.nom,new.prenom,new.date_inscription,new.valide,new.tel,new.noteconfemp);
        set new.id_entreprise = (select id_consommateur from consommateur where email=new.email);
    elseif new.id_entreprise = (select id_consommateur from consommateur where email=new.email)
    and new.email = (select email from consommateur where id_consommateur = new.id_entreprise)
    and new.mdp = (select mdp from consommateur where id_consommateur = new.id_entreprise)
    and new.nom = (select nom from consommateur where id_consommateur = new.id_entreprise)
    and new.prenom = (select prenom from consommateur where id_consommateur = new.id_entreprise)
    and new.tel = (select tel from consommateur where id_consommateur = new.id_entreprise)
    then
        set new.id_entreprise = (select id_consommateur from consommateur where email=new.email);
        set new.noteconfemp = (select noteconfemp from consommateur where email=new.email);
        set new.valide  = (select valide from consommateur where email=new.email);
        set new.date_inscription = (select date_inscription from consommateur where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "le consommateur n'existe pas impossible de lui attribuer un nouveau role";
    end if;
end //
delimiter ;

drop trigger if exists livreur_before_insert;
delimiter // 
create trigger livreur_before_insert 
before insert on livreur
for each row
begin
    if new.id_livreur is null
    then
        set new.noteconfemp=2.5;
        set new.valide='attente';
        set new.date_inscription=curdate();
        insert into consommateur values(null,new.email,new.mdp,new.nom,new.prenom,new.date_inscription,new.noteconfemp,new.tel,new.valide);
        set new.id_livreur = (select id_consommateur from consommateur where email=new.email);
    elseif new.id_livreur = (select id_consommateur from consommateur where email=new.email)
    and new.email = (select email from consommateur where id_consommateur = new.id_livreur)
    and new.mdp = (select mdp from consommateur where id_consommateur = new.id_livreur)
    and new.nom = (select nom from consommateur where id_consommateur = new.id_livreur)
    and new.prenom = (select prenom from consommateur where id_consommateur = new.id_livreur)
    and new.tel = (select tel from consommateur where id_consommateur = new.id_livreur)
    then
        set new.id_livreur = (select id_consommateur from consommateur where email=new.email);
        set new.noteconfemp = (select noteconfemp from consommateur where email=new.email);
        set new.valide  = (select valide from consommateur where email=new.email);
        set new.date_inscription = (select date_inscription from consommateur where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "le consommateur n'existe pas impossible de lui attribuer un nouveau role";
    end if;
end //
delimiter ;

drop trigger if exists utilisateur_after_update;
delimiter // 
create trigger utilisateur_after_update 
after update on utilisateur
for each row
begin
    update consommateur set id_consommateur=new.id,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,tel=new.tel where id_consommateur=old.id;
end //
delimiter ;

drop trigger if exists consommateur_after_update;
delimiter // 
create trigger consommateur_after_update 
after update on consommateur
for each row
begin
    update client set id_client=new.id_consommateur,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,tel=new.tel,valide=new.valide where id_client=old.id_consommateur;
    update entreprise set id_entreprise=new.id_consommateur,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,tel=new.tel,valide=new.valide where id_entreprise=old.id_consommateur;
    update livreur set id_livreur=new.id_consommateur,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,tel=new.tel,valide=new.valide where id_livreur=old.id_consommateur;
    update candidat set id_candidat=new.id_consommateur,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,tel=new.tel,valide=new.valide where id_candidat=old.id_consommateur;
end //
delimiter ;

drop trigger if exists employe_after_update;
delimiter // 
create trigger employe_after_update 
after update on employe
for each row
begin
    update utilisateur set id=new.id_employe,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,tel=new.tel where id=old.id_employe;
end //
delimiter ;

drop trigger if exists client_before_delete;
delimiter // 
create trigger client_before_delete 
before delete on client
for each row
begin
    if old.id_client not in (select id_entreprise from entreprise) and old.id_client not in (select id_livreur from livreur) and old.id_client not in (select id_candidat from candidat)
        then delete from consommateur where id_consommateur=old.id_client;
    end if;
end //
delimiter ;

drop trigger if exists entreprise_before_delete;
delimiter // 
create trigger entreprise_before_delete 
before delete on entreprise
for each row
begin
    if old.id_entreprise not in (select id_client from client) and old.id_entreprise not in (select id_livreur from livreur) and old.id_entreprise not in (select id_candidat from candidat)
        then delete from consommateur where id_consommateur=old.id_entreprise;
    end if;
end //
delimiter ;

drop trigger if exists livreur_before_delete;
delimiter // 
create trigger livreur_before_delete 
before delete on livreur
for each row
begin
    if old.id_livreur not in (select id_client from client) and old.id_livreur not in (select id_entreprise from entreprise) and old.id_livreur not in (select id_candidat from candidat)
        then delete from consommateur where id_consommateur=old.id_livreur;
    end if;
end //
delimiter ;

drop trigger if exists candidat_before_delete;
delimiter // 
create trigger candidat_before_delete 
before delete on candidat
for each row
begin
    if old.id_candidat not in (select id_client from client) and old.id_candidat not in (select id_entreprise from entreprise) and old.id_candidat not in (select id_livreur from livreur)
        then delete from consommateur where id_consommateur=old.id_candidat;
    end if;
end //
delimiter ;

drop trigger if exists image_before_insert;
delimiter // 
create trigger image_before_insert 
before insert on image
for each row
begin
    if new.id_produit is null and new.id_utilisateur is null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "L'image doit forcement concerner un utilisateur ou un produit";
    elseif new.id_produit is not null and new.id_utilisateur is not null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "L'image doit concerner soit un utilisateur soit un produit";
    elseif new.path_image is null and new.url_image is null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "L'image doit forcement avoir un path ou une url";
    elseif new.path_image is not null and new.url_image is not null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "L'image doit avoir soit un path soit une url";
    end if;
end //
delimiter ;

drop trigger if exists image_before_update;
delimiter // 
create trigger image_before_update 
before update on image
for each row
begin
    if new.id_produit is null and new.id_utilisateur is null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "L'image doit forcement concerner un utilisateur ou un produit";
    elseif new.id_produit is not null and new.id_utilisateur is not null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "L'image doit concerner soit un utilisateur soit un produit";
    elseif new.path_image is null and new.url_image is null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "L'image doit forcement avoir un path ou une url";
    elseif new.path_image is not null and new.url_image is not null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "L'image doit avoir soit un path soit une url";
    end if;
end //
delimiter ;

drop trigger if exists commentaire_before_insert;
delimiter // 
create trigger commentaire_before_insert 
before insert on commentaire
for each row
begin
    if new.id_consommateur_cible is null and new.id_produit is null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "Le commentaire doit forcement concerner un utilisateur ou un produit";
    elseif new.id_consommateur_cible is not null and new.id_produit is not null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "Le commentaire doit concerner soit un utilisateur soit un produit";
    elseif new.id_consommateur_cible is not null and new.id_consommateur_cible = new.id_consommateur_source
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "On ne peut pas se commenter soit-même";
    elseif new.id_produit is not null and new.id_consommateur_source = (select id_entreprise from produit where id_produit=new.id_produit)
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "On ne peut pas commenter ses produits";
    end if;
end //
delimiter ;

drop trigger if exists commentaire_before_update;
delimiter // 
create trigger commentaire_before_update 
before update on commentaire
for each row
begin
    if new.id_consommateur_cible is null and new.id_produit is null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "Le commentaire doit forcement concerner un utilisateur ou un produit";
    elseif new.id_consommateur_cible is not null and new.id_produit is not null
    then
        signal sqlstate '45000' SET MESSAGE_TEXT = "Le commentaire doit concerner soit un utilisateur soit un produit";
    end if;
end //
delimiter ;

drop trigger if exists sujet_before_insert;
delimiter // 
create trigger sujet_before_insert 
before insert on sujet
for each row
begin
    if (select count(id_sujet) from sujet where id_enquete = new.id_enquete) =0
    then set new.numquestion = 1;
    else set new.numquestion = (select count(id_sujet) from sujet where id_enquete = new.id_enquete )+1;
    end if;
end //
delimiter ;

drop procedure if exists insertavis;
DELIMITER //
CREATE PROCEDURE insertavis
(IN unereponse varchar(255), IN unenote decimal(3,2), unnumquestion int, IN unid_enquete int, IN id_consommateur int)
BEGIN
DECLARE unid_sujet int(5);
set unid_sujet = (select id_sujet from sujet where id_enquete = unid_enquete and numquestion = unnumquestion);
insert into avis_enquete values(null,unereponse,unenote,unid_sujet,id_consommateur);
END //
DELIMITER ;

insert into client values(null,'jean_dupont@gmail.com','123','dupont','jean',null,2.5,'0123456789','15','rue des champs','Paris','75020',null,null,null,'particulier','attente');
insert into client values(null,'les_restos_du_pancreas@gmail.com','123','Matho','Momo',null,2.5,'0123456788','24','avenue saint honore','Paris','75008','izgefibdkcsnjis165161','les restos du pancreas','ambassadeur association','association','attente');
insert into entreprise values(null,'aubonpainbiendecheznous@gmail.com','123','Subra de Bieusse','Jean-Michel',null,2.5,'0623476481','15 bis','rue des grands moulins','Paris','75013','bauefygziygu56498zeuzg','Au bon pain bien de chez nous',null,'proprietaire','boulangerie','attente');
insert into livreur values(null,'martinmatin@gmail.com','123','Matin','Martin',null,2.5,'0621248481',null,null,'attente');
insert into client values(4,'martinmatin@gmail.com','123','Matin','Martin',null,null,'0621248481','18','place des roses','Paris','75010',null,null,null,'particulier',null);
insert into entreprise values(2,'les_restos_du_pancreas@gmail.com','123','Matho','Momo',null,null,'0123456788','24','avenue saint honore','Paris','75008','izgefibdkcsnjis165161','les restos du pancreas',null,'ambassadeur association','association',null);
insert into livreur values(1,'jean_dupont@gmail.com','123','dupont','jean',null,2.5,'0123456789',null,null,'attente');
insert into candidat values(1,'jean_dupont@gmail.com','123','dupont','jean',null,null,'0123456789','5','developpeur',null);
insert into candidat values(null,'eric_tang@gmail.com','123','Tang','Eric',null,null,'0178956789','7','reseau',null);
insert into planning values(null,'equipe developpement','https://equiplaning.com');
insert into employe values(null,'selimaouad@gmail.com','123','Aouad','Selim','0123456789','Developpeur',2500,'5','2022-05-25',null,'administrateur','1',null);
insert into categorie_produit values(null,'produit laitier','tout produit issu du lait');
insert into produit values(null,'yaourt aux fruits','yaourt aux fraises',null,'15 bis','rue des grands moulins','Paris','75013',0.5,0.1,30,null,1,3);
insert into enquete values(null,'test','enquete de test');
insert into sujet values(null,1,'question 1 note','ceci est une question note','note',null,1);
insert into sujet values(null,2,'question 2 note_image','ceci est une question note_image','note_image',null,1);
insert into sujet values(null,3,'question 3 qcm','ceci est une question qcm','qcm',"reponse_1|reponse_2|reponse_3|reponse_4",1);
insert into sujet values(null,4,'question 4 qcm_image','ceci est une question qcm_image','qcm_image',"reponse_1|reponse_2|reponse_3",1);
insert into sujet values(null,5,'question 5 qcu','ceci est une question qcu','qcu',"reponse_1|reponse_2|reponse_3|reponse_4",1);
insert into sujet values(null,6,'question 6 qcu_image','ceci est une question qcu_image','qcu_image',"reponse_1|reponse_2|reponse_3",1);
insert into sujet values(null,7,'question 7 note','ceci est une question note','note',null,1);
insert into sujet values(null,8,'question 8 note_image','ceci est une question note_image','note_image',null,1);
insert into sujet values(null,9,'question 9 qcm','ceci est une question qcm','qcm',"reponse_1|reponse_2",1);
insert into sujet values(null,10,'question 10 qcm_image','ceci est une question qcm_image','qcm_image',"reponse_1|reponse_2|reponse_3",1);
insert into sujet values(null,11,'question 11 qcu','ceci est une question qcu','qcu',"reponse_1|reponse_2",1);
insert into sujet values(null,12,'question 12 qcu_image','ceci est une question qcu_image','qcu_image',"reponse_1|reponse_2|reponse_3",1);
insert into enquete values(null,'Produits','Enquete sur  la qualite de nos produits');
insert into enquete values(null,'Service client','Enquete sur la qualite de notre service client');
insert into enquete values(null,'Regimes healthy','Enquete sur les nouveaux regimes healthy!');
insert into enquete values(null,'Amis des animaux','Enquete sur la qualite de la nourritures de nos petits compagnons');