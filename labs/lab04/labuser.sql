CREATE LOGIN labuser WITH PASSWORD = 'MSPress#1';

USE MyGuitarShop;
CREATE USER labuser FROM LOGIN labuser;
GRANT SELECT TO labuser;