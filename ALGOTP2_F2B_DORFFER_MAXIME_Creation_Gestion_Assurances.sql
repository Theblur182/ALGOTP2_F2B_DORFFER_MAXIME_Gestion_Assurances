/*

DORFFER Maxime
F2A - Ludus Académie - 01/06/2017
Travail en SQL sur Gestion Assurances
Script - CREATION 

*/

CREATE TABLE CLIENT (   NUMCLIENT char(15) not null,
                        NOM char(35) not null,
                        ADRESSE char(60) not null,
            primary key (NUMCLIENT))
            in SP_CLIENT   ; 

 
 CREATE TABLE CONTRAT ( SIGNATAIRE char(15) not null,
                        NUMCTR char(8) not null,
                        TYPES char(12) not null,
                        DATESIGN date not null,
            primary key (SIGNATAIRE,NUMCTR),
            foreign key (NUMCLIENT) references CLIENT 
                        on delete no action on update cascade)
            in SP_CLIENT ;
 
 CREATE TABLE VEHICULE (NUMVEH char(20) not null,
                        MARQUE char(30) not null,
                        MODELE char(30) not null,
					              ANNEE decimal (4) not null,
                        CYLINDREE char(6) not null,
					              SIGNATAIRE char(12) not null,
					              NUMCTR char(8) not null,
					              NUMCLIENT char(12) not null,
					  
            primary key (NUMVEH),
            foreign key (SIGNATAIRE) references CONTRAT on update cascade,  
            foreign key (NUMCTR) references CONTRAT on update cascade )
            in SP_CLIENT ;

 CREATE TABLE ACCIDENT (NUMACC char(10) not null,
                        DATEACC date not null,
                        MONTANT int(6) not null,
            primary key (NUMACC))
            in SP_CLIENT ;
                 
 
 CREATE TABLE IMPLICATION ( NUMACC char(16) not null,
                       NUMVEH char(10) not null,            
					 primary key (NUMACC,NUMVEH),
           foreign key (NUMACC) references ACCIDENT on update cascade,    
           foreign key (NUMVEH) references VEHICULE on update cascade )        
           in SP_VEHICULE;
 
 CREATE UNIQUE INDEX `I_CLIENT` ON `CLIENT` (`NUMCLIENT`);
 CREATE UNIQUE INDEX `I_CONTRAT` ON `CONTRAT` (`SIGNATAIRE`,`NUMCTR`);
 CREATE UNIQUE INDEX `I_VEHICULE` ON `VEHICULE` (`NUMVEH`,`SIGNATAIRE`,`NUMCTR`);
 CREATE UNIQUE INDEX `I_ACCIDENT` ON `ACCIDENT` (`NUMACC`);
 CREATE UNIQUE INDEX `I_IMPLICATION` ON `IMPLICATION` (`NUMACC`,`NUMVEH`);