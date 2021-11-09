SET @job_name = 'mcdonalds';
SET @society_name = 'society_mcdonalds';
SET @job_Name_Caps = 'McDonalds';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_mcdonalds_fridge', 'mcdonalds (frigo)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'recruit', 'Cook', 1, '{}', '{}'),
  (@job_name, 1, 'worker', 'Supervisor', 1, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'Manager', 1, '{}', '{}'),
  (@job_name, 3, 'boss', 'Owner', 1, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('mcdonalds_burger', 'McDonalds Burger', 1, 0, 1, 0, 0),
('mcdonalds_drink', 'McDonalds Drink', 1, 0, 1, 0, 0),
('mcdonalds_fries', 'McDonalds Fries', 1, 0, 1, 0, 0),
('mcdonalds_meal', 'McDonalds Meal', 5, 0, 1, 0, 0);