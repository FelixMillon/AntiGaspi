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
    coor_banc varchar(255) not null,
    tel varchar(20) not null,
    primary key (id)
)engine=innodb;

create table enquete
(
    id_enquete int(5) not null auto_increment,
    libelle varchar(100) not null,
    description_enquete varchar(255) not null,
    primary key(id_enquete)
)

create table sujet
(
	id_sujet int(5) not null auto_increment,
	libelle varchar(100) not null UNIQUE,
	question varchar(255) not null,
    id_enquete int(5) not null,
    primary key (id_sujet),
    foreign key(id_enquete) references enquete(id_enquete)
    on update cascade
    on delete cascade
)engine=innodb;


create table consomateur
(
	id_consomateur int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    date_inscription date not null,
	noteconfemp int(3) not null,
    tel varchar(20) not null,
    valide enum('valide','invalide','attente') not null,
    primary key (id_consomateur)
)engine=innodb;

create table client
(
	id_client int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    date_inscription date not null,
	noteconfemp int(3) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    siren varchar(100),
    libelle varchar(100),
    role_represenant varchar(100),
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
	coor_banc varchar(255) not null,
    date_inscription date not null,
	noteconfemp int(3) not null,
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

create table livreur
(
	id_livreur int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    date_inscription date not null,
	noteconfemp int(3) not null,
    tel varchar(20) not null,
    transport enum('utilitaire','voiture','velo','motocyclette','scooter','aucun') not null,
    energie_transport enum('essence','diesel','biocarburant','electrique','hybride'),
    notepublic decimal(3, 2),
    valide enum('valide','invalide','attente') not null,
    primary key (id_livreur)
)engine=innodb;

create table candidat
(
	id_candidat int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
	coor_banc varchar(255) not null,
    date_inscription date not null,
	noteconfemp int(3) not null,
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
)

create table manager
(
	id_manager int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(40) not null,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    coor_banc varchar(255) not null,
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
    coor_banc varchar(255) not null,
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
    id_consomateur int(5) not null,
    primary key(id_avis_enquete),
    foreign key(id_sujet) references sujet(id_sujet)
    on update cascade
    on delete cascade,
    foreign key(id_consomateur) references consomateur(id_consomateur)
    on update cascade
    on delete cascade
)engine=innodb;

create table categorie_produit   
(
	id_categorie int(5) not null auto_increment,
	libelle varchar(100) not null,
	descriptions varchar(255) not null,
    primary key(id_categorie)
)engine=innodb;

create table produit
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

create table image_site
(
	id_image int(5) not null auto_increment,
	path_image varchar(255) not null,
	url_image varchar(255) not null,
    id_produit int(5),
    id_utilisateur int(5),
    primary key(id_image),
    foreign key(id_produit) references produit(id_produit)
    on update cascade
    on delete cascade,
    foreign key(id_utilisateur) references utilisateur(id_utilisateur)
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
    id_consomateur_source int(5) not null,
    id_consomateur_cible int(5),
    id_produit int(5),
    primary key(id_commentaire),
    foreign key(id_consomateur_source) references consomateur(id_consomateur)
    on update cascade
    on delete cascade,
    foreign key(id_consomateur_cible) references consomateur(id_consomateur)
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
    descriptions varchar(255) not null,
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
    descriptions varchar(255) not null,
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

create table siteweb
(
    id_site int(5) not null auto_increment,
    libelle varchar(100) not null,
    descriptif varchar(255) not null,
    url_site varchar(255) not null,
    primary key(id_site)
)engine=innodb;

create table page_site
(
    id_page int(5) not null auto_increment,
    descriptif varchar(255) not null,
    url_page varchar(255) not null,
    id_site int(5) not null,
    primary key(id_page),
    foreign key(id_site) references siteweb(id_site)
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
    foreign key(id_page) references page_site(id_page)
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
    foreign key(id_utilisateur) references utilisateur(id_utilisateur)
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

drop trigger if exists utilisateurs_after_insert;
delimiter // 
create trigger utilisateurs_after_insert 
after insert on utilisateurs
for each row
begin
if 'haute' in (select saison from saison where new.date_dr between debut_saison and fin_saison)
		then set new.saison='haute';
elseif 'moyenne' in (select saison from saison where new.date_dr between debut_saison and fin_saison)
		then set new.saison='moyenne';
	end if;
insert into user values (concat(new.idc,'|cli'),concat(new.mail_c,'|cli'),new.mdp_c);

end //
delimiter ;