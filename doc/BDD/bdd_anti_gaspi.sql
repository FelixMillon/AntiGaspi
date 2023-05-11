drop database if exists bdd_anti_gaspi;
create database bdd_anti_gaspi;
	use bdd_anti_gaspi;

create table utilisateur
(
	id int(5) not null auto_increment,
	email varchar(60) not null UNIQUE,
	mdp varchar(100) not null,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
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
	mdp varchar(100) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(5, 2) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    valide enum('valide','invalide','attente') not null,
    primary key (id_consommateur)
)engine=innodb;

create table client
(
	id_client int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(100) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(5, 2) not null,
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
	mdp varchar(100) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(5, 2) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    siret varchar(100) not null,
    libelle varchar(100) not null,
    notepublic decimal(5, 2),
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
	poids_max decimal(8,2) not null,
    annee_fabrication date not null,
    volume decimal(5,2) not null,
	energie enum('essence','diesel','biocarburant','electrique','hybride','mecanique') not null,
    cons_100_km decimal(5,2) not null,
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
	mdp varchar(100) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(5, 2) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    id_vehicule int(5),
    notepublic decimal(5, 2),
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
	mdp varchar(100) not null,
	nom varchar(100) not null,
    prenom varchar(100) not null,
    date_inscription date not null,
	noteconfemp decimal(5, 2) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
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

create table avis_enquete  
(
	id_avis_enquete int(5) not null auto_increment,
	reponse varchar(255) not null,
    ville varchar(255),
    tranche_age varchar(255),
    civilite enum('Monsieur','Madame','Autres'),
    note decimal(5, 2),
    id_enquete int(5) not null,
    id_consommateur int(5),
    primary key(id_avis_enquete),
    foreign key(id_enquete) references enquete(id_enquete)
    on update cascade
    on delete cascade,
    foreign key(id_consommateur) references consommateur(id_consommateur)
    on update cascade
    on delete cascade
)engine=innodb;

create table avis_sujet
(
	id_avis_sujet int(5) not null auto_increment,
    note decimal(5, 2),
    id_sujet int(5) not null,
    id_consommateur int(5),
    primary key(id_avis_sujet),
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
    prix_base decimal(7, 2),
    reduction decimal(4, 2),
    poids_unite decimal(8, 2),
    note decimal(5, 2),
    quantite int(4),
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
    id_client int(5) not null,
	dateheure_debut datetime not null,
	dateheure_fin_reel datetime,
    dateheure_fin_estimee datetime,
    primary key(id_commande,dateheure_debut),
    foreign key(id_livreur) references livreur(id_livreur)
    on update cascade
    on delete cascade
)engine=innodb;

create table commenter  
(
    id_commande int(5) not null,
    id_livreur int(5) not null,
    note int(1) not null,
    commentaire varchar(255) not null,
    primary key(id_commande,id_livreur),
    foreign key(id_livreur) references livreur(id_livreur),
    foreign key(id_commande) references commande(id_commande)
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
    note decimal(5, 2) not null,
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
	niveau_salaire decimal(7, 2) not null,
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


create table manager
(
	id_manager int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(100) not null,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    fonction varchar(255) not null,
    salaire decimal(7,2) not null,
    niveau_diplome varchar(100) not null,
    date_embauche date not null,
    date_depart date,
    droits enum('administrateur','developpeur','collaborateur','consultant','invite','client','administrateur_rh','rh') not null,
    niveau_manager varchar(100) not null,
    id_planning int(5) not null,
    id_manager_sup int(5),
    id_local int(5),
    primary key (id_manager),
    foreign key(id_manager_sup) references manager(id_manager)
    on update cascade
    on delete cascade,
    foreign key(id_planning) references planning(id_planning)
    on update cascade
    on delete cascade,
    foreign key(id_local) references locaux(id_local)
    on update cascade
    on delete cascade
)engine=innodb;

create table employe
(
	id_employe int(5) not null,
	email varchar(60) not null UNIQUE,
	mdp varchar(100) not null,
    nom varchar(50) not null,
    prenom varchar(50) not null,
    tel varchar(20) not null,
    rue varchar(100) not null,
    numrue varchar(50) not null,
    ville varchar(100) not null,
    cp varchar(10) not null,
    fonction varchar(255) not null,
    salaire decimal(7,2) not null,
    niveau_diplome varchar(100) not null,
    date_embauche date not null,
    date_depart date,
    droits enum('administrateur','developpeur','collaborateur','consultant','invite','client','administrateur_rh','rh') not null,
    id_planning int(5) not null,
    id_manager int(5),
    id_local int(5),
    primary key (id_employe),
    foreign key(id_manager) references manager(id_manager)
    on update cascade
    on delete cascade,
    foreign key(id_planning) references planning(id_planning)
    on update cascade
    on delete cascade,
    foreign key(id_local) references locaux(id_local)
    on update cascade
    on delete cascade
)engine=innodb;

create table poste
(
    id_poste int(5) not null auto_increment,
    libelle varchar(100) not null,
	date_debut date not null,
	date_fin date,
	salaire_propose decimal(7, 2) not null,
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

create table cv
(
    id_cv int(5) not null auto_increment,
    path_cv varchar(255),
    url_cv varchar(255),
    id_candidat int(5),
    primary key(id_cv),
    foreign key(id_candidat) references candidat(id_candidat)
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

create table candidater
(
    id_candidat int(5) not null,
    id_poste int(5) not null,
    date_candidature date not null,
    date_cloture date,
    etat enum('admis','refuse','attente') not null,
    primary key (id_candidat,id_poste,date_candidature),
    foreign key(id_poste) references poste(id_poste)
    on update cascade
    on delete cascade,
    foreign key(id_candidat) references utilisateur(id)
    on update cascade
    on delete cascade
)engine=innodb;

create table demande_rh
(
    id_demande_rh int(5) not null auto_increment,
    libelle varchar(100) not null,
    objet varchar(2000) not null,
    requete_sql varchar(2000),
    date_demande datetime not null,
    date_resolution datetime,
    etat enum("attente","refuse","accepte"),
    id_employe int(5) not null,
    id_manager int(5),
    primary key (id_demande_rh),
    foreign key(id_employe) references employe(id_employe)
    on update cascade
    on delete cascade,
    foreign key(id_manager) references manager(id_manager)
    on update cascade
    on delete cascade
)engine=innodb;

create table archi_demande_rh
(
    id_demande_rh int(5) not null auto_increment,
    libelle varchar(100) not null,
    objet varchar(2000) not null,
    requete_sql varchar(2000),
    date_demande datetime not null,
    date_resolution datetime,
    etat enum("attente","refuse","accepte"),
    id_employe int(5) not null,
    id_manager int(5),
    primary key (id_demande_rh)
)engine=innodb;

create table demande_autre
(
    id_demande_autre int(5) not null auto_increment,
    libelle varchar(100) not null,
    description varchar(255) not null,
    date_demande datetime not null,
    date_resolution datetime,
    etat enum("attente","refuse","accepte"),
    id_employe int(5) not null,
    id_manager int(5),
    primary key (id_demande_autre),
    foreign key(id_employe) references employe(id_employe)
    on update cascade
    on delete cascade,
    foreign key(id_manager) references manager(id_manager)
    on update cascade
    on delete cascade
)engine=innodb;

create table categorie_article
(
    id_cat_art int(5) not null auto_increment,
    libelle varchar(100) not null,
    description varchar(255) not null,
    primary key (id_cat_art)
)engine=innodb;

create table article
(
    id_article int(5) not null auto_increment,
    titre varchar(100) not null,
    sous_titre varchar(100) not null,
    contenu varchar(5000) not null,
    id_cat_art int(5) not null,
    id_auteur int(5) not null,
    primary key (id_article),
    foreign key(id_cat_art) references categorie_article(id_cat_art)
    on update cascade
    on delete cascade,
    foreign key(id_auteur) references employe(id_employe)
    on update cascade
    on delete cascade
)engine=innodb;

create table contenu
(
    id_contenu int(5) not null auto_increment,
    numero int(5) not null,
    contenu varchar(255) not null,
    id_article int(5) not null,
    primary key (id_contenu),
    foreign key(id_article) references article(id_article)
    on update cascade
    on delete cascade
)engine=innodb;

create table felix_c_est_le_chef_de_la_bdd
(
    id_truc int(5) not null auto_increment,
    primary key(id_truc)
);

create table badgeage
(
    id_badgeage int(5) not null auto_increment,
    date_heure datetime not null,
    type enum('entree','sortie') not null,
    id_employe int(5) not null,
    primary key (id_badgeage),
    foreign key(id_employe) references employe(id_employe)
    on update cascade
    on delete cascade
)engine=innodb;

/***********************************************VUES********************************************************/

create or replace view vCandidater as (
      select  C.id_candidat, C.id_poste, CD.prenom, CD.nom,  P.libelle, L.ville, L.cp, P.type_poste, P.date_debut, P.date_fin, C.etat, 
        C.date_candidature, C.date_cloture
        from candidater C, poste P, locaux L,candidat CD
        where P.id_local = L.id_local and C.id_poste = P.id_poste  and C.id_candidat = CD.id_candidat
);

create or replace view vEmployemanager as (
      select M.*, ifnull(E.prenom,"aucun") as prenom_manager, ifnull(E.nom,"aucun") as nom_manager 
        from  employe M
        LEFT JOIN employe E ON M.id_manager = E.id_employe
);

create or replace view vEmploye as (
      select E.*, ifnull(L.nom,"nomade") as nom_local
        from  locaux L
        RIGHT JOIN vEmployemanager E on L.id_local = E.id_local
);

create or replace view VDemande_autre as (
      select D.*, E.Nom as NomE, E.prenom as prenomE, E.prenom_manager, E.nom_manager
        from Demande_autre D, vEmploye E
        where D.id_employe = E.id_employe
);

create or replace view VDemande_rh as (
      select D.*, E.Nom as NomE, E.prenom as prenomE, E.prenom_manager, E.nom_manager
        from Demande_rh D, vEmploye E
        where D.id_employe = E.id_employe
);

create or replace view Vmanager as(
    select m.email, m.mdp, m.nom, m.prenom,
    m.rue, m.tel, m.numrue, m.ville,
    m.fonction, m.salaire, m.niveau_diplome,
    m.date_embauche, m.date_depart, m.droits,
    m.id_planning,m.id_manager_sup,e.prenom_manager as prenom_m_sup,
    e.nom_manager as nom_m_sup, m.id_local, e.nom_local
    from manager m, vemploye e
    where m.id_manager = e.id_employe
);

create or replace view VGerer as (
    select G.*, E.nom as nom_emp, E.prenom as prenom_emp, U.nom as nom_user, U.prenom as prenom_user
    from Gerer G, Employe E, Utilisateur U
    where G.id_utilisateur = U.id and G.id_employe = E.id_Employe
);

create or replace view VBadgeage as (
    select B.*, E.nom, E.prenom
    from Badgeage B, Employe E
    where B.id_employe = E.id_employe
);

create or replace view Varticle as (
    select a.id_article, a.titre, a.sous_titre, a.contenu, a.id_cat_art, C.libelle as categorie,a.id_auteur id_employe, concat(e.prenom," ",e.nom) as auteur
    from article a, categorie_article c, employe e
    where a.id_auteur = e.id_employe and a.id_cat_art = c.id_cat_art
);

create or replace view vposte as (
      select  P.id_poste, 
        P.libelle libelle_poste,
        P.date_debut,
        P.date_fin,
        P.salaire_propose,
        P.description,
        P.type_poste,
        P.id_local,
        L.nom,
        L.numrue,
        L.rue,
        L.ville,
        L.cp,
        M.id_met,
        M.libelle libelle_metier,
        M.niveau_salaire,
        CM.id_cat_met,
        CM.libelle libelle_cat_metier,
        CM.description description_cat_metier
        from poste P, locaux L, metier M, categorie_metier CM
        where 
        P.id_met = M.id_met
        and P.id_local = L.id_local
        and M.id_cat_met = CM.id_cat_met
);

create or replace view viewmoyparenquete as (
select avg(a.note) as moyenne, a.id_enquete, (select libelle from enquete where id_enquete = a.id_enquete) as libelle
from avis_enquete a
group by a.id_enquete);

create or replace view viewmpartparenquete as (
select count(id_avis_enquete) as nb, a.id_enquete, (select libelle from enquete where id_enquete = a.id_enquete) as libelle
from avis_enquete a
group by a.id_enquete);

create or replace view viewmoypartrancheage as (
select avg(note) as nb, tranche_age
from avis_enquete
group by tranche_age);

create or replace view viewcountpartrancheage as (
select count(id_avis_enquete) as nb, tranche_age
from avis_enquete
group by tranche_age);

create or replace view viewmoyparville as (
select avg(note) as nb, ville
from avis_enquete
group by ville);

create or replace view viewcountparville as (
select count(id_avis_enquete) as nb, ville
from avis_enquete
group by ville);

create or replace view viewcountparcivil as (
select avg(note)as nb, civilite
from avis_enquete
group by civilite);

create or replace view viewmoyparcivil as (
select count(id_avis_enquete) as nb, civilite
from avis_enquete
group by civilite);

create or replace view viewcountparageenquete as (
select avg(a.note)as nb, a.tranche_age, a.id_enquete, (select libelle from enquete where id_enquete = a.id_enquete) as libelle
from avis_enquete a
group by a.tranche_age, a.id_enquete
order by a.id_enquete);

create or replace view viewmoyparageenquete as (
select count(a.id_avis_enquete) as nb, a.tranche_age, a.id_enquete, (select libelle from enquete where id_enquete = a.id_enquete) as libelle
from avis_enquete a
group by a.tranche_age, a.id_enquete
order by a.id_enquete);

create or replace view viewarticlecountparcat as(
    select c.libelle, count(a.id_article) as nb
    from categorie_article c
    left join article a on a.id_cat_art = c.id_cat_art
    group by c.id_cat_art
);


create or replace view demande_autre_resolu_par_mois
as(
    select 
    year(date_resolution) as Annee,
    sum(case when month(date_resolution) = 1 then 1 else 0 end) as Janvier,
    sum(case when month(date_resolution) = 2 then 1 else 0 end) as Fevrier,
    sum(case when month(date_resolution) = 3 then 1 else 0 end) as Mars,
    sum(case when month(date_resolution) = 4 then 1 else 0 end) as Avril,
    sum(case when month(date_resolution) = 5 then 1 else 0 end) as Mai,
    sum(case when month(date_resolution) = 6 then 1 else 0 end) as Juin,
    sum(case when month(date_resolution) = 7 then 1 else 0 end) as Juillet,
    sum(case when month(date_resolution) = 8 then 1 else 0 end) as Aout,
    sum(case when month(date_resolution) = 9 then 1 else 0 end) as Septembre,
    sum(case when month(date_resolution) = 10 then 1 else 0 end) as Octobre,
    sum(case when month(date_resolution) = 11 then 1 else 0 end) as Novembre,
    sum(case when month(date_resolution) = 12 then 1 else 0 end) as Decembre,
    count(*) as Total
    from demande_autre
    where date_resolution is not null
    group by year(date_resolution)
);

/*reate or replace view demande_autre_resolu_par_mois
as(
    select 
    year(date_resolution) as Annee,
    sum(case when month(date_resolution) = 1 then 1 else 0 end) as Janvier,
    sum(case when month(date_resolution) = 2 then 1 else 0 end) as Fevrier,
    sum(case when month(date_resolution) = 3 then 1 else 0 end) as Mars,
    sum(case when month(date_resolution) = 4 then 1 else 0 end) as Avril,
    sum(case when month(date_resolution) = 5 then 1 else 0 end) as Mai,
    sum(case when month(date_resolution) = 6 then 1 else 0 end) as Juin,
    sum(case when month(date_resolution) = 7 then 1 else 0 end) as Juillet,
    sum(case when month(date_resolution) = 8 then 1 else 0 end) as Aout,
    sum(case when month(date_resolution) = 9 then 1 else 0 end) as Septembre,
    sum(case when month(date_resolution) = 10 then 1 else 0 end) as Octobre,
    sum(case when month(date_resolution) = 11 then 1 else 0 end) as Novembre,
    sum(case when month(date_resolution) = 12 then 1 else 0 end) as Decembre,
    count(*) as Total
    from demande_autre
    where date_resolution is not null
    group by year(date_resolution)
    with rollup 
);*/

create or replace view demande_RH_resolu_par_mois
as(
    select 
    year(date_resolution) as Annee,
    sum(case when month(date_resolution) = 1 then 1 else 0 end) as Janvier,
    sum(case when month(date_resolution) = 2 then 1 else 0 end) as Fevrier,
    sum(case when month(date_resolution) = 3 then 1 else 0 end) as Mars,
    sum(case when month(date_resolution) = 4 then 1 else 0 end) as Avril,
    sum(case when month(date_resolution) = 5 then 1 else 0 end) as Mai,
    sum(case when month(date_resolution) = 6 then 1 else 0 end) as Juin,
    sum(case when month(date_resolution) = 7 then 1 else 0 end) as Juillet,
    sum(case when month(date_resolution) = 8 then 1 else 0 end) as Aout,
    sum(case when month(date_resolution) = 9 then 1 else 0 end) as Septembre,
    sum(case when month(date_resolution) = 10 then 1 else 0 end) as Octobre,
    sum(case when month(date_resolution) = 11 then 1 else 0 end) as Novembre,
    sum(case when month(date_resolution) = 12 then 1 else 0 end) as Decembre,
    count(*) as Total
    from archi_demande_rh
    group by year(date_resolution)
);

/*****************************PROCEDURES********************************/

drop procedure if exists insertavis;
DELIMITER //
CREATE PROCEDURE insertavis
(IN unenote decimal(5,2), unnumquestion int, IN unid_enquete int, IN id_consommateur int)
BEGIN
DECLARE unid_sujet int(5);
set unid_sujet = (select id_sujet from sujet where id_enquete = unid_enquete and numquestion = unnumquestion);
insert into avis_sujet values(null,unenote,unid_sujet,id_consommateur);
END //
DELIMITER ;

drop procedure if exists recursemanager;
DELIMITER // 
create procedure recursemanager(
    in le_id_user int(5)
)
BEGIN
WITH RECURSIVE manager_tree AS (
    SELECT * FROM vemploye WHERE id_employe = le_id_user
    UNION ALL
    SELECT e.*
    FROM vemploye e, manager_tree WHERE e.id_manager = manager_tree.id_employe
)
SELECT * FROM manager_tree;

END //
DELIMITER ;

drop procedure if exists recursedemande_rh;
DELIMITER // 
create procedure recursedemande_rh(
    in le_id_user int(5)
)
BEGIN

select * from vdemande_rh where id_employe in (
WITH RECURSIVE manager_tree AS (
    SELECT id_employe FROM employe WHERE id_employe = le_id_user
    UNION ALL
    SELECT e.id_employe
    FROM employe e, manager_tree WHERE e.id_manager = manager_tree.id_employe
)
SELECT * FROM manager_tree);

END //
DELIMITER ;

drop procedure if exists recursedemande_autre;
DELIMITER // 
create procedure recursedemande_autre(
    in le_id_user int(5)
)
BEGIN

select * from vdemande_autre where id_employe in (
WITH RECURSIVE manager_tree AS (
    SELECT id_employe FROM employe WHERE id_employe = le_id_user
    UNION ALL
    SELECT e.id_employe
    FROM employe e, manager_tree WHERE e.id_manager = manager_tree.id_employe
)
SELECT * FROM manager_tree);

END //
DELIMITER ;

drop procedure if exists recursebadgeage;
DELIMITER // 
create procedure recursebadgeage(
    in le_id_user int(5)
)
BEGIN

select * from vbadgeage where id_employe in (
WITH RECURSIVE manager_tree AS (
    SELECT id_employe FROM employe WHERE id_employe = le_id_user
    UNION ALL
    SELECT e.id_employe
    FROM employe e, manager_tree WHERE e.id_manager = manager_tree.id_employe
)
SELECT * FROM manager_tree);

END //
DELIMITER ;

/****************************TRIGGERS SUR UTILISATEUR************************************/

drop trigger if exists utilisateur_after_update;
delimiter // 
create trigger utilisateur_after_update 
after update on utilisateur
for each row
begin
    update consommateur set id_consommateur=new.id,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,tel=new.tel,rue=new.rue,numrue=new.numrue,ville=new.ville,cp=new.cp where id_consommateur=old.id;
end //
delimiter ;


/*******************************TRIGGERS SUR CONSOMMATEUR****************************************/
drop trigger if exists consommateur_before_insert;
delimiter // 
create trigger consommateur_before_insert 
before insert on consommateur
for each row
begin
    insert into utilisateur values(null,new.email,new.mdp,new.nom,new.prenom,new.tel,new.rue,new.numrue,new.ville,new.cp);
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

drop trigger if exists consommateur_after_update;
delimiter // 
create trigger consommateur_after_update 
after update on consommateur
for each row
begin
    update client set id_client=new.id_consommateur,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,noteconfemp=new.noteconfemp,tel=new.tel,rue=new.rue,numrue=new.numrue,ville=new.ville,cp=new.cp,valide=new.valide where id_client=old.id_consommateur;
    update entreprise set id_entreprise=new.id_consommateur,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,noteconfemp=new.noteconfemp,tel=new.tel,rue=new.rue,numrue=new.numrue,ville=new.ville,cp=new.cp,valide=new.valide where id_entreprise=old.id_consommateur;
    update livreur set id_livreur=new.id_consommateur,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,noteconfemp=new.noteconfemp,tel=new.tel,rue=new.rue,numrue=new.numrue,ville=new.ville,cp=new.cp,valide=new.valide where id_livreur=old.id_consommateur;
    update candidat set id_candidat=new.id_consommateur,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,noteconfemp=new.noteconfemp,tel=new.tel,rue=new.rue,numrue=new.numrue,ville=new.ville,cp=new.cp,valide=new.valide where id_candidat=old.id_consommateur;
end //
delimiter ;

/*****************************TRIGGERS SUR EMPLOYE***********************************/

drop trigger if exists employe_before_insert;
delimiter // 
create trigger employe_before_insert 
before insert on employe
for each row
begin
    declare numdep varchar(5);
    if new.id_local is null
        then set numdep = "00";
        else
            set numdep = (select left(cp,2) from locaux where id_local = new.id_local);
    end if;
    set new.email = concat(lower(REPLACE(left(new.prenom,1), ' ', '_')),lower(REPLACE(left(new.nom,3), ' ', '_')),numdep,".",((MONTH(curdate())-1)*30+day(curdate())),"@firecrest.com");
    insert into utilisateur values(null,new.email,new.mdp,new.nom,new.prenom,new.tel,new.rue,new.numrue,new.ville,new.cp);
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

/****************************TRIGGERS SUR CLIENT************************************/

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
        insert into consommateur values(null,new.email,new.mdp,new.nom,new.prenom,new.date_inscription,new.noteconfemp,new.tel,new.rue,new.numrue,new.ville,new.cp,new.valide);
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
        set new.rue = (select rue from consommateur where email=new.email);
        set new.numrue = (select numrue from consommateur where email=new.email);
        set new.ville = (select ville from consommateur where email=new.email);
        set new.cp = (select cp from consommateur where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "le consommateur n'existe pas impossible de lui attribuer un nouveau role";
    end if;
end //
delimiter ;

/****************************TRIGGERS SUR CANDIDAT************************************/

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
        insert into consommateur values(null,new.email,new.mdp,new.nom,new.prenom,new.date_inscription,new.noteconfemp,new.tel,new.rue,new.numrue,new.ville,new.cp,new.valide);
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
        set new.rue = (select rue from consommateur where email=new.email);
        set new.numrue = (select numrue from consommateur where email=new.email);
        set new.ville = (select ville from consommateur where email=new.email);
        set new.cp = (select cp from consommateur where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "le consommateur n'existe pas impossible de lui attribuer un nouveau role";
    end if;
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

/****************************TRIGGERS SUR ENTREPRISE************************************/

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
        insert into consommateur values(null,new.email,new.mdp,new.nom,new.prenom,new.date_inscription,new.noteconfemp,new.tel,new.rue,new.numrue,new.ville,new.cp,new.valide);
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
        set new.rue = (select rue from consommateur where email=new.email);
        set new.numrue = (select numrue from consommateur where email=new.email);
        set new.ville = (select ville from consommateur where email=new.email);
        set new.cp = (select cp from consommateur where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "le consommateur n'existe pas impossible de lui attribuer un nouveau role";
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

/****************************TRIGGERS SUR LIVREUR************************************/

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
        insert into consommateur values(null,new.email,new.mdp,new.nom,new.prenom,new.date_inscription,new.noteconfemp,new.tel,new.rue,new.numrue,new.ville,new.cp,new.valide);
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
        set new.rue = (select rue from consommateur where email=new.email);
        set new.numrue = (select numrue from consommateur where email=new.email);
        set new.ville = (select ville from consommateur where email=new.email);
        set new.cp = (select cp from consommateur where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "le consommateur n'existe pas impossible de lui attribuer un nouveau role";
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

/****************************TRIGGERS SUR EMPLOYE*********************************/

delimiter // 
create trigger employe_after_update 
after update on employe
for each row
begin
    update utilisateur set id=new.id_employe,email=new.email,mdp=new.mdp,nom=new.nom,prenom=new.prenom,tel=new.tel,rue=new.rue,numrue=new.numrue,ville=new.ville,cp=new.cp where id=old.id_employe;
        update manager set 
        id_manager=new.id_employe,
        email=new.email,
        mdp=new.mdp,
        nom=new.nom,
        prenom=new.prenom,
        tel=new.tel,
        rue=new.rue,
        numrue=new.numrue,
        ville=new.ville,
        cp=new.cp,
        fonction=new.fonction,
        salaire=new.salaire,
        niveau_diplome=new.niveau_diplome,
        date_embauche=new.date_embauche,
        date_depart=new.date_depart,
        droits=new.droits,
        id_planning=new.id_planning,
        id_manager_sup=new.id_manager,
        id_local=new.id_local
    where id_manager=old.id_employe;
end //
delimiter ;

/****************************TRIGGERS SUR MANAGER************************************/

drop trigger if exists manager_before_insert;
delimiter // 
create trigger manager_before_insert 
before insert on manager
for each row
begin
    declare numdep varchar(5);
    if new.id_local is null
        then set numdep = "00";
        else
            set numdep = (select left(cp,2) from locaux where id_local = new.id_local);
    end if;
    if new.id_manager is null
    then
        set new.email = concat(lower(left(new.prenom,1)),lower(left(new.nom,3)),numdep,".",((MONTH(curdate())-1)*30+day(curdate())),"@firecrest.com");
        set new.date_embauche=curdate();
        insert into employe values(
            null,new.email,new.mdp,new.nom,new.prenom,new.tel,new.rue,new.numrue,new.ville,new.cp,new.fonction,new.salaire,new.niveau_diplome,new.date_embauche,new.date_depart,new.droits,new.id_planning,new.id_manager_sup,new.id_local
        );
        set new.id_manager = (select id_employe from employe where email=new.email);
    elseif new.id_manager = (select id_employe from employe where email=new.email)
        and new.email = (select email from employe where id_employe = new.id_manager)
    then
        set new.id_manager = (select id_employe from employe where email=new.email);
        set new.nom = (select nom from employe where email=new.email);
        set new.mdp = (select mdp from employe where id_employe = new.id_manager);
        set new.prenom = (select prenom from employe where email=new.email);
        set new.tel = (select tel from employe where email=new.email);
        set new.rue = (select rue from employe where email=new.email);
        set new.numrue  = (select numrue from employe where email=new.email);
        set new.ville = (select ville from employe where email=new.email);
        set new.cp = (select cp from employe where email=new.email);
        set new.fonction = (select fonction from employe where email=new.email);
        set new.salaire = (select salaire from employe where email=new.email);
        set new.niveau_diplome = (select niveau_diplome from employe where email=new.email);
        set new.date_embauche = (select date_embauche from employe where email=new.email);
        set new.date_depart = (select date_depart from employe where email=new.email);
        set new.droits = (select droits from employe where email=new.email);
        set new.id_planning = (select id_planning from employe where email=new.email);
        set new.id_manager = (select id_manager from employe where email=new.email);
        set new.id_local = (select id_local from employe where email=new.email);
    else
        signal sqlstate '45000' SET MESSAGE_TEXT = "l'employe n'existe pas impossible de lui attribuer un nouveau role";
    end if;
end //
delimiter ;

/*****************************TRIGGERS SUR IMAGE************************************/

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

/**************************TRIGGERS SUR COMMENTAIRE*******************************/

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
        signal sqlstate '45000' SET MESSAGE_TEXT = "On ne peut pas se commenter soit-meme";
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

/*****************************TRIGGERS SUR SUJET************************************/

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

/*****************************TRIGGERS SUR BADGEAGE************************************/

drop trigger if exists badgeage_before_insert;
delimiter // 
create trigger badgeage_before_insert 
before insert on badgeage
for each row
begin
    declare lastbadge int(5);
    set new.date_heure= sysdate();
    select id_badgeage into lastbadge 
        from badgeage 
        where id_employe = new.id_employe 
        and date_heure = (select max(date_heure) from badgeage where id_employe = new.id_employe);
    if (select type from badgeage where id_badgeage = lastbadge) ='entree'
        then set new.type = 'sortie';
        else set new.type = 'entree';
    end if;
end //
delimiter ;

/*****************************TRIGGERS SUR CONTENU************************************/

drop trigger if exists contenu_before_insert;
delimiter // 
create trigger contenu_before_insert 
before insert on contenu
for each row
begin
    set new.numero = (select count(id_contenu) from contenu where id_article = new.id_article);
end //
delimiter ;

/*****************************TRIGGERS SUR DEMANDE_RH************************************/

drop trigger if exists demande_rh_before_insert;
delimiter // 
create trigger demande_rh_before_insert 
before insert on demande_rh
for each row
	begin
		set new.date_demande = SYSDATE();
		set new.date_resolution = null;
        set new.id_manager = (select id_manager from employe where id_employe = new.id_employe);
	end //
delimiter ;

drop trigger if exists demande_rh_before_update;
delimiter // 
create trigger demande_rh_before_update 
before update on demande_rh
for each row
begin
	if new.etat != old.etat
	then
		set new.date_resolution = SYSDATE();
        set new.id_manager = (select id_manager from employe where id_employe = new.id_employe);
	end if;
end //
delimiter ;

drop trigger if exists demande_rh_after_update;
delimiter // 
create trigger demande_rh_after_update 
after update on demande_rh
for each row
begin
    if(new.etat = "accepte" or new.etat = "refuse")
    then
        insert into archi_demande_rh values(new.id_demande_rh, new.libelle, new.objet, new.requete_sql, new.date_demande, new.date_resolution, new.etat, new.id_employe, new.id_manager);
    end if;
end //
delimiter ;

/*****************************TRIGGERS SUR DEMANDE_AUTRE************************************/

drop trigger if exists demande_autre_before_insert;
delimiter // 
create trigger demande_autre_before_insert 
before insert on demande_autre
for each row
	begin
		set new.date_demande = SYSDATE();
		set new.date_resolution = null;
        set new.id_manager = (select id_manager from employe where id_employe = new.id_employe);
	end //
delimiter ;

drop trigger if exists demande_autre_before_update;
delimiter // 
create trigger demande_autre_before_update 
before update on demande_autre
for each row
begin
	if new.etat != old.etat
	then
		set new.date_resolution = SYSDATE();
        set new.id_manager = (select id_manager from employe where id_employe = new.id_employe);
	end if;
end //
delimiter ;

/****************************TRIGGERS SUR UTILISATEUR************************************/



/*****************************INSERTS************************************/

insert into client values(null,'jean_dupont@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','dupont','jean',null,2.5,'0123456789','rue des champs','15','Paris','75020',null,null,null,'particulier','attente');
insert into client values(null,'les_restos_du_pancreas@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Matho','Momo',null,2.5,'0123456788','avenue saint honore','24','Paris','75008','izgefibdkcsnjis165161','les restos du pancreas','ambassadeur association','association','attente');
insert into entreprise values(null,'aubonpainbiendecheznous@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Subra de Bieusse','Jean-Michel',null,2.5,'0623476481','rue des grands moulins','15 bis','Paris','75013','bauefygziygu56498zeuzg','Au bon pain bien de chez nous',null,'proprietaire','boulangerie','attente');
insert into livreur values(null,'martinmatin@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Matin','Martin',null,2.5,'0621248481','rue des champs','15','Paris','75020',null,null,'attente');
insert into client values(4,'martinmatin@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Matin','Martin',null,null,'0621248481','place des roses','18','Paris','75010',null,null,null,'particulier',null);
insert into entreprise values(2,'les_restos_du_pancreas@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Matho','Momo',null,null,'0123456788','avenue saint honore','24','Paris','75008','izgefibdkcsnjis165161','les restos du pancreas',null,'ambassadeur association','association',null);
insert into livreur values(1,'jean_dupont@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','dupont','jean',null,2.5,'0123456789','rue des champs','15','Paris','75020',null,null,'attente');
insert into candidat values(1,'jean_dupont@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','dupont','jean',null,null,'0123456789','rue des champs','15','Paris','75020','5','developpeur',null);
insert into candidat values(null,'eric_tang@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Tang','Eric',null,null,'0178956789','rue des champs','15','Paris','75020','7','reseau',null);
insert into planning values(null,'equipe developpement','https://equiplaning.com');
insert into employe values(null,'selimaouad@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Aouad','Selim','0123456789','rue des champs','15','Paris','75020','Developpeur',2500,'5','2022-05-25',null,'administrateur','1',null,null);
insert into employe values(null,'','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Chan','Billal','0123456789','rue des paniers','15','Nantes','24562','Developpeur',2522,'5','2022-05-25',null,'administrateur','1',null,null);
insert into employe values(null,'Tombruaired@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Tom','Buraire','0123456789','rue des champs','15','Paris','75020','Developpeur',2500,'5','2022-05-25',null,'rh','1',null,null);
insert into employe values(null,'AmbrineNicolas@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Ambrine','Nicolas','0123456789','rue des champs','15','Paris','75020','Developpeur',2500,'5','2022-05-25',null,'administrateur_rh ','1',null,null);
insert into employe values(null,'LeaRemy@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Lea','Remy','0123456789','rue des champs','15','Paris','75020','Developpeur',2500,'5','2022-05-25',null,'developpeur','1',null,null);
insert into categorie_produit values(null,'produit laitier','tout produit issu du lait');
insert into produit values(null,'yaourt aux fruits','yaourt aux fraises',null,'15 bis','rue des grands moulins','Paris','75013',0.5,0.1,30,null,100,1,3);

insert into enquete values(null,'Gaspillage alimentaire','Enquete sur le gaspillage alimentaire');
insert into sujet values(null,1,'Question 1','A quelle frequence faites-vous vos courses ?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel",1);
insert into sujet values(null,2,'Question 2','Verifiez-vous vos besoins avant de faire vos courses ?','qcu',"Oui|Non",1);
insert into sujet values(null,3,'Question 3','De maniere generale, achetez-vous de grande quantite de nourriture lorsque vous faites vos courses ?','qcu',"Oui|Non",1);
insert into sujet values(null,4,'Question 4','Achetez- vous des produits avec des dates courtes ?','qcu',"Oui|Non",1);
insert into sujet values(null,5,'Question 5',"Consommez- vous des aliments apres la date limite d\'utilisation optimale (DLUO) ?",'qcu',"Oui|Non",1);
insert into sujet values(null,6,'Question 6',"Si oui, pour quel type d\'aliment ?",'qcm',"Fruits et legumes|Cereales|Produits laitiers|Produits sucres",1);
insert into sujet values(null,7,'Question 7','Sur une echelle de 1 a 10, vous sentez-vous concerne par la question du gaspillage alimentaire ?','note',null,1);
insert into sujet values(null,8,'Question 8','Cuisinez-vous vos restes alimentaires ?','qcu',"Oui|Non",1);
insert into sujet values(null,9,'Question 9','Utilisez-vous vos restes afin de produire du compost ?','qcu',"Oui|Non|Je n'en ai pas l'utilite",1);
insert into sujet values(null,10,'Question 10', 'Pourriez-vous changer vos habitudes afin de reduire le gaspillage ?','qcu',"Oui|Non",1);


insert into enquete values(null,'Service client','Enquete sur la qualite de nos services');
insert into sujet values(null,1,'Question 1','Sur une echelle de 1 a 10, a combien evaluez-vous votre experience avec notre produit ?','note',null,2);
insert into sujet values(null,2,'Question 2',"Sur une echelle de 1 a 10, a combien evaluez-vous la comprehension / simplicite d\'utilisation de l'application ?",'note',null,2);
insert into sujet values(null,3,'Question 3','Avez-vous trouvez ce que vous cherchiez ?','qcu',"Oui|Non",2);
insert into sujet values(null,4,'Question 4','Recommanderiez-vous notre application ?','qcu',"Oui|Non",2);
insert into sujet values(null,5,'Question 5',"Que pensez-vous de l\'apparence globale de l\'application",'qcu',"Tres bien|Bien|Mauvais|Tres mauvaise",2);
insert into sujet values(null,6,'Question 6','Sur quelle plateforme utilisez-vous notre application ?','qcm',"Ordinateur|Telephone|Tablette|Autres",2);
insert into sujet values(null,7,'Question 7',"Sur quel systeme d\'exploitation utilisez-vous notre application ?",'qcm',"Windows|MacOS|Android|iOS|Linux|Autres",2);
insert into sujet values(null,8,'Question 8','A quelle frequence utilisez vous notre application?','qcu',"Quotidien|Hebdomadaire|Mensuel|Jamais",2);
insert into sujet values(null,9,'Question 9',"a combien evaluez-vous l\'effort que vous avez dû fournir pour trouver le produit que vous recherchiez sur notre site internet ?",'note',null,2);


insert into enquete values(null,'Regimes healthy','Enquete sur les nouveaux regimes healthy!');
insert into sujet values(null,1,'Question 1','Avez-vous un regime particulier ?','qcm',"Aucun|Vegetarien|Vegetalien|Crudivore",3);
insert into sujet values(null,2,'Question 2','Faites-vous du sport ?','qcu',"Oui|Non",3);
insert into sujet values(null,3,'Question 3','A quelle frequence utilisez vous notre application?','qcu',"Quotidien|Hebdomadaire|Mensuel|Jamais",3);
insert into sujet values(null,4,'Question 4','A quelle frequence faites-vous vos courses ?','qcu',"Quotidien|Hebdomadaire|Mensuel|Jamais",3);
insert into sujet values(null,5,'Question 5','A quelle frequence utilisez vous notre application?','qcu',"Quotidien|Hebdomadaire|Mensuel|Jamais",3);
insert into sujet values(null,6,'Question 6','A quelle frequence consommez-vous des cereales ?','qcu',"Quotidien|Hebdomadaire|Mensuel|Jamais",3);
insert into sujet values(null,7,'Question 7','A quelle frequence consommez-vous des fruits et legumes ?','qcu',"Quotidien|Hebdomadaire|Mensuel|Jamais",3);
insert into sujet values(null,8,'Question 8','A quelle frequence consommez-vous de la viande ?','qcu',"Quotidien|Hebdomadaire|Mensuel|Jamais",3);
insert into sujet values(null,9,'Question 9',"Si vous pouviez diminuer un type d\'aliment dans votre alimentation ce serait",'qcm',"Fruits et legumes|Viandes et poissons|Cereales|Produits laitiers",3);


insert into enquete values(null,'Amis des animaux',"Enquete sur les proprietaires d'animaux");
insert into sujet values(null,1,'Question 1','Quels animaux possedez-vous ?','qcm',"chat|chien|rongeurs|oiseaux|equides|autres",4);
insert into sujet values(null,2,'Question 2','A quelle frequence achetez-vous les aliments de vos animaux ?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel",4);
insert into sujet values(null,3,'Question 3','Donnez-vous vos restes a vos animaux ?','qcu',"Oui|Non",4);
insert into sujet values(null,4,'Question 4','Faites-vous vous-meme les repas de vos animaux ?','qcu',"Oui|Non",4);


insert into enquete values(null,'Produits','Enquete sur  la qualite de nos produits');
insert into sujet values(null,1,'Question 1','Qualite des aliments sur le site','qcu',"Tres bien|Bien|Mauvais|Tres mauvaise",5);
insert into sujet values(null,2,'Question 2','Pensez-vous que le site presente un choix varie de produit ?','qcu',"D\'accord|Plutot d\'accord|Pas d\'accord|Pas du tout d\'accord",5);
insert into sujet values(null,3,'Question 3','Etes-vous satisfait de la livraison du produit ?','qcu',"Oui|Non",5);
insert into sujet values(null,4,'Question 4','La livraison a t-elle ete effectuee dans les delais ?','qcu',"Oui|Non",5);
insert into sujet values(null,5,'Question 5','Sur une echelle de 1 a 10, quelle note donnez vous pour la qualite des aliments sur le site ?','note',null,5);
insert into sujet values(null,6,'Question 6',"Quel type d\'aliment avez-vous achete ?",'qcm',"Fruits et legumes|Cereales|Produits laitiers|Produits sucres",5);
insert into sujet values(null,7,'Question 7',"Le produit reçu etait-il en adequation avec l\'annonce ?",'qcu',"Oui|Non",5);

insert into categorie_metier values(null,"informatique","metiers de l\'informatique");
insert into categorie_metier values(null,"Ressources Humaines","metiers des ressources humaines");
insert into categorie_metier values(null,"expert metier","consultant metier");

insert into metier values(null,"developpeur","2500","1");
insert into metier values(null,"technicien reseau","2000","1");
insert into metier values(null,"responsable rh","4000","2");
insert into metier values(null,"consultant livraison","2400","3");

insert into locaux values(null,"Firehall Paris","12","rue des carmes","Paris","75018");
insert into locaux values(null,"Firehall Nantes","1","place des oiseaux","Nantes","52041");
insert into locaux values(null,"Firehall Lyon","255","rue des binaires","Lyon","88018");

insert into poste values(null,"technicien reseau",sysdate(),null,"1900","cherche un technicien reseau junior pour la gestion du reseau d'entreprise","cdi","1","2");
insert into poste values(null,"developpeur",sysdate(),null,"1900","cherche un lead developpeur pour creation d'application permettant de voler vers la lune juste avec un protable","cdd","1","1");
insert into poste values(null,"directeur ressources humaines",sysdate(),null,"99999.99","Cherche une terreur pour virer le junior quand il aura fini","cdi","3","3");
insert into poste values(null,"consultant livraison",sysdate(),null,"0.99","cherche consultant livraison pour creation application livraison","cdd","2","4");


insert into manager values(null,'felix.millon@firecrest.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Millon','Felix','0618488719','rue Firmin Gillot','14','Paris','75015','Grand Manitou',50000,'7',curdate(),null,'administrateur','1',1,null,1);
insert into manager values(null,'ambrine','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Nicolas','Ambrine','0760400688','rue Pierre Broussolette','3 bis','Persan','95340','Terreur',10000,'7',curdate(),null,'administrateur','1',1,11,1);
insert into manager values(null,'mohamed','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Kerraz','Mohamed','0666620535','rue de la Roseraie','1','Meudon la foret','92360','Petit Manitou',10000,'7',curdate(),null,'administrateur','1',1,11,1);
insert into employe values(null,'truc','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','De Gaulle','Charles','0100000001','Rue du faubourg Saint Honoré','55','Paris','75008','President','1','general','1942-14-07',null,'invite',1,11,1);
insert into employe values(null,'toto','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','tomtom','dugland','0123456789','rue des champs','15','Paris','75020','RH',2500,'5','2022-04-25',null,'administrateur_rh','1',null,null);
insert into candidater values (1, 1, "2023-01-01", "2023-12-01", 3);
insert into candidater values (1, 2, "2023-06-01", "2023-12-01", 3);
insert into candidater values (1, 4, "2023-06-01", "2023-08-01", 3);


insert into candidater values (5, 1, "2023-03-01", "2023-12-01", 3);
insert into candidater values (5, 2, "2023-07-01", "2023-12-01", 3);
insert into candidater values (5, 4, "2023-01-01", "2023-08-01", 3);
insert into categorie_article values(null,'CE',"information concernant le comité d'entreprise");
insert into article values(null,'waouw, 400 euros de cheque vacance !!!','mettez vous en plein les fouilles',"aujourd'hui vous pouvez obtenir vos cheque vacance, c'est trop cool, patati patata...",1,8);
insert into contenu values(null,1,"400 euro de cheque vacance pour s'eclater en famille !!! waouw waouw waouw !!! truc de ouf !!!",1);
insert into badgeage values(null,sysdate(),'entree',6);
insert into demande_rh values(null,"demande de changement d'adresse","j'ai demenage au 8 rue des champs","update employe set numrue='8' where id_employe=6;",sysdate(),null,"attente",6,null);
insert into consommateur values(null,'anonyme','123@456@789','anonyme','anonyme',sysdate(),0,'aucun','','','','','invalide');
update utilisateur set id=0 where email='anonyme';
