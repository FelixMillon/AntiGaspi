/*
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

*/

/* Enquete n_1 sur le gaspillage alimentaire  */
insert into enquete values(null,'Gaspillage alimentaire','Enquete sur le gaspillage alimentaire');
insert into sujet values(null,1,'Question 1','A quelle fréquence faites-vous vos courses ?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel",1);
insert into sujet values(null,2,'Question 2','Sur une échelle de 1 à 10, vérifiez-vous vos besoins avant de faire vos courses ?','note_image',null,1);
insert into sujet values(null,3,'Question 3','De manière générale, achetez-vous de grande quantité de nourriture lorsque vous faites vos courses ?','qcu',"Oui|Non",1);
insert into sujet values(null,4,'Question 4','Achetez-vous des produits avec des dates courtes ?','qcu',"Oui|Non",1);
insert into sujet values(null,5,'Question 5','Consommez-vous des aliments après la date limite d’utilisation optimale (DLUO) ?','qcu',"Oui|Non",1);
insert into sujet values(null,6,'Question 6','Si oui, pour quel type d''aliment ?','qcm_image',"Fruits et légumes|Céréales|Produits laitiers|Produits sucrés",1);
insert into sujet values(null,7,'Question 7','Sur une échelle de 1 à 10, vous sentez-vous concerné par la question du gaspillage alimentaire ?','note',null,1);
insert into sujet values(null,8,'Question 8','Cuisinez-vous vos restes alimentaires ?','qcu',"Oui|Non",1);
insert into sujet values(null,9,'Question 9','Utilisez-vous vos restes afin de produire du compost ?','qcu',"Oui|Non|Je n'en ai pas l'utilité",1);
insert into sujet values(null,10,'Question 10','Pourriez-vous changer vos habitudes afin de réduire le gaspillage ?','qcu',"Oui|Non",1);
insert into sujet values(null,11,'Question 11','A votre avis, quelle portion de gaspillage représente les fruits et légumes?','qcu_image',"1/3|1/2|2/3|3/4",1);

/* Enquete n_2 Serivce client */ 
insert into enquete values(null,'Service client','Enquete sur la qualite de nos services');
insert into sujet values(null,1,'Question 1','Sur une échelle de 1 à 10, à combien évaluez-vous votre expérience avec notre produit ?','note',null,2);
insert into sujet values(null,2,'Question 2','Sur une échelle de 1 à 10, à combien évaluez-vous la compréhension / simplicité d''utilisation de l''application ?','note',null,2);
insert into sujet values(null,3,'Question 3','Avez-vous trouvez ce que vous cherchiez ?','qcu',"Oui|Non",2);
insert into sujet values(null,4,'Question 4','Recommanderiez-vous notre application ?','qcu',"Oui|Non",2);
insert into sujet values(null,5,'Question 5','Que pensez-vous de l''apparence globale de l''application','qcu',"Très bien|Bien|Mauvais|Très mauvaise",2);
insert into sujet values(null,6,'Question 6','Sur quelle plateforme utilisez-vous notre application ?','qcm',"Ordinateur|Téléphone|Tablette|Autres",2);
insert into sujet values(null,7,'Question 7','Sur quel système d''exploitation utilisez-vous notre application ?','qcm',"Windows|MacOS|Android|iOS|Autres",2);
insert into sujet values(null,8,'Question 8','A quelle fréquence utilisez vous notre application?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel|Jamais",2);
insert into sujet values(null,9,'Question 9','À combien évaluez-vous l’effort que vous avez dû fournir pour trouver le produit que vous recherchiez sur notre site internet ?','note',null,2);


/* Enquete n_3 regime healthy */ 
insert into enquete values(null,'Regimes healthy','Enquete sur les nouveaux regimes healthy!');
insert into sujet values(null,1,'Question 1','Avez-vous un régime particulier ?','qcm',"Aucun|Végétarien|Végétalien|Crudivore",3);
insert into sujet values(null,2,'Question 2','Faites-vous du sport ?','qcu',"Oui|Non",3);
insert into sujet values(null,3,'Question 3','A quelle fréquence utilisez vous notre application?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel|Jamais",3);
insert into sujet values(null,4,'Question 4','A quelle fréquence faites-vous vos courses ?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel|Jamais",3);
insert into sujet values(null,5,'Question 5','A quelle fréquence utilisez vous notre application?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel|Jamais",3);
insert into sujet values(null,6,'Question 6','A quelle fréquence consommez-vous des céréales ?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel|Jamais",3);
insert into sujet values(null,7,'Question 7','A quelle fréquence consommez-vous des fruits et légumes ?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel|Jamais",3);
insert into sujet values(null,8,'Question 8','A quelle fréquence consommez-vous de la viande ?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel|Jamais",3);
insert into sujet values(null,9,'Question 9','Si vous pouviez diminuer un type d''aliment dans votre alimentation ce serait : ','qcm',"Fruits et légumes|Viandes et poissons|Céréales|Produits laitiers|Produits sucrés",3);

/* Enquete n_3 sur les animaux  */
insert into enquete values(null,'Amis des animaux','Enquete sur la qualite de la nourritures de nos petits compagnons');
insert into sujet values(null,1,'Question 1','Quels animaux possédez-vous ?','qcm',"chat|chien|rongeurs|oiseaux|équidés|autres",4);
insert into sujet values(null,2,'Question 2','A quelle fréquence achetez-vous les aliments de vos animaux ?','qcu',"Quotidien|Hebdomadaire|Bimensuel|Mensuel",4);
insert into sujet values(null,3,'Question 3','Donnez-vous vos restes à vos animaux ?','qcu',"Oui|Non",4);
insert into sujet values(null,4,'Question 4','Faites-vous vous-même les repas de vos animaux ?','qcu',"Oui|Non",4);

/* Enquete n_4 sur les produits  */
insert into enquete values(null,'Produits','Enquete sur  la qualite de nos produits');
insert into sujet values(null,1,'Question 1','Qualité des aliments sur le site','qcu',"Très bien|Bien|Mauvais|Très mauvaise",5);
insert into sujet values(null,2,'Question 2','Pensez-vous que le site présente un choix varié de produit ?','qcu',"D'accord|Plutôt d'accord|Pas d'accord|Pas du tout d'accord",5);
insert into sujet values(null,3,'Question 3','Etes-vous satisfait de la livraison du produit ?','qcu',"Oui|Non",5);
insert into sujet values(null,4,'Question 4','La livraison a t-elle été effectuée dans les délais ?','qcu',"Oui|Non",5);
insert into sujet values(null,5,'Question 5','Sur une échelle de 1 à 10, quelle note donnez vous pour la qualité des aliments sur le site ?','note',null,5);
insert into sujet values(null,6,'Question 6','Quel type d''aliment avez-vous acheté ?','qcm',"Fruits et légumes|Céréales|Produits laitiers|Produits sucrés",5);
insert into sujet values(null,7,'Question 7','Le produit reçu était-il en adéquation avec l''annonce ?','qcu',"Oui|Non",5);






