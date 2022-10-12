drop database if exists bdd_anti_gaspi;
create database bdd_anti_gaspi;
	use bdd_anti_gaspi;

create table anti_gasp_users
(
	id int(5) not null auto_increment,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	fonction enum('client','entreprise','candidat','livreur','employe') not null,
	noteconfemp int(3) not null,
	droits enum('administrateur','developpeur','collaborateur','consultant','invite','client') not null,
    primary key (id)
)engine=innodb;

create table sujets
(
	id_sujet int(5) not null auto_increment,
	libelle varchar(100) not null UNIQUE,
	question varchar(255) not null,
    primary key (id_sujet)
)engine=innodb;


create table utilisateurs
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

create table clients
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
    libelle varchar(100),
    role_represenant varchar(100),
    type_cli enum('particulier','association','entreprise') not null,
    primary key(id_client)
)engine=innodb;

create table entreprises
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
    libelle varchar(100) not null,
    notepublic decimal(3, 2),
    role_represenant varchar(100),
    type_ent varchar(255),
    primary key(id_entreprise)
)engine=innodb;


create table livreurs
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
    transport enum('utilitaire','voiture','velo','motocyclette','scooter','aucun') not null,
    energie_transport enum('essence','diesel','biocarburant','electrique','hybride'),
    notepublic decimal(3, 2),
    primary key(id_livreur)
)engine=innodb;

create table candidats
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
    foreign key(id_sujet) references sujets(id_sujet)
    on update cascade
    on delete cascade,
    foreign key(id_utilisateur) references utilisateurs(id_utilisateur)
    on update cascade
    on delete cascade
)engine=innodb;

create table categorie_produit   
(
	id_cat int(5) not null auto_increment,
	libelle varchar(100) not null,
	descriptions varchar(255) not null,
    primary key(id_cat)
)engine=innodb;

create table produits
(
	id_produit int(5) not null auto_increment,
	libelle varchar(100) not null,
	descriptions varchar(255) not null,
    regime_alim enum('crudivore','vegan','vegetalien','vegetarien','glutenfree'),
    numrue_depot varchar(50) not null,
    rue_depot varchar(100) not null,
    ville_depot varchar(100) not null,
    cp_depot varchar(10) not null,
    prix_base decimal(5, 2),
    reduction decimal(2, 2),
    poids_unite decimal(6, 2),
    note decimal(3, 2),
    id_cat int(5) not null,
    id_utilisateur int(5) not null,
    primary key(id_produit),
    foreign key(id_cat) references categorie_produit(id_cat)
    on update cascade
    on delete cascade,
    foreign key(id_utilisateur) references utilisateurs(id_utilisateur)
    on update cascade
    on delete cascade
)engine=innodb;

create table images
(
	id_image int(5) not null auto_increment,
	path_image varchar(255) not null,
	url_image varchar(255) not null,
    id_produit int(5),
    id_utilisateur int(5),
    primary key(id_image),
    foreign key(id_produit) references produits(id_produit)
    on update cascade
    on delete cascade,
    foreign key(id_utilisateur) references utilisateurs(id_utilisateur)
    on update cascade
    on delete cascade
)engine=innodb;


create table commander  
(
    id_utilisateur int(5) not null,
    id_produit int(5) not null,
    id_livreur int(5),
	dateheure_debut datetime not null,
	dateheure_fin_reel datetime,
    dateheure_fin_estimee datetime,
    primary key(id_utilisateur, id_produit, id_livreur, dateheure_debut),
    foreign key(id_utilisateur) references utilisateurs(id_utilisateur)
    on update cascade
    on delete cascade,
    foreign key(id_produit) references produits(id_produit)
    on update cascade
    on delete cascade,
    foreign key(id_livreur) references livreurs(id_livreur)
    on update cascade
    on delete cascade
)engine=innodb;

create table commentaires  
(
    id_commentaire int(5) not null auto_increment,
	titre varchar(50) not null,
    texte varchar(255) not null,
    note decimal(3, 2) not null,
    id_utilisateur_source int(5) not null,
    id_utilisateur_cible int(5),
    id_produit int(5),
    primary key(id_commentaire),
    foreign key(id_utilisateur_source) references utilisateurs(id_utilisateur)
    on update cascade
    on delete cascade,
    foreign key(id_utilisateur_cible) references utilisateurs(id_utilisateur)
    on update cascade
    on delete cascade,
    foreign key(id_produit) references produits(id_produit)
    on update cascade
    on delete cascade
)engine=innodb;

create table categorie_metier   
(
    id_cat_met int(5) not null auto_increment,
    libelle varchar(100) not null,
    descriptions varchar(255) not null,
    primary key(id_cat_met)
)engine=innodb;

create table metiers
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

create table postes
(
    id_poste int(5) not null auto_increment,
    libelle varchar(100) not null,
	date_debut date not null,
	date_fin date,
	salaire_propose decimal(5, 2) not null,
    descriptions varchar(255) not null,
    type_poste enum('cdi','cdd','contrat_prestation'),
    id_local int(5) not null,
    id_met int(5) not null,
    primary key(id_poste),
    foreign key(id_local) references locaux(id_local)
    on update cascade
    on delete cascade,
    foreign key(id_met) references metiers(id_met)
    on update cascade
    on delete cascade
)engine=innodb;

create table sites 
(
    id_site int(5) not null auto_increment,
    libelle varchar(100) not null,
    descriptif varchar(255) not null,
    url_site varchar(255) not null,
    primary key(id_site)
)engine=innodb;

create table pages 
(
    id_page int(5) not null auto_increment,
    descriptif varchar(255) not null,
    url_page varchar(255) not null,
    id_site int(5) not null,
    primary key(id_page),
    foreign key(id_site) references sites(id_site)
    on update cascade
    on delete cascade
)engine=innodb;

create table composants
(
    id_composant int(5) not null auto_increment,
    type_composant enum('article','graphique','tableau','camembert'),
    titre varchar(255) not null,
    id_page int(5) not null,
    primary key(id_composant),
    foreign key(id_page) references pages(id_page)
    on update cascade
    on delete cascade
)engine=innodb;


create table donnees  
(
    id_data int(5) not null auto_increment,
    libelle varchar(100) not null,
    type_data enum('int','float','dict','list','bool','str') not null,
    valeur varchar(255) not null,
    id_composant int(5),
    primary key(id_data),
    foreign key(id_composant) references composants(id_composant)
    on update cascade
    on delete cascade
)engine=innodb;


create table enregister  
(
    id_composant int(5) not null,
    id_data int(5) not null,
    primary key (id_composant, id_data),
    foreign key(id_composant) references composants(id_composant)
    on update cascade
    on delete cascade,
    foreign key(id_data) references donnees(id_data)
    on update cascade
    on delete cascade
)engine=innodb;