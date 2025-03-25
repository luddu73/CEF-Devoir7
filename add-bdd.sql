-- Script d'alimentation de la BDD tifosi

-- -----------------------------------------------------
-- Alimentation de la table "marque"
-- -----------------------------------------------------

INSERT INTO marque (nom) VALUES 
('Coca-cola'),('Cristalline'),('Monster'),('Pepsico');

-- -----------------------------------------------------
-- Alimentation de la table "boisson"
-- -----------------------------------------------------

INSERT INTO boisson VALUES 
(NULL,'Coca-cola zéro','1'),
(NULL,'Coca-cola original','1'),
(NULL,'Fanta citron','1'),
(NULL,'Fanta orange','1'),
(NULL,'Capri-sun','1'),
(NULL,'Pepsi','4'),
(NULL,'Pepsi Max Zéro','4'),
(NULL,'Lipton zéro citron','4'),
(NULL,'Lipton Peach','4'),
(NULL,'Monster energy ultra gold','3'),
(NULL,'Monster energy ultra blue','3'),
(NULL,'Eau de source','2');


-- -----------------------------------------------------
-- Alimentation de la table "ingredient"
-- -----------------------------------------------------

INSERT INTO ingredient VALUES 
('1','Ail'),
('2','Ananas'),
('3','Artichaut'),
('4','Bacon'),
('5','Base Tomate'),
('6','Base crème'),
('7','Champignon'),
('8','Chevre'),
('9','Cresson'),
('10','Emmental'),
('11','Gorgonzola'),
('12','Jambon cuit'),
('13','Jambon fumé'),
('14','Oeuf'),
('15','Oignon'),
('16','Olive noire'),
('17','Olive verte'),
('18','Parmesan'),
('19','Piment'),
('20','Poivre'),
('21','Pomme de terre'),
('22','Raclette'),
('23','Salami'),
('24','Tomate cerise'),
('25','Mozarella');


-- -----------------------------------------------------
-- Alimentation de la table "foccacia"
-- -----------------------------------------------------

INSERT INTO foccacia (nom,prix) VALUES 
('Mozaccia',9.8),
('Gorgonzollaccia',10.8),
('Raclaccia',8.9),
('Emmentalaccia',9.8),
('Tradizione',8.9),
('Hawaienne',11.2),
('Américaine',10.8),
('Paysanne',12.8);

-- -----------------------------------------------------
-- Alimentation de la table "comprend" qui récupère les ID des ingrédients et
-- des foccacia pour en présenter les quantités
-- -----------------------------------------------------

INSERT INTO comprend VALUES 
-- MOZACCIA Base tomate (200g), Mozarella (50g), cresson (20g), jambon fumé (80g), 
-- ail (2g), artichaut (20g), champignon (40g), parmesan (50g), poivre (1g), 
-- olive noire (20g)
(1,5,200), 
(1,25,50),
(1,9,20),
(1,13,80),
(1,1,2),
(1,3,20),
(1,7,40),
(1,18,50),
(1,20,1),
(1,16,20),
-- GORGONZOLLACCIA Base tomate (200g), Gorgonzola (50g), cresson (20g), ail (2g), 
-- champignon (40g), parmesan (50g), poivre (1g), olive noire (20g)
(2,5,200),
(2,11,50),
(2,9,20),
(2,1,2),
(2,7,40),
(2,18,50),
(2,20,1),
(2,16,20),
-- RACLACCIA Base tomate (200g), raclette (50g), cresson (20g), ail (2g), 
-- champignon (40g), parmesan (50g), poivre (1g)
(3,5,200),
(3,22,50),
(3,9,20),
(3,1,2),
(3,7,40),
(3,18,50),
(3,20,1),
-- EMMENTALACCIA Base crème (200g), Emmental (50g), cresson (20g), champignon (40g),
-- parmesan (50g), poivre (1g), oignon (20g)
(4,6,200),
(4,10,50),
(4,9,20),
(4,7,40),
(4,18,50),
(4,20,1),
(4,15,20),
-- TRADIZIONE Base tomate (200g), Mozarella (50g), cresson (20g), jambon cuit (80g), 
-- champignon (80g), parmesan (50g), poivre (1g), olive noire (10g), olive verte(10g)
(5,5,200),
(5,25,50),
(5,9,20),
(5,12,80),
(5,7,80),
(5,18,50),
(5,20,1),
(5,16,10),
(5,17,10),
-- HAWAIENNE Base tomate (200g), Mozarella (50g), cresson (20g), bacon (80g),
-- ananas (40g), piment (2g), parmesan (50g), poivre (1g), olive noire (20g)
(6,5,200),
(6,25,50),
(6,9,20),
(6,4,80),
(6,2,40),
(6,19,2),
(6,18,50),
(6,20,1),
(6,16,20),
-- AMERICAINE Base tomate (200g), Mozarella (50g), cresson (20g), bacon (80g), 
-- pomme de terre(40) parmesan (50g), poivre (1g), olive noire (20g)
(7,5,200),
(7,25,50),
(7,9,20),
(7,4,80),
(7,21,40),
(7,18,50),
(7,20,1),
(7,16,20),
-- PAYSANNE Base crème (200g), Chèvre (50g), cresson (20g), pomme de terre (80g), 
-- jambon fumé (80g), ail (2g), artichaut (20g), champignon (40g), parmesan (50g),
-- poivre (1g), olive noire (20g), œuf (50g)
(8,6,200),
(8,8,50),
(8,9,20),
(8,21,80),
(8,13,80),
(8,1,2),
(8,3,20),
(8,7,40),
(8,18,50),
(8,20,1),
(8,16,20),
(8,14,50);