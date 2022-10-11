drop database if exists bdd_anti_gaspi;
create database bdd_anti_gaspi;
	use bdd_anti_gaspi;

create table user_anti_gasp
(
	id int(5) not null auto_increment,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	fonction enum('client','entreprise','candidat','livreur','employe') not null,
	noteconfemp int(3) not null,
	droits enum('administrateur','collaborateur','visiteur','utilistateur') not null,
    primary key (id)
)engine=innodb;

create table sujet
(
	id_sujet int(5) not null auto_increment,
	libele varchar(100) not null UNIQUE,
	question varchar(255) not null,
    primary key (id_sujet)
)engine=innodb;


create table utilisateur
(
	id_utilisateur int(5) not null auto_increment,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    tel varchar(20) not null,
    email varchar(60) not null,
    date_inscription date not null,
    avatar varchar(255),
    valide enum('valide','invalide','attente') not null,
    primary key(id_utilisateur)
)engine=innodb;

create table client
(
	id_client int(5) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    tel varchar(20) not null,
    email varchar(60) not null,
    date_inscription date not null,
    avatar varchar(255),
    valide enum('valide','invalide','attente') not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    siren varchar(100),
    libele varchar(100),
    role_represenant varchar(100),
    type_cli enum('particulier','association','entreprise') not null,
    primary key(id_client)
)engine=innodb;

create table entreprise
(
	id_entreprise int(5) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    tel varchar(20) not null,
    email varchar(60) not null,
    date_inscription date not null,
    avatar varchar(255),
    valide enum('valide','invalide','attente') not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    siret varchar(100) not null,
    libele varchar(100) not null,
    notepublic decimal(3, 2),
    role_represenant varchar(100),
    type_ent varchar(255),
    primary key(id_entreprise)
)engine=innodb;


create table livreur 
(
	id_livreur int(5) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    tel varchar(20) not null,
    email varchar(60) not null,
    date_inscription date not null,
    avatar varchar(255),
    valide enum('valide','invalide','attente') not null,
    transport enum('velo','motocyclette','scooter') not null,
    notepublic decimal(3, 2),
    primary key(id_livreur)
)engine=innodb;

create table candidat 
(
	id_candidat int(5) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    tel varchar(20) not null,
    email varchar(60) not null,
    date_inscription date not null,
    avatar varchar(255),
    valide enum('valide','invalide','attente') not null,
    niveau_diplome varchar(100)not null,
    branche_metier varchar(100)not null,
    primary key(id_candidat)
)engine=innodb;

create table avis_enquete  
(
	id_avis_enquete int(5) not null auto_increment,
	reponse varchar(255) not null,
    note decimal(3, 2),
    id_sujet int(5) not null,
    id_utilisateur int(5) not null,
    primary key(id_avis_enquete),
    foreign key(id_sujet) references sujet(id_sujet)
    on update cascade
    on delete cascade,
    foreign key(id_utilisateur) references utilisateur(id_utilisateur)
    on update cascade
    on delete cascade
)engine=innodb;

create table images  
(
	id_images int(5) not null auto_increment,
	paths varchar(255) not null,
	lien varchar(255) not null,
    tables varchar(150) not null,
    id_objet int(5) not null,
    primary key(id_images),
    foreign key(id_objet) references objet(id_objet)
    on update cascade
    on delete cascade
)engine=innodb;

create table categorie_produit   
(
	id_cat int(5) not null auto_increment,
	libele varchar(255) not null,
	descriptions varchar(255) not null,
    primary key(id_cat)
)engine=innodb;

create table produit  
(
	id_prod int(5) not null auto_increment,
	libele varchar(255) not null,
	descriptions varchar(255) not null,
    regime_alim varchar(150) not null,
    adresse_depot varchar(255) not null,
    prix_base decimal(4, 2),
    reduction decimal(2, 2),
    poids_unite decimal(3, 2),
    note decimal(3, 2),
    id_cat int(5) not null,
    id_utilisateur int(5) not null,
    primary key(id_prod),
    foreign key(id_objet) references objet(id_objet)
    on update cascade
    on delete cascade
)engine=innodb;


create table commander  
(
    id_utilisateur int(5) not null,
    id_prod int(5) not null,
    id_livreur int(5) not null,
	dateheure_debut date not null,
	dateheure_fin date not null,
    primary key(id_utilisateur, id_prod, id_livreur, dateheure_debut),
    foreign key(id_utilisateur) references utilisateur(id_utilisateur)
    on update cascade
    on delete cascade,
    foreign key(id_prod) references produit(id_prod)
    on update cascade
    on delete cascade,
    foreign key(id_livreur) references livreur(id_livreur)
    on update cascade
    on delete cascade
)engine=innodb;

create table commentaire  
(
    id_commentaire int(5) not null auto_increment,
    id_utilisateur int(5) not null,
    id_objet int(5) not null,
	titre varchar(50) not null,
    texte varchar(255) not null,
    note decimal(3, 2) not null,
    tables varchar(50) not null,
    primary key(id_commentaire),
    foreign key(id_utilisateur) references utilisateur(id_utilisateur)
    on update cascade
    on delete cascade,
    foreign key(id_objet) references objet(id_objet)
    on update cascade
    on delete cascade
)engine=innodb;

create table categorie_metier   
(
    id_cat_met int(5) not null auto_increment,
    libele varchar(255) not null,
    descriptions varchar(255) not null,
    primary key(id_commentaire)
)engine=innodb;

create table metier  
(
    id_met int(5) not null auto_increment,
    id_cat_met int(5) not null,
    libele varchar(255) not null,
	niveau_salaire decimal(5, 2) not null,
    primary key(id_met),
    foreign key(id_cat_met) references categorie_metier(id_cat_met)
    on update cascade
    on delete cascade
)engine=innodb;

create table locaux   
(
    id_local int(5) not null auto_increment,
    nom varchar(255) not null,
    numrue int(2) not null,
    rue varchar(255) not null,
    ville varchar(255) not null,
    cp int(5) not null,
    primary key(id_local)
)engine=innodb;

create table poste  
(
    id_poste int(5) not null auto_increment,
    id_local int(5) not null,
    id_met int(5) not null,
	date_debut date not null,
	date_fin date not null,
	salaire_propose decimal(5, 2) not null,
    descriptions varchar(255) not null,
    primary key(id_poste),
    foreign key(id_local) references locaux(id_local)
    on update cascade
    on delete cascade,
    foreign key(id_met) references metier(id_met)
    on update cascade
    on delete cascade
)engine=innodb;

create table sites 
(
    id_sites int(5) not null auto_increment,
    libele varchar(100) not null,
    descriptif varchar(255) not null,
    adresse varchar(255) not null,
    primary key(id_sites)
)engine=innodb;

create table pages 
(
    id_pages int(5) not null auto_increment,
    id_sites int(5) not null,
    descriptif varchar(255) not null,
    urls varchar(255) not null,
    adresse varchar(255) not null,
    primary key(id_sites),
    foreign key(id_sites) references sites(id_sites)
    on update cascade
    on delete cascade
)engine=innodb;

create table composant  
(
    id_composant int(5) not null auto_increment,
    id_pages int(5) not null,
    titre varchar(255) not null,
    primary key(id_composant),
    foreign key(id_pages) references pages(id_pages)
    on update cascade
    on delete cascade
)engine=innodb;


create table donnees  
(
    id_data int(5) not null auto_increment,
    libele varchar(255) not null,
    types varchar(255) not null,
    valeur varchar(255) not null,
    primary key(id_data),
    foreign key(id_pages) references pages(id_pages)
    on update cascade
    on delete cascade
)engine=innodb;


create table enregister  
(
    id_composant int(5) not null,
    id_data int(5) not null,
    primary key (id_composant, id_data)
    foreign key(id_composant) references composant(id_composant)
    on update cascade
    on delete cascade,
    foreign key(id_data) references donnees(id_data)
    on update cascade
    on delete cascade
)engine=innodb;