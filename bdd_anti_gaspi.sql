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

,,,,,email,date_inscription,avatar,validation_inscription

create table utilisateur
(
	id_utilisateur int(5) not null,
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