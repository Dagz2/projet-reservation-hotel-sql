## Tâche 1

Je sais que des erreurs ont été volontairement glissé dans le script.
Je préfère lancer le script dans phpmyadmin pour avoir les codes d'erreur, ce sera plus rapide que de tout vérifier directement dans le fichier.

Wamp n'arrive pas à lancer MySql.
Je vais voir les logs, il y a un conflit de port.
Je cherche les processus qui utilisent le port destiné à mysql "netstat -aon | findstr :3306".
Je cherche le nom du processus "tasklist | findstr ****".
J'arrête de force le processus "taskkill /PID **** /F".
Je relance le service mysql dans wamp.
Tous les services fonctionnent.

Je crée la base de donnée "reservation_hotel".
Phpmyadmin repère déja les erreurs de syntaxe dans le script.
Je les corrige, c'est une erreur de mot clé, KEY -> FOREIGN KEY.

Je lance le script, j'ai une erreur "#1072 - La clé 'numChambre' n'existe pas dans la table".
Le champs "numero" est créé dans la table mais pour la contrainte UNIQUE KEY on utilise "numChambre".
Je modifie cela, numChambre -> numero.

Le script se lance sans erreurs critiques, par contre j'ai des erreurs non critique, je regarde. 

"Warning: #1681 Integer display width is deprecated and will be removed in a future release"
On précise la taille pour les champs int et tinyint, c'est obsolète, je préfère l'enlever pour ne pas avoir de problème dans le futur. 

"Warning: #1831 Duplicate index 'nom_2' defined on the table 'reservation_hotel.couchages'. This is deprecated and will be disallowed in a future release."
Il y a deux clé unique sur le même champs, je supprime la deuxième.

En regardant le script je vois des erreurs logiques qui ne sont pas ressortit.

Je vois qu'on utilise MyISAM plutôt que InnoDB qui est utilisé d'habitude.
Je vais comparer les deux, MyISAM est plus rapide mais ne supporte pas les clés étrangères, je remplace par InnoDB car on a des clés étrangères.

Je vois des incohérences dans les auto increment et des clés primaires en tinyint et tout un tas d'autres problèmes.
Je vais analyser tout le script ligne par ligne.


`id_hotel` int NOT NULL,
`id_type` int NOT NULL,

devient 

`id_hotel` int UNSIGNED NOT NULL,
`id_type` int UNSIGNED NOT NULL,

pour garder la cohérence dans les types. 

Je mets toutes les clés primaire en AUTO INCREMENT, et je précise un pas de 1 pour chaque AUTO_INCREMENT (automatique)

Je corrige toutes les déclarations de clés étrangères, leur conventions de nommages etc.
Je change l'ordre de création des tables.
Je mets toutes les déclarations directement dans chaque table pour plus de clarté.

Je relance le script SQL , aucune erreur. 