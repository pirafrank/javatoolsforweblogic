--------------------------------------------------------
--  File created - Sunday-April-22-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table DOMAINS
--------------------------------------------------------

  CREATE TABLE "DOMAINS" 
   (	"DOMAINNAME" VARCHAR2(20 BYTE), 
	"ENV" VARCHAR2(20 BYTE), 
	"DOMAINTYPE" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table JMSMODULES
--------------------------------------------------------

  CREATE TABLE "JMSMODULES" 
   (	"JMSMODULENAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table JMSQUEUES
--------------------------------------------------------

  CREATE TABLE "JMSQUEUES" 
   (	"JMSNAME" VARCHAR2(20 BYTE), 
	"JNDINAME" VARCHAR2(20 BYTE), 
	"REPROCESSQUEUE" VARCHAR2(20 BYTE), 
	"JMSMODULENAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table MACHINES
--------------------------------------------------------

  CREATE TABLE "MACHINES" 
   (	"MACHINENAME" VARCHAR2(20 BYTE), 
	"IPADDRESS" VARCHAR2(20 BYTE), 
	"VIP" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SERVERS
--------------------------------------------------------

  CREATE TABLE "SERVERS" 
   (	"ENV" VARCHAR2(20 BYTE), 
	"SERVERNAME" VARCHAR2(20 BYTE), 
	"ISADMIN" NUMBER(1,0), 
	"MACHINENAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Index DOMAINS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DOMAINS_PK" ON "DOMAINS" ("ENV");
--------------------------------------------------------
--  DDL for Index DOMAINS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "DOMAINS_UK1" ON "DOMAINS" ("DOMAINNAME") ;
--------------------------------------------------------
--  DDL for Index JMSMODULES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JMSMODULES_PK" ON "JMSMODULES" ("JMSMODULENAME");
--------------------------------------------------------
--  DDL for Index MACHINES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MACHINES_PK" ON "MACHINES" ("MACHINENAME") ;
--------------------------------------------------------
--  DDL for Index SERVERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SERVERS_PK" ON "SERVERS" ("SERVERNAME");
--------------------------------------------------------
--  Constraints for Table DOMAINS
--------------------------------------------------------

  ALTER TABLE "DOMAINS" ADD CONSTRAINT "DOMAINS_UK1" UNIQUE ("DOMAINNAME")  ENABLE;
  
  ALTER TABLE "DOMAINS" ADD CONSTRAINT "DOMAINS_PK" PRIMARY KEY ("ENV") ENABLE;
  ALTER TABLE "DOMAINS" MODIFY ("ENV" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JMSMODULES
--------------------------------------------------------

  ALTER TABLE "JMSMODULES" ADD CONSTRAINT "JMSMODULES_PK" PRIMARY KEY ("JMSMODULENAME");
  ALTER TABLE "JMSMODULES" MODIFY ("JMSMODULENAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JMSQUEUES
--------------------------------------------------------

  ALTER TABLE "JMSQUEUES" MODIFY ("JMSMODULENAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MACHINES
--------------------------------------------------------

  ALTER TABLE "MACHINES" ADD CONSTRAINT "MACHINES_PK" PRIMARY KEY ("MACHINENAME");
  ALTER TABLE "MACHINES" MODIFY ("MACHINENAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SERVERS
--------------------------------------------------------

  ALTER TABLE "SERVERS" ADD CONSTRAINT "SERVERS_PK" PRIMARY KEY ("SERVERNAME") ENABLE;
  ALTER TABLE "SERVERS" MODIFY ("MACHINENAME" NOT NULL ENABLE);
  ALTER TABLE "SERVERS" MODIFY ("ISADMIN" NOT NULL ENABLE);
  ALTER TABLE "SERVERS" MODIFY ("SERVERNAME" NOT NULL ENABLE);
  
--------------------------------------------------------
--  Ref Constraints for Table JMSQUEUES
--------------------------------------------------------

  ALTER TABLE "JMSQUEUES" ADD CONSTRAINT "JMSQUEUES_J_FK1" FOREIGN KEY ("JMSMODULENAME")
	  REFERENCES "JMSMODULES" ("JMSMODULENAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SERVERS
--------------------------------------------------------

  ALTER TABLE "SERVERS" ADD CONSTRAINT "SERVERS_MAC_FK1" FOREIGN KEY ("MACHINENAME")
	  REFERENCES "MACHINES" ("MACHINENAME") ENABLE;
