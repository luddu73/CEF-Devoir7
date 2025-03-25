-- Script de test de la BDD tifosi

-- -----------------------------------------------------
-- REQUETE 1 ---> Afficher la liste des noms des focaccias 
-- par ordre alphabétique croissant
-- -----------------------------------------------------

SELECT nom FROM foccacia ORDER BY nom ASC;

-- Données attendues : Américaine, Emmentalaccia, Gorgonzollaccia, Hawaienne,
-- Mozaccia, Paysanne, Raclaccia et Tradizione

-- Données reçues : Identique

-- Résultat : Conforme !


-- -----------------------------------------------------
-- REQUETE 2 ---> Afficher le nombre total d'ingrédient
-- -----------------------------------------------------

SELECT COUNT(*) AS total FROM ingredient;

-- Donnée attendue : 25
-- Donnée reçue : 25
-- Résultat : Conforme !


-- -----------------------------------------------------
-- REQUETE 3 ---> Afficher le prix moyen des focaccias
-- -----------------------------------------------------

SELECT AVG(prix) AS moyenne FROM foccacia;

-- Donnée attendue : 10.375
-- Donnée reçue : 10.375000
-- Résultat : Conforme !


-- -----------------------------------------------------
-- REQUETE 4 ---> Afficher la liste des boissons avec leur marque, 
-- triée par nom de boisson,
-- -----------------------------------------------------

SELECT b.nom, m.nom FROM boisson b
JOIN marque m ON (m.id_marque = b.marque_id_marque)
ORDER BY b.nom;

-- Données attendues : Capri-sun (Coca-cola), Coca-cola original (Coca-Cola), 
-- Coca-cola zéro (Coca-cola), Eau de source (Cristalline), Fanta citron (coca-cola),
-- Fanta orange (coca-cola), Lipton Peach (Pepsico), Lipton zéro citron (Pepscio),
-- Monster energy ultra blue (Monster), Monster energy ultra gold (Monster),
-- Pepsi (Pepsico), Pepsi Max Zéro (Pepsico)

-- Données reçues : Identique

-- Résultat : Conforme !



-- -----------------------------------------------------
-- REQUETE 5 ---> Afficher la liste des ingrédients pour une Raclaccia,
-- -----------------------------------------------------

SELECT i.nom, c.quantite FROM foccacia f
JOIN comprend c ON (c.foccacia_id_foccacia = f.id_foccacia)
JOIN ingredient i ON (i.id_ingredient = c.ingredient_id_ingredient)
WHERE f.nom = "Raclaccia";

-- Données attendues : 200g base tomate, 50g de raclette, 20g de cresson
-- 2g d'ail, 40g de champignon, 50g de parmesan et 1g de poivre

-- Données reçues : Ail : 2g, Base Tomate : 200g, Champignon : 40g, Cresson : 20g
-- Parmesan 50g, Poivre : 1g, Raclette 50g

-- Résultat : Conforme ! La seule différence est sur l'ordre, j'ai repris l'ordre
-- du fichier excel fournis. Le script lui, présente dans l'ordre d'ID d'ingredient


-- -----------------------------------------------------
-- REQUETE 6 ---> Afficher le nom et le nombre d'ingrédients pour chaque foccacia,
-- -----------------------------------------------------

SELECT f.nom, COUNT(c.quantite) AS nb_ingredient FROM foccacia f
JOIN comprend c ON (c.foccacia_id_foccacia = f.id_foccacia)
GROUP BY f.nom;

-- Données attendues : Mozaccia : 10, Gorgonzollaccia : 8, Raclaccia : 7
-- Emmentalaccia : 7, Tradizione : 9, Hawaienne : 9, Américaine : 8, Paysanne : 12

-- Données reçues : Idem

-- Résultat : Conforme ! 


-- -----------------------------------------------------
-- REQUETE 7 ---> Afficher le nom de la focaccia qui a le plus d'ingrédients,
-- -----------------------------------------------------

SELECT f.nom FROM comprend c
JOIN foccacia f ON (f.id_foccacia = c.foccacia_id_foccacia)
GROUP BY c.foccacia_id_foccacia
ORDER BY COUNT(c.quantite) DESC
LIMIT 1;

-- Donnée attendue  : Paysanne
-- Donnée reçue : Paysanne

-- Résultat : Conforme !


-- -----------------------------------------------------
-- REQUETE 8 ---> Afficher la liste des focaccia qui contiennent de l'ail,
-- -----------------------------------------------------

SELECT f.nom FROM ingredient i
JOIN comprend c ON (c.ingredient_id_ingredient = i.id_ingredient)
JOIN foccacia f ON (f.id_foccacia = c.foccacia_id_foccacia)
WHERE i.nom = "Ail";

-- Données attendues : Mozaccia, Gorgonzollaccia, Raclaccia, Paysanne

-- Données reçues : Identique

-- Résultat : Conforme !


-- -----------------------------------------------------
-- REQUETE 9 ---> Afficher la liste des ingrédients inutilisés
-- -----------------------------------------------------

SELECT i.nom FROM ingredient i
LEFT JOIN comprend c ON (c.ingredient_id_ingredient = i.id_ingredient)
WHERE c.ingredient_id_ingredient IS NULL;

-- Données attendues : Salami et Tomate cerise

-- Données reçues : Salami et Tomate cerise

-- Résultat : Conforme !


-- -----------------------------------------------------
-- REQUETE 10 ---> Afficher la liste des focaccia qui n'ont pas de champignons
-- -----------------------------------------------------

SELECT f.nom
FROM foccacia f
LEFT JOIN comprend c 
    ON c.foccacia_id_foccacia = f.id_foccacia 
    AND c.ingredient_id_ingredient = (
        SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon' LIMIT 1
    )
WHERE c.ingredient_id_ingredient IS NULL;

-- Données attendues : Hawaienne et Américaine

-- Données reçues : Idem

-- Résultat : Conforme !
