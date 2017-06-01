/*

DORFFER Maxime
F2A - Ludus Académie - 01/06/2017
Travail en SQL sur Gestion Assurances
Script - INSERTION

*/



INSERT INTO CLIENT (NUMCLIENT, NOM, ADRESSE)
 VALUES
 ((SELECT COUNT(NUMCLIENT)+1 from CLIENT), 'Sonic', 'Mobius'),
 ((SELECT COUNT(NUMCLIENT)+1 from CLIENT), 'Tails', 'Mobius');

