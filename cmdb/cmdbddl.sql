DROP TABLE "ACME_ALERTS" cascade constraints;
DROP TABLE "ACME_BUILD_ACTIONLOG" cascade constraints;
DROP TABLE "ACME_BUILD_F_AND_R" cascade constraints;
DROP TABLE "ACME_BUILD_F_AND_R_PROPS" cascade constraints;
DROP TABLE "ACME_BUILD_VERSIONS" cascade constraints;
DROP TABLE "ACME_CMDBAUDIT" cascade constraints;
DROP TABLE "ACME_DATABASE_SCHEMAS" cascade constraints;
DROP TABLE "ACME_DATABASES" cascade constraints;
DROP TABLE "ACME_DATASOURCES" cascade constraints;
DROP TABLE "ACME_DATASOURCES_ENV" cascade constraints;
DROP TABLE "ACME_DATASOURCESMULTI" cascade constraints;
DROP TABLE "ACME_DBADAPTER" cascade constraints;
DROP TABLE "ACME_DOMAIN_GROUP" cascade constraints;
DROP TABLE "ACME_DOMAINS" cascade constraints;
DROP TABLE "ACME_ENVIRONMENT_CHECKS" cascade constraints;
DROP TABLE "ACME_ENVS" cascade constraints;
DROP TABLE "ACME_ERRORCODES" cascade constraints;
DROP TABLE "ACME_ERRORCODES2" cascade constraints;
DROP TABLE "ACME_FILEPOLLERS" cascade constraints;
DROP TABLE "ACME_FILES" cascade constraints;
DROP TABLE "ACME_FILESTORES" cascade constraints;
DROP TABLE "ACME_FILESYSTEMS" cascade constraints;
DROP TABLE "ACME_FIREWALLS" cascade constraints;
DROP TABLE "ACME_FTPSERVERS" cascade constraints;
DROP TABLE "ACME_GROUPS" cascade constraints;
DROP TABLE "ACME_HQ_CUSTOM_METRICS" cascade constraints;
DROP TABLE "ACME_HQ_GROUPS" cascade constraints;
DROP TABLE "ACME_HQ_METRICTEMPLATES" cascade constraints;
DROP TABLE "ACME_HQ_PRIORITIES" cascade constraints;
DROP TABLE "ACME_HQ_PROTOTYPES" cascade constraints;
DROP TABLE "ACME_HQ_RESOURCE_ALERT" cascade constraints;
DROP TABLE "ACME_HQ_RESOURCES" cascade constraints;
DROP TABLE "ACME_INTERFACES" cascade constraints;
DROP TABLE "ACME_INTERFACES_SEQUENCEDIAG" cascade constraints;
DROP TABLE "ACME_INTERFACES_STEPS" cascade constraints;
DROP TABLE "ACME_JARS" cascade constraints;
DROP TABLE "ACME_JDBCDRIVERS" cascade constraints;
DROP TABLE "ACME_JMSCONNFACTORY" cascade constraints;
DROP TABLE "ACME_JMSMODULES" cascade constraints;
DROP TABLE "ACME_JMSQUEUES" cascade constraints;
DROP TABLE "ACME_JMSSERVERS" cascade constraints;
DROP TABLE "ACME_KNOWN_ISSUES" cascade constraints;
DROP TABLE "ACME_LOADBALANCERS" cascade constraints;
DROP TABLE "ACME_MACHINES" cascade constraints;
DROP TABLE "ACME_MOUNTS" cascade constraints;
DROP TABLE "ACME_MOUNTSLOCAL" cascade constraints;
DROP TABLE "ACME_NIC" cascade constraints;
DROP TABLE "ACME_OSBPROJECTS" cascade constraints;
DROP TABLE "ACME_OSBREPORTS_LEGALPROPS" cascade constraints;
DROP TABLE "ACME_OSBREPORTS_PROPS" cascade constraints;
DROP TABLE "ACME_PROJECTS" cascade constraints;
DROP TABLE "ACME_SERVERS" cascade constraints;
DROP TABLE "ACME_SERVICE_DEPENDENCIES" cascade constraints;
DROP TABLE "ACME_SERVICE_TYPES" cascade constraints;
DROP TABLE "ACME_SERVICES" cascade constraints;
DROP TABLE "ACME_USER_ROLE" cascade constraints;
DROP TABLE "ACME_USERS" cascade constraints;
DROP TABLE "ACME_VERSION" cascade constraints;
DROP TABLE "ACME_WORKMANAGERS" cascade constraints;
--------------------------------------------------------
--  DDL for Table ACME_ALERTS
--------------------------------------------------------

  CREATE TABLE "ACME_ALERTS" 
   (	"ERRORCODE" VARCHAR2(100 BYTE), 
	"INTERFACEID" VARCHAR2(100 BYTE), 
	"TECHNICALMESSAGEID" VARCHAR2(200 BYTE), 
	"CREATIONDATE" DATE, 
	"ISACTIVE" NUMBER DEFAULT 1
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_BUILD_ACTIONLOG
--------------------------------------------------------

  CREATE TABLE "ACME_BUILD_ACTIONLOG" 
   (	"ACTIONTYPE" VARCHAR2(20 BYTE), 
	"ACTIONDATE" DATE, 
	"DESCRIPTION" VARCHAR2(200 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_BUILD_F_AND_R
--------------------------------------------------------

  CREATE TABLE "ACME_BUILD_F_AND_R" 
   (	"DOMAINNAMES" VARCHAR2(200 BYTE), 
	"PROPERTYNAME" VARCHAR2(50 BYTE), 
	"TO_VALUE" VARCHAR2(200 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_BUILD_F_AND_R_PROPS
--------------------------------------------------------

  CREATE TABLE "ACME_BUILD_F_AND_R_PROPS" 
   (	"PROPERTYNAME" VARCHAR2(50 BYTE), 
	"EXECUTION_ORDER" NUMBER DEFAULT 1, 
	"DESCRIPTION" VARCHAR2(300 BYTE), 
	"FROM_VALUE" VARCHAR2(200 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_BUILD_VERSIONS
--------------------------------------------------------

  CREATE TABLE "ACME_BUILD_VERSIONS" 
   (	"ENVNAME" VARCHAR2(20 BYTE), 
	"PROJECTNAME" VARCHAR2(50 BYTE), 
	"VERSION" VARCHAR2(20 BYTE), 
	"CREATIONDATE" DATE, 
	"DOMAIN" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_CMDBAUDIT
--------------------------------------------------------

  CREATE TABLE "ACME_CMDBAUDIT" 
   (	"USERNAME" VARCHAR2(20 BYTE), 
	"TABLENAME" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_DATABASE_SCHEMAS
--------------------------------------------------------

  CREATE TABLE "ACME_DATABASE_SCHEMAS" 
   (	"DBNAME" VARCHAR2(20 BYTE), 
	"SCHEMAOWNER" VARCHAR2(20 BYTE), 
	"SCHEMA_NAME" VARCHAR2(20 BYTE), 
	"ENCRYPTED_PASSWORD" VARCHAR2(50 BYTE), 
	"NONENCRYPTED_PASSWORD" VARCHAR2(50 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_DATABASES
--------------------------------------------------------

  CREATE TABLE "ACME_DATABASES" 
   (	"DBNAME" VARCHAR2(20 BYTE), 
	"SID" VARCHAR2(20 BYTE), 
	"PORT" VARCHAR2(20 BYTE), 
	"SERVICE_NAME" VARCHAR2(30 BYTE), 
	"HOSTNAME" VARCHAR2(50 BYTE), 
	"ISRAC" VARCHAR2(1 BYTE) DEFAULT 0, 
	"URL_SERVICE" VARCHAR2(300 BYTE), 
	"TYPE" VARCHAR2(20 BYTE) DEFAULT 'ORACLE', 
	"ONSNODELIST" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_DATASOURCES
--------------------------------------------------------

  CREATE TABLE "ACME_DATASOURCES" 
   (	"DSNAME" VARCHAR2(40 BYTE), 
	"DSJNDINAME" VARCHAR2(50 BYTE), 
	"JDBCDRIVER" VARCHAR2(100 BYTE), 
	"NOTES" VARCHAR2(200 BYTE), 
	"PROJECT" VARCHAR2(20 BYTE), 
	"ISXA" NUMBER DEFAULT 0, 
	"EXTRA_PROPERTIES" VARCHAR2(1000 BYTE), 
	"MULTIDS" VARCHAR2(50 BYTE), 
	"EXTRA_PARAMETERS" VARCHAR2(1000 BYTE), 
	"TARGET_TO" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_DATASOURCES_ENV
--------------------------------------------------------

  CREATE TABLE "ACME_DATASOURCES_ENV" 
   (	"DSNAME" VARCHAR2(40 BYTE), 
	"DOMAINNAME" VARCHAR2(200 BYTE), 
	"SCHEMA_NAME" VARCHAR2(40 BYTE), 
	"ID" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_DATASOURCESMULTI
--------------------------------------------------------

  CREATE TABLE "ACME_DATASOURCESMULTI" 
   (	"DSNAME" VARCHAR2(50 BYTE), 
	"DOMAINNAMES" VARCHAR2(500 BYTE), 
	"DSJNDINAME" VARCHAR2(100 BYTE), 
	"ID" NUMBER
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_DBADAPTER
--------------------------------------------------------

  CREATE TABLE "ACME_DBADAPTER" 
   (	"JNDINAME" VARCHAR2(50 BYTE), 
	"DATASOURCENAME" VARCHAR2(100 BYTE), 
	"XADATASOURCENAME" VARCHAR2(100 BYTE), 
	"NOTES" VARCHAR2(200 BYTE), 
	"DOMAIN_GROUP" VARCHAR2(20 BYTE), 
	"PLATFORM_CLASS_NAME" VARCHAR2(50 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_DOMAIN_GROUP
--------------------------------------------------------

  CREATE TABLE "ACME_DOMAIN_GROUP" 
   (	"DOMAIN_GROUP" VARCHAR2(20 BYTE), 
	"DOMAINNAMES" VARCHAR2(500 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_DOMAINS
--------------------------------------------------------

  CREATE TABLE "ACME_DOMAINS" 
   (	"DOMAINNAME" VARCHAR2(20 BYTE), 
	"ENVNAME" VARCHAR2(20 BYTE), 
	"DOMAINTYPE" VARCHAR2(20 BYTE), 
	"CLUSTERNAME" VARCHAR2(20 BYTE), 
	"ADMINUSERNAME" VARCHAR2(20 BYTE), 
	"ADMINENCRYPTEDPASSWORD" VARCHAR2(100 BYTE), 
	"OPT_HOME" VARCHAR2(20 BYTE), 
	"UNIXUSER" VARCHAR2(20 BYTE), 
	"NMPORT" VARCHAR2(5 BYTE), 
	"FRONTENDHOST" VARCHAR2(100 BYTE), 
	"FRONTENDHTTPPORT" VARCHAR2(5 BYTE), 
	"FRONTENDHTTPSPORT" VARCHAR2(5 BYTE), 
	"SCHEMA_NAME_SOAINFRA" VARCHAR2(30 BYTE), 
	"SCHEMA_NAME_MDS" VARCHAR2(20 BYTE), 
	"DOMAINNUMBER" VARCHAR2(20 BYTE), 
	"ISSECURE" NUMBER(1,0) DEFAULT 0, 
	"NIC" VARCHAR2(20 BYTE) DEFAULT 'bond0', 
	"NETMASK" VARCHAR2(20 BYTE) DEFAULT '255.255.255.0'
   ) ;

   COMMENT ON COLUMN "ACME_DOMAINS"."ISSECURE" IS 'ISSECURE = 1 for domains where WLST should use t3s';
   COMMENT ON COLUMN "ACME_DOMAINS"."NIC" IS 'this is the NIC that nodemanager and VIPs should be using';
/
--------------------------------------------------------
--  DDL for Table ACME_ENVIRONMENT_CHECKS
--------------------------------------------------------

  CREATE TABLE "ACME_ENVIRONMENT_CHECKS" 
   (	"NAME" VARCHAR2(50 BYTE), 
	"DESCRIPTION" VARCHAR2(150 BYTE), 
	"ARGUMENTS" VARCHAR2(100 BYTE), 
	"TYPE" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_ENVS
--------------------------------------------------------

  CREATE TABLE "ACME_ENVS" 
   (	"ENVNAME" VARCHAR2(20 BYTE), 
	"PREFIX" VARCHAR2(10 BYTE), 
	"JKSFILE" VARCHAR2(40 BYTE), 
	"PKALIAS" VARCHAR2(50 BYTE), 
	"HASLOADBALANCER" NUMBER
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_ERRORCODES
--------------------------------------------------------

  CREATE TABLE "ACME_ERRORCODES" 
   (	"ERRORCODE" VARCHAR2(100 BYTE), 
	"ISRETRIABLE" NUMBER, 
	"ISCUSTOM" NUMBER
   ) ;

   COMMENT ON COLUMN "ACME_ERRORCODES"."ERRORCODE" IS 'Covers all ErrorCodes used in OSB project';
/
--------------------------------------------------------
--  DDL for Table ACME_ERRORCODES2
--------------------------------------------------------

  CREATE TABLE "ACME_ERRORCODES2" 
   (	"ERRORCODE" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE), 
	"TECHNICAL" VARCHAR2(10 BYTE), 
	"SUBCATEGORY" VARCHAR2(100 BYTE), 
	"ISRETRIABLE" NUMBER, 
	"ISCUSTOM" NUMBER, 
	"PROJECT" VARCHAR2(100 BYTE), 
	"INTERFACE" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_FILEPOLLERS
--------------------------------------------------------

  CREATE TABLE "ACME_FILEPOLLERS" 
   (	"DIRECTORY" VARCHAR2(150 BYTE), 
	"PROXYSERVICE" VARCHAR2(150 BYTE), 
	"OSBPROJECT" VARCHAR2(100 BYTE), 
	"POLLINGPERIOD" NUMBER, 
	"MASK" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_FILES
--------------------------------------------------------

  CREATE TABLE "ACME_FILES" 
   (	"NAME" VARCHAR2(200 BYTE), 
	"ENVNAME" VARCHAR2(40 BYTE), 
	"FQDN" VARCHAR2(50 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_FILESTORES
--------------------------------------------------------

  CREATE TABLE "ACME_FILESTORES" 
   (	"FILESTORENAME" VARCHAR2(50 BYTE), 
	"DIRECTORY" VARCHAR2(100 BYTE), 
	"ID" NUMBER, 
	"DOMAINNAMES" VARCHAR2(200 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_FILESYSTEMS
--------------------------------------------------------

  CREATE TABLE "ACME_FILESYSTEMS" 
   (	"NAME" VARCHAR2(100 BYTE), 
	"DOMAINNAMES" VARCHAR2(50 BYTE), 
	"OSBPROJECTS" VARCHAR2(100 BYTE), 
	"MOUNT_GROUP" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_FIREWALLS
--------------------------------------------------------

  CREATE TABLE "ACME_FIREWALLS" 
   (	"FROMHOST" VARCHAR2(20 BYTE), 
	"PORT" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE), 
	"TOHOST" VARCHAR2(40 BYTE), 
	"FIREWALLNAME" VARCHAR2(50 BYTE), 
	"ENVNAME" VARCHAR2(20 BYTE), 
	"ACL" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_FTPSERVERS
--------------------------------------------------------

  CREATE TABLE "ACME_FTPSERVERS" 
   (	"HOST" VARCHAR2(40 BYTE), 
	"USERNAME" VARCHAR2(20 BYTE), 
	"ENCRYPTED_PASSWORD" VARCHAR2(100 BYTE), 
	"FOLDERS" VARCHAR2(200 BYTE), 
	"PORT" VARCHAR2(20 BYTE), 
	"DOMAIN_GROUP" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_GROUPS
--------------------------------------------------------

  CREATE TABLE "ACME_GROUPS" 
   (	"GROUPNAME" VARCHAR2(30 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_HQ_CUSTOM_METRICS
--------------------------------------------------------

  CREATE TABLE "ACME_HQ_CUSTOM_METRICS" 
   (	"PROTOTYPE_NAME" VARCHAR2(100 BYTE), 
	"METRICS" VARCHAR2(300 BYTE), 
	"NOTES" VARCHAR2(200 BYTE), 
	"MBEAN_OBJECTNAME" VARCHAR2(200 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_HQ_GROUPS
--------------------------------------------------------

  CREATE TABLE "ACME_HQ_GROUPS" 
   (	"GROUP_NAME" VARCHAR2(20 BYTE), 
	"RESOURCE_PROTOTYPE" VARCHAR2(100 BYTE), 
	"GROUP_CONDITION" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_HQ_METRICTEMPLATES
--------------------------------------------------------

  CREATE TABLE "ACME_HQ_METRICTEMPLATES" 
   (	"PROTOTYPE_NAME" VARCHAR2(200 BYTE), 
	"METRICTEMPLATENAME" VARCHAR2(200 BYTE), 
	"NOTES" VARCHAR2(1000 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_HQ_PRIORITIES
--------------------------------------------------------

  CREATE TABLE "ACME_HQ_PRIORITIES" 
   (	"PRIORITY_NUMBER" VARCHAR2(2 BYTE), 
	"DESCRIPTION" VARCHAR2(1000 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_HQ_PROTOTYPES
--------------------------------------------------------

  CREATE TABLE "ACME_HQ_PROTOTYPES" 
   (	"PROTOTYPE_NAME" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_HQ_RESOURCE_ALERT
--------------------------------------------------------

  CREATE TABLE "ACME_HQ_RESOURCE_ALERT" 
   (	"RESOURCE_TYPE" VARCHAR2(100 BYTE), 
	"ALERT_TYPE" VARCHAR2(40 BYTE), 
	"RESOURCE_GROUP" VARCHAR2(40 BYTE), 
	"ALERT_CONDITION" VARCHAR2(200 BYTE), 
	"NOTES" VARCHAR2(300 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_HQ_RESOURCES
--------------------------------------------------------

  CREATE TABLE "ACME_HQ_RESOURCES" 
   (	"RESOURCE_NAME" VARCHAR2(200 BYTE), 
	"PROTOTYPE_NAME" VARCHAR2(100 BYTE), 
	"PLATFORM" VARCHAR2(40 BYTE), 
	"SERVER" VARCHAR2(20 BYTE), 
	"TBD" NUMBER DEFAULT 0, 
	"AUTODISCOVERED" VARCHAR2(1 BYTE) DEFAULT 1, 
	"PROJECT" VARCHAR2(20 BYTE), 
	"ENV" VARCHAR2(10 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_INTERFACES
--------------------------------------------------------

  CREATE TABLE "ACME_INTERFACES" 
   (	"IFNAME" VARCHAR2(100 BYTE), 
	"SAMPLEINPUTPAYLOAD" VARCHAR2(200 BYTE), 
	"SAMPLEOUTPUTPAYLOAD" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"PROJECTNAME" VARCHAR2(20 BYTE), 
	"AVERAGE_DAILY_LOAD" NUMBER, 
	"MAX_DAILY_LOAD" NUMBER, 
	"IS_ALERTING_ENABLED" NUMBER DEFAULT 1, 
	"IS_ARCHIVING_ENABLED" NUMBER DEFAULT 1
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_INTERFACES_SEQUENCEDIAG
--------------------------------------------------------

  CREATE TABLE "ACME_INTERFACES_SEQUENCEDIAG" 
   (	"IFNAME" VARCHAR2(50 BYTE), 
	"SEQUENCENUMBER" NUMBER, 
	"OPERATION" VARCHAR2(50 BYTE), 
	"SERVICEFULLPATH" VARCHAR2(200 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_INTERFACES_STEPS
--------------------------------------------------------

  CREATE TABLE "ACME_INTERFACES_STEPS" 
   (	"IFNAME" VARCHAR2(100 BYTE), 
	"STEP_NUMBER" NUMBER, 
	"ARTIFACT" VARCHAR2(200 BYTE), 
	"ARTIFACT_TYPE" VARCHAR2(20 BYTE), 
	"EVENT_TYPE" VARCHAR2(50 BYTE), 
	"ISFIRST" NUMBER, 
	"ISLAST" NUMBER
   ) ;

   COMMENT ON COLUMN "ACME_INTERFACES_STEPS"."ISFIRST" IS 'ISFIRST in (0,1)';
   COMMENT ON COLUMN "ACME_INTERFACES_STEPS"."ISLAST" IS 'ISLAST  in (0,1)';
/
--------------------------------------------------------
--  DDL for Table ACME_JARS
--------------------------------------------------------

  CREATE TABLE "ACME_JARS" 
   (	"JARNAME" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(200 BYTE), 
	"USEDBY" VARCHAR2(200 BYTE), 
	"POSITION" VARCHAR2(100 BYTE), 
	"POMDEPENDENCY" VARCHAR2(300 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_JDBCDRIVERS
--------------------------------------------------------

  CREATE TABLE "ACME_JDBCDRIVERS" 
   (	"JDBCDRIVER" VARCHAR2(100 BYTE), 
	"TEST_TABLE_NAME" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_JMSCONNFACTORY
--------------------------------------------------------

  CREATE TABLE "ACME_JMSCONNFACTORY" 
   (	"JMSNAME" VARCHAR2(40 BYTE), 
	"JNDINAME" VARCHAR2(100 BYTE), 
	"JMSMODULENAME" VARCHAR2(40 BYTE), 
	"ID" NUMBER, 
	"XA" NUMBER, 
	"EXTRA_PARAMETERS" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_JMSMODULES
--------------------------------------------------------

  CREATE TABLE "ACME_JMSMODULES" 
   (	"JMSMODULENAME" VARCHAR2(40 BYTE), 
	"PROJECTNAME" VARCHAR2(20 BYTE), 
	"OSBPROJECTNAME" VARCHAR2(40 BYTE), 
	"ID" NUMBER, 
	"SUBDEPLOYMENTNAME" VARCHAR2(40 BYTE), 
	"JMSSERVERNAME" VARCHAR2(50 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_JMSQUEUES
--------------------------------------------------------

  CREATE TABLE "ACME_JMSQUEUES" 
   (	"JMSNAME" VARCHAR2(40 BYTE), 
	"JNDINAME" VARCHAR2(100 BYTE), 
	"REPROCESSQUEUE" VARCHAR2(40 BYTE), 
	"JMSMODULENAME" VARCHAR2(40 BYTE), 
	"ISERRORQUEUE" NUMBER(1,0), 
	"IFNAME" VARCHAR2(50 BYTE), 
	"QUEUETYPE" VARCHAR2(15 BYTE), 
	"ID" NUMBER
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_JMSSERVERS
--------------------------------------------------------

  CREATE TABLE "ACME_JMSSERVERS" 
   (	"JMSSERVERNAME" VARCHAR2(50 BYTE), 
	"FILESTORENAME" VARCHAR2(50 BYTE), 
	"ID" NUMBER
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_KNOWN_ISSUES
--------------------------------------------------------

  CREATE TABLE "ACME_KNOWN_ISSUES" 
   (	"MESSAGE" VARCHAR2(500 BYTE), 
	"DESCRIPTION" VARCHAR2(2000 BYTE), 
	"ID" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_LOADBALANCERS
--------------------------------------------------------

  CREATE TABLE "ACME_LOADBALANCERS" 
   (	"CNAME" VARCHAR2(50 BYTE), 
	"IP" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_MACHINES
--------------------------------------------------------

  CREATE TABLE "ACME_MACHINES" 
   (	"MACHINENAME" VARCHAR2(30 BYTE), 
	"IPLISTENADDRESS" VARCHAR2(50 BYTE), 
	"VIP" VARCHAR2(40 BYTE), 
	"ENVNAME" VARCHAR2(40 BYTE), 
	"FQDN" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_MOUNTS
--------------------------------------------------------

  CREATE TABLE "ACME_MOUNTS" 
   (	"MOUNT_NAME" VARCHAR2(100 BYTE), 
	"MOUNT_TYPE" VARCHAR2(20 BYTE), 
	"ENVNAME" VARCHAR2(20 BYTE), 
	"SERVER_NAME" VARCHAR2(40 BYTE), 
	"LOGIN" VARCHAR2(50 BYTE), 
	"PW" VARCHAR2(30 BYTE), 
	"OS" VARCHAR2(20 BYTE), 
	"REMOTE_PATH" VARCHAR2(50 BYTE), 
	"LOCAL_PATH_ON_REMOTE" VARCHAR2(50 BYTE), 
	"REMOTE_DEVICE" VARCHAR2(100 BYTE), 
	"LOCAL_PATH" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_MOUNTSLOCAL
--------------------------------------------------------

  CREATE TABLE "ACME_MOUNTSLOCAL" 
   (	"NAME" VARCHAR2(20 BYTE), 
	"PATH" VARCHAR2(100 BYTE), 
	"MOUNTEDON" VARCHAR2(100 BYTE), 
	"ENVNAME" VARCHAR2(20 BYTE), 
	"TYPE" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_NIC
--------------------------------------------------------

  CREATE TABLE "ACME_NIC" 
   (	"NICNAME" VARCHAR2(20 BYTE), 
	"MACHINE" VARCHAR2(20 BYTE), 
	"IP" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_OSBPROJECTS
--------------------------------------------------------

  CREATE TABLE "ACME_OSBPROJECTS" 
   (	"OSBPROJECTNAME" VARCHAR2(50 BYTE), 
	"MESSAGESPERDAYMAX" NUMBER(10,0), 
	"PROJECTNAME" VARCHAR2(50 BYTE), 
	"DEPLOYMENT_ORDER" NUMBER DEFAULT 1, 
	"MESSAGESPERDAYMIN" NUMBER(10,0)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_OSBREPORTS_LEGALPROPS
--------------------------------------------------------

  CREATE TABLE "ACME_OSBREPORTS_LEGALPROPS" 
   (	"PROPERTY_NAME" VARCHAR2(50 BYTE), 
	"PROPERTY_DESCRIPTION" VARCHAR2(300 BYTE), 
	"DEFAULT_VALUE" VARCHAR2(200 BYTE), 
	"PROPERTY_GROUP" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_OSBREPORTS_PROPS
--------------------------------------------------------

  CREATE TABLE "ACME_OSBREPORTS_PROPS" 
   (	"PROPERTY_NAME" VARCHAR2(50 BYTE), 
	"PROPERTY_VALUE" VARCHAR2(200 BYTE), 
	"DOMAINNAME" VARCHAR2(200 BYTE), 
	"USERNAME" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_PROJECTS
--------------------------------------------------------

  CREATE TABLE "ACME_PROJECTS" 
   (	"PROJECTNAME" VARCHAR2(20 BYTE), 
	"DOMAINNUMBER" VARCHAR2(20 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"BUSINESSAREA" VARCHAR2(20 BYTE), 
	"REMARKS" VARCHAR2(100 BYTE), 
	"STATUS" VARCHAR2(20 BYTE) DEFAULT 'ACTIVE'
   ) ;

   COMMENT ON TABLE "ACME_PROJECTS"  IS 'OSB projects and their respective domain group details';
/
--------------------------------------------------------
--  DDL for Table ACME_SERVERS
--------------------------------------------------------

  CREATE TABLE "ACME_SERVERS" 
   (	"DOMAINNAME" VARCHAR2(20 BYTE), 
	"SERVERNAME" VARCHAR2(20 BYTE), 
	"ISADMIN" NUMBER(1,0), 
	"MACHINENAME" VARCHAR2(20 BYTE), 
	"PORT" VARCHAR2(5 BYTE), 
	"LISTEN_ADDRESS_VIP" VARCHAR2(100 BYTE), 
	"FLOATING_IP" VARCHAR2(20 BYTE), 
	"COH_PORT" VARCHAR2(4 BYTE)
   ) ;

   COMMENT ON TABLE "ACME_SERVERS"  IS 'All NESOAV2 server details for DEV,FUT,TEST, PPRD and PRD';
/
--------------------------------------------------------
--  DDL for Table ACME_SERVICE_DEPENDENCIES
--------------------------------------------------------

  CREATE TABLE "ACME_SERVICE_DEPENDENCIES" 
   (	"SERVICE" VARCHAR2(200 BYTE), 
	"DEPENDENTSERVICE" VARCHAR2(200 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_SERVICE_TYPES
--------------------------------------------------------

  CREATE TABLE "ACME_SERVICE_TYPES" 
   (	"TYPE" VARCHAR2(30 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_SERVICES
--------------------------------------------------------

  CREATE TABLE "ACME_SERVICES" 
   (	"SERVICENAME" VARCHAR2(150 BYTE), 
	"SERVICEFULLPATH" VARCHAR2(200 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"SERVICE_URI" VARCHAR2(150 BYTE), 
	"OSBPROJECTNAME" VARCHAR2(50 BYTE), 
	"WORKMANAGER_NAME" VARCHAR2(40 BYTE), 
	"ISPS" NUMBER DEFAULT 1, 
	"ISHTTPSREQUIRED" NUMBER DEFAULT 0, 
	"ISPUBLICHTTP" NUMBER DEFAULT 0, 
	"DESCRIPTION" VARCHAR2(200 BYTE)
   ) ;

   COMMENT ON COLUMN "ACME_SERVICES"."ISPUBLICHTTP" IS 'if 1, this HTTP endpoint will be exposed to the load balancer';
/
--------------------------------------------------------
--  DDL for Table ACME_USER_ROLE
--------------------------------------------------------

  CREATE TABLE "ACME_USER_ROLE" 
   (	"WEBLOGIC_GROUP" VARCHAR2(100 BYTE), 
	"DOMAIN_GROUP" VARCHAR2(20 BYTE), 
	"ACME_ROLE" VARCHAR2(3 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_USERS
--------------------------------------------------------

  CREATE TABLE "ACME_USERS" 
   (	"USERNAME" VARCHAR2(20 BYTE), 
	"ACME_ROLE" VARCHAR2(3 BYTE), 
	"STATUS" VARCHAR2(10 BYTE) DEFAULT 'ACTIVE', 
	"EMAIL" VARCHAR2(100 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_VERSION
--------------------------------------------------------

  CREATE TABLE "ACME_VERSION" 
   (	"VERSIONNUMBER" VARCHAR2(20 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Table ACME_WORKMANAGERS
--------------------------------------------------------

  CREATE TABLE "ACME_WORKMANAGERS" 
   (	"WORKMANAGER_NAME" VARCHAR2(40 BYTE), 
	"DESCRIPTION" VARCHAR2(60 BYTE)
   ) ;
/
--------------------------------------------------------
--  DDL for Index ACME_ALERTS_INDEX1
--------------------------------------------------------

  CREATE INDEX "ACME_ALERTS_INDEX1" ON "ACME_ALERTS" ("ERRORCODE", "INTERFACEID") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_BUILD_F_AND_R_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_BUILD_F_AND_R_PK" ON "ACME_BUILD_F_AND_R" ("DOMAINNAMES", "PROPERTYNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_BUILD_F_AND_R_PROP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_BUILD_F_AND_R_PROP_PK" ON "ACME_BUILD_F_AND_R_PROPS" ("PROPERTYNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DATABASE_SCHEMAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DATABASE_SCHEMAS_PK" ON "ACME_DATABASE_SCHEMAS" ("SCHEMA_NAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DATABASES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DATABASES_PK" ON "ACME_DATABASES" ("DBNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DATASOURCES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DATASOURCES_UK1" ON "ACME_DATASOURCES" ("DSJNDINAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DATASOURCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DATASOURCES_PK" ON "ACME_DATASOURCES" ("DSNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DATASOURCES_ENV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DATASOURCES_ENV_PK" ON "ACME_DATASOURCES_ENV" ("ID") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DATASOURCES_ENV_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DATASOURCES_ENV_UK1" ON "ACME_DATASOURCES_ENV" ("DSNAME", "DOMAINNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DATASOURCES_ENV_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DATASOURCES_ENV_UK2" ON "ACME_DATASOURCES_ENV" ("DSNAME", "SCHEMA_NAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_MULTIDATASOURCES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_MULTIDATASOURCES_PK" ON "ACME_DATASOURCESMULTI" ("DSNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DBADAPTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DBADAPTER_PK" ON "ACME_DBADAPTER" ("JNDINAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DOMAIN_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DOMAIN_GROUP_PK" ON "ACME_DOMAIN_GROUP" ("DOMAIN_GROUP") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DOMAINS_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DOMAINS_UK2" ON "ACME_DOMAINS" ("CLUSTERNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_DOMAINS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_DOMAINS_PK" ON "ACME_DOMAINS" ("DOMAINNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_ENVIRONMENT_CHECKS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_ENVIRONMENT_CHECKS_PK" ON "ACME_ENVIRONMENT_CHECKS" ("NAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_ENVS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_ENVS_PK" ON "ACME_ENVS" ("ENVNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_SYS_C0025531
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_SYS_C0025531" ON "ACME_ERRORCODES" ("ERRORCODE") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_FILEPOLLERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_FILEPOLLERS_PK" ON "ACME_FILEPOLLERS" ("DIRECTORY") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_FILESTORES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_FILESTORES_PK" ON "ACME_FILESTORES" ("ID") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_FILESTORES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_FILESTORES_UK1" ON "ACME_FILESTORES" ("FILESTORENAME", "DOMAINNAMES") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_FILESYSTEMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_FILESYSTEMS_PK" ON "ACME_FILESYSTEMS" ("NAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_GROUPS_PK" ON "ACME_GROUPS" ("GROUPNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_HQ_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_HQ_GROUPS_PK" ON "ACME_HQ_GROUPS" ("GROUP_NAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_HQPROTOTYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_HQPROTOTYPES_PK" ON "ACME_HQ_PROTOTYPES" ("PROTOTYPE_NAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_HQ_RESOURCES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_HQ_RESOURCES_UK1" ON "ACME_HQ_RESOURCES" ("RESOURCE_NAME", "PLATFORM", "ENV") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_INTERFACES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_INTERFACES_PK" ON "ACME_INTERFACES" ("IFNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_INTERFACES_STEPS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_INTERFACES_STEPS_UK1" ON "ACME_INTERFACES_STEPS" ("IFNAME", "STEP_NUMBER") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_INTERFACES_STEPS_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_INTERFACES_STEPS_UK2" ON "ACME_INTERFACES_STEPS" ("IFNAME", "EVENT_TYPE") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JARS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JARS_PK" ON "ACME_JARS" ("JARNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JDBCDRIVERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JDBCDRIVERS_PK" ON "ACME_JDBCDRIVERS" ("JDBCDRIVER") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSCONNFACTORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSCONNFACTORY_PK" ON "ACME_JMSCONNFACTORY" ("JMSNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSCONNFACTORY_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSCONNFACTORY_UK1" ON "ACME_JMSCONNFACTORY" ("JNDINAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSMODULES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSMODULES_PK" ON "ACME_JMSMODULES" ("JMSMODULENAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSMODULES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSMODULES_UK1" ON "ACME_JMSMODULES" ("ID") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSMODULES_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSMODULES_UK2" ON "ACME_JMSMODULES" ("SUBDEPLOYMENTNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSQUEUES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSQUEUES_PK" ON "ACME_JMSQUEUES" ("JMSNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSQUEUES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSQUEUES_UK1" ON "ACME_JMSQUEUES" ("JNDINAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSSERVERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSSERVERS_PK" ON "ACME_JMSSERVERS" ("ID") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_JMSSERVERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_JMSSERVERS_UK1" ON "ACME_JMSSERVERS" ("JMSSERVERNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_KNOWN_ISSUES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_KNOWN_ISSUES_PK" ON "ACME_KNOWN_ISSUES" ("ID") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_KNOWN_ISSUES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_KNOWN_ISSUES_UK1" ON "ACME_KNOWN_ISSUES" ("MESSAGE") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_LOADBALANCERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_LOADBALANCERS_PK" ON "ACME_LOADBALANCERS" ("CNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_MACHINES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_MACHINES_PK" ON "ACME_MACHINES" ("MACHINENAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_MACHINES_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_MACHINES_UK1" ON "ACME_MACHINES" ("FQDN") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_MOUNTPOINTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_MOUNTPOINTS_PK" ON "ACME_MOUNTS" ("MOUNT_NAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_NIC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_NIC_PK" ON "ACME_NIC" ("NICNAME", "MACHINE") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_OSBPROJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_OSBPROJECTS_PK" ON "ACME_OSBPROJECTS" ("OSBPROJECTNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_OSBREPORTS_LEGALPR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_OSBREPORTS_LEGALPR_PK" ON "ACME_OSBREPORTS_LEGALPROPS" ("PROPERTY_NAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_OSBREPORTS_PROPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_OSBREPORTS_PROPS_PK" ON "ACME_OSBREPORTS_PROPS" ("PROPERTY_NAME", "DOMAINNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_PROJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_PROJECTS_PK" ON "ACME_PROJECTS" ("PROJECTNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_SERVERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_SERVERS_UK1" ON "ACME_SERVERS" ("PORT", "LISTEN_ADDRESS_VIP") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_SERVERS_UK2
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_SERVERS_UK2" ON "ACME_SERVERS" ("FLOATING_IP") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_SERVERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_SERVERS_PK" ON "ACME_SERVERS" ("SERVERNAME") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_SERVICE_DEPENDENCI_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_SERVICE_DEPENDENCI_UK1" ON "ACME_SERVICE_DEPENDENCIES" ("SERVICE", "DEPENDENTSERVICE") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_SERVICE_TYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_SERVICE_TYPES_PK" ON "ACME_SERVICE_TYPES" ("TYPE") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_SERVICES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_SERVICES_PK" ON "ACME_SERVICES" ("SERVICEFULLPATH") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_VERSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_VERSION_PK" ON "ACME_VERSION" ("VERSIONNUMBER") 
  ;
/
--------------------------------------------------------
--  DDL for Index ACME_WORKMANAGERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACME_WORKMANAGERS_PK" ON "ACME_WORKMANAGERS" ("WORKMANAGER_NAME") 
  ;
/
--------------------------------------------------------
--  Constraints for Table ACME_ALERTS
--------------------------------------------------------

  ALTER TABLE "ACME_ALERTS" MODIFY ("ISACTIVE" NOT NULL ENABLE);
  ALTER TABLE "ACME_ALERTS" MODIFY ("CREATIONDATE" NOT NULL ENABLE);
  ALTER TABLE "ACME_ALERTS" MODIFY ("TECHNICALMESSAGEID" NOT NULL ENABLE);
  ALTER TABLE "ACME_ALERTS" MODIFY ("INTERFACEID" NOT NULL ENABLE);
  ALTER TABLE "ACME_ALERTS" MODIFY ("ERRORCODE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_BUILD_ACTIONLOG
--------------------------------------------------------

  ALTER TABLE "ACME_BUILD_ACTIONLOG" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "ACME_BUILD_ACTIONLOG" MODIFY ("ACTIONDATE" NOT NULL ENABLE);
  ALTER TABLE "ACME_BUILD_ACTIONLOG" MODIFY ("ACTIONTYPE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_BUILD_F_AND_R
--------------------------------------------------------

  ALTER TABLE "ACME_BUILD_F_AND_R" ADD CONSTRAINT "ACME_BUILD_F_AND_R_PK" PRIMARY KEY ("DOMAINNAMES", "PROPERTYNAME") ENABLE;
  ALTER TABLE "ACME_BUILD_F_AND_R" MODIFY ("TO_VALUE" NOT NULL ENABLE);
  ALTER TABLE "ACME_BUILD_F_AND_R" MODIFY ("PROPERTYNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_BUILD_F_AND_R" MODIFY ("DOMAINNAMES" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_BUILD_F_AND_R_PROPS
--------------------------------------------------------

  ALTER TABLE "ACME_BUILD_F_AND_R_PROPS" MODIFY ("EXECUTION_ORDER" NOT NULL ENABLE);
  ALTER TABLE "ACME_BUILD_F_AND_R_PROPS" ADD CONSTRAINT "ACME_BUILD_F_AND_R_PROP_PK" PRIMARY KEY ("PROPERTYNAME") ENABLE;
  ALTER TABLE "ACME_BUILD_F_AND_R_PROPS" MODIFY ("PROPERTYNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_BUILD_VERSIONS
--------------------------------------------------------

  ALTER TABLE "ACME_BUILD_VERSIONS" MODIFY ("CREATIONDATE" NOT NULL ENABLE);
  ALTER TABLE "ACME_BUILD_VERSIONS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "ACME_BUILD_VERSIONS" MODIFY ("PROJECTNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_DATABASE_SCHEMAS
--------------------------------------------------------

  ALTER TABLE "ACME_DATABASE_SCHEMAS" MODIFY ("SCHEMAOWNER" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATABASE_SCHEMAS" MODIFY ("DBNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATABASE_SCHEMAS" MODIFY ("SCHEMA_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATABASE_SCHEMAS" ADD CONSTRAINT "ACME_DATABASE_SCHEMAS_PK" PRIMARY KEY ("SCHEMA_NAME") ENABLE;
  ALTER TABLE "ACME_DATABASE_SCHEMAS" MODIFY ("ENCRYPTED_PASSWORD" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_DATABASES
--------------------------------------------------------

  ALTER TABLE "ACME_DATABASES" ADD CONSTRAINT "ACME_DATABASES_CHK2" CHECK (TYPE IN ('ORACLE', 'SQLSERVER')) ENABLE;
  ALTER TABLE "ACME_DATABASES" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATABASES" MODIFY ("URL_SERVICE" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATABASES" MODIFY ("HOSTNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATABASES" ADD CONSTRAINT "ACME_DATABASES_CHK1" CHECK (ISRAC IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_DATABASES" MODIFY ("ISRAC" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATABASES" ADD CONSTRAINT "ACME_DATABASES_PK" PRIMARY KEY ("DBNAME") ENABLE;
  ALTER TABLE "ACME_DATABASES" MODIFY ("PORT" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATABASES" MODIFY ("DBNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_DATASOURCES
--------------------------------------------------------

  ALTER TABLE "ACME_DATASOURCES" MODIFY ("DSNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATASOURCES" MODIFY ("PROJECT" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATASOURCES" MODIFY ("ISXA" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATASOURCES" ADD CONSTRAINT "ACME_DATASOURCES_CHK1" CHECK (TARGET_TO IN ('CLUSTER', 'CLUSTER_AND_ADMIN', 'ADMIN', 'ALLSERVERS')) ENABLE;
  ALTER TABLE "ACME_DATASOURCES" ADD CONSTRAINT "ACME_DATASOURCES_UK1" UNIQUE ("DSJNDINAME") ENABLE;
  ALTER TABLE "ACME_DATASOURCES" ADD CONSTRAINT "ACME_DATASOURCES_PK" PRIMARY KEY ("DSNAME") ENABLE;
  ALTER TABLE "ACME_DATASOURCES" ADD CONSTRAINT "ACME_DATASOURCES_CHK2" CHECK (ISXA IN (0, 1)) ENABLE;
/
--------------------------------------------------------
--  Constraints for Table ACME_DATASOURCES_ENV
--------------------------------------------------------

  ALTER TABLE "ACME_DATASOURCES_ENV" ADD CONSTRAINT "ACME_DATASOURCES_ENV_UK2" UNIQUE ("DSNAME", "SCHEMA_NAME") ENABLE;
  ALTER TABLE "ACME_DATASOURCES_ENV" MODIFY ("DOMAINNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATASOURCES_ENV" MODIFY ("DSNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATASOURCES_ENV" ADD CONSTRAINT "ACME_DATASOURCES_ENV_UK1" UNIQUE ("DSNAME", "DOMAINNAME") ENABLE;
  ALTER TABLE "ACME_DATASOURCES_ENV" ADD CONSTRAINT "ACME_DATASOURCES_ENV_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "ACME_DATASOURCES_ENV" MODIFY ("ID" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_DATASOURCESMULTI
--------------------------------------------------------

  ALTER TABLE "ACME_DATASOURCESMULTI" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATASOURCESMULTI" MODIFY ("DSJNDINAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATASOURCESMULTI" MODIFY ("DSNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DATASOURCESMULTI" MODIFY ("DOMAINNAMES" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_DBADAPTER
--------------------------------------------------------

  ALTER TABLE "ACME_DBADAPTER" ADD CONSTRAINT "ACME_DBADAPTER_PK" PRIMARY KEY ("JNDINAME") ENABLE;
  ALTER TABLE "ACME_DBADAPTER" MODIFY ("JNDINAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_DOMAIN_GROUP
--------------------------------------------------------

  ALTER TABLE "ACME_DOMAIN_GROUP" ADD CONSTRAINT "ACME_DOMAIN_GROUP_PK" PRIMARY KEY ("DOMAIN_GROUP") ENABLE;
  ALTER TABLE "ACME_DOMAIN_GROUP" MODIFY ("DOMAINNAMES" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAIN_GROUP" MODIFY ("DOMAIN_GROUP" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_DOMAINS
--------------------------------------------------------

  ALTER TABLE "ACME_DOMAINS" ADD CONSTRAINT "ACME_DOMAINS_CHK2" CHECK (DOMAINNUMBER IN ('1', '2', '3', '4', 'ALL', 'NONE')) ENABLE;
  ALTER TABLE "ACME_DOMAINS" MODIFY ("NMPORT" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" MODIFY ("UNIXUSER" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" MODIFY ("OPT_HOME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" ADD CONSTRAINT "ACME_DOMAINS_PK" PRIMARY KEY ("DOMAINNAME") ENABLE;
  ALTER TABLE "ACME_DOMAINS" MODIFY ("ENVNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" ADD CONSTRAINT "ACME_DOMAINS_CHK1" CHECK (DOMAINTYPE IN ('OSB', 'EMGC', 'WEBLOGIC')) ENABLE;
  ALTER TABLE "ACME_DOMAINS" MODIFY ("SCHEMA_NAME_MDS" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" MODIFY ("SCHEMA_NAME_SOAINFRA" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" MODIFY ("DOMAINNUMBER" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" MODIFY ("NETMASK" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" MODIFY ("NIC" NOT NULL ENABLE);
  ALTER TABLE "ACME_DOMAINS" MODIFY ("ISSECURE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_ENVIRONMENT_CHECKS
--------------------------------------------------------

  ALTER TABLE "ACME_ENVIRONMENT_CHECKS" ADD CONSTRAINT "ACME_ENVIRONMENT_CHECK_CHK1" CHECK (TYPE IN ('FILEEXISTS', 'DIRECTORYEXISTS')) ENABLE;
  ALTER TABLE "ACME_ENVIRONMENT_CHECKS" ADD CONSTRAINT "ACME_ENVIRONMENT_CHECKS_PK" PRIMARY KEY ("NAME") ENABLE;
  ALTER TABLE "ACME_ENVIRONMENT_CHECKS" MODIFY ("NAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_ENVS
--------------------------------------------------------

  ALTER TABLE "ACME_ENVS" ADD CONSTRAINT "ACME_ENVS_PK" PRIMARY KEY ("ENVNAME") ENABLE;
  ALTER TABLE "ACME_ENVS" MODIFY ("ENVNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_ENVS" MODIFY ("PKALIAS" NOT NULL ENABLE);
  ALTER TABLE "ACME_ENVS" MODIFY ("JKSFILE" NOT NULL ENABLE);
  ALTER TABLE "ACME_ENVS" MODIFY ("PREFIX" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_ERRORCODES
--------------------------------------------------------

  ALTER TABLE "ACME_ERRORCODES" ADD CONSTRAINT "ACME_ERRORCODES_CHK1" CHECK (ISCUSTOM IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_ERRORCODES" MODIFY ("ISCUSTOM" NOT NULL ENABLE);
  ALTER TABLE "ACME_ERRORCODES" MODIFY ("ISRETRIABLE" NOT NULL ENABLE);
  ALTER TABLE "ACME_ERRORCODES" ADD CONSTRAINT "ACME_ERRORCODES_PK" PRIMARY KEY ("ERRORCODE") ENABLE;
  ALTER TABLE "ACME_ERRORCODES" ADD CONSTRAINT "ACME_ERRORCODES_CK" CHECK (ISRETRIABLE in (0, 1)) ENABLE;
  ALTER TABLE "ACME_ERRORCODES" MODIFY ("ERRORCODE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_ERRORCODES2
--------------------------------------------------------

  ALTER TABLE "ACME_ERRORCODES2" ADD CONSTRAINT "ACME_ERRORCODES2_CHK3" CHECK (ISRETRIABLE IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_ERRORCODES2" ADD CONSTRAINT "ACME_ERRORCODES2_CHK2" CHECK (ISCUSTOM IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_ERRORCODES2" MODIFY ("TECHNICAL" NOT NULL ENABLE);
  ALTER TABLE "ACME_ERRORCODES2" MODIFY ("ISRETRIABLE" NOT NULL ENABLE);
  ALTER TABLE "ACME_ERRORCODES2" MODIFY ("ISCUSTOM" NOT NULL ENABLE);
  ALTER TABLE "ACME_ERRORCODES2" MODIFY ("ERRORCODE" NOT NULL ENABLE);
  ALTER TABLE "ACME_ERRORCODES2" ADD CONSTRAINT "ACME_ERRORCODES2_CHK1" CHECK (TECHNICAL IN ('B', 'T')) ENABLE;
/
--------------------------------------------------------
--  Constraints for Table ACME_FILEPOLLERS
--------------------------------------------------------

  ALTER TABLE "ACME_FILEPOLLERS" ADD CONSTRAINT "ACME_FILEPOLLERS_PK" PRIMARY KEY ("DIRECTORY") ENABLE;
  ALTER TABLE "ACME_FILEPOLLERS" MODIFY ("POLLINGPERIOD" NOT NULL ENABLE);
  ALTER TABLE "ACME_FILEPOLLERS" MODIFY ("OSBPROJECT" NOT NULL ENABLE);
  ALTER TABLE "ACME_FILEPOLLERS" MODIFY ("PROXYSERVICE" NOT NULL ENABLE);
  ALTER TABLE "ACME_FILEPOLLERS" MODIFY ("DIRECTORY" NOT NULL ENABLE);
  ALTER TABLE "ACME_FILEPOLLERS" MODIFY ("MASK" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_FILES
--------------------------------------------------------

  ALTER TABLE "ACME_FILES" MODIFY ("NAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_FILESTORES
--------------------------------------------------------

  ALTER TABLE "ACME_FILESTORES" ADD CONSTRAINT "ACME_FILESTORES_UK1" UNIQUE ("FILESTORENAME", "DOMAINNAMES") ENABLE;
  ALTER TABLE "ACME_FILESTORES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ACME_FILESTORES" ADD CONSTRAINT "ACME_FILESTORES_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "ACME_FILESTORES" MODIFY ("DIRECTORY" NOT NULL ENABLE);
  ALTER TABLE "ACME_FILESTORES" MODIFY ("FILESTORENAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_FILESTORES" MODIFY ("DOMAINNAMES" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_FILESYSTEMS
--------------------------------------------------------

  ALTER TABLE "ACME_FILESYSTEMS" ADD CONSTRAINT "ACME_FILESYSTEMS_PK" PRIMARY KEY ("NAME") ENABLE;
  ALTER TABLE "ACME_FILESYSTEMS" MODIFY ("DOMAINNAMES" NOT NULL ENABLE);
  ALTER TABLE "ACME_FILESYSTEMS" MODIFY ("NAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_FIREWALLS
--------------------------------------------------------

  ALTER TABLE "ACME_FIREWALLS" MODIFY ("TOHOST" NOT NULL ENABLE);
  ALTER TABLE "ACME_FIREWALLS" MODIFY ("PORT" NOT NULL ENABLE);
  ALTER TABLE "ACME_FIREWALLS" MODIFY ("FROMHOST" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_GROUPS
--------------------------------------------------------

  ALTER TABLE "ACME_GROUPS" ADD CONSTRAINT "ACME_GROUPS_PK" PRIMARY KEY ("GROUPNAME") ENABLE;
  ALTER TABLE "ACME_GROUPS" MODIFY ("GROUPNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_HQ_CUSTOM_METRICS
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_CUSTOM_METRICS" MODIFY ("PROTOTYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_CUSTOM_METRICS" MODIFY ("METRICS" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_HQ_GROUPS
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_GROUPS" MODIFY ("GROUP_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_GROUPS" MODIFY ("RESOURCE_PROTOTYPE" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_GROUPS" MODIFY ("GROUP_CONDITION" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_GROUPS" ADD CONSTRAINT "ACME_HQ_GROUPS_PK" PRIMARY KEY ("GROUP_NAME") ENABLE;
/
--------------------------------------------------------
--  Constraints for Table ACME_HQ_PRIORITIES
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_PRIORITIES" MODIFY ("PRIORITY_NUMBER" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_HQ_PROTOTYPES
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_PROTOTYPES" MODIFY ("PROTOTYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_PROTOTYPES" ADD CONSTRAINT "ACME_HQPROTOTYPES_PK" PRIMARY KEY ("PROTOTYPE_NAME") ENABLE;
/
--------------------------------------------------------
--  Constraints for Table ACME_HQ_RESOURCE_ALERT
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_RESOURCE_ALERT" MODIFY ("ALERT_TYPE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_HQ_RESOURCES
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_RESOURCES" MODIFY ("RESOURCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_RESOURCES" MODIFY ("PROTOTYPE_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_RESOURCES" MODIFY ("TBD" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_RESOURCES" MODIFY ("AUTODISCOVERED" NOT NULL ENABLE);
  ALTER TABLE "ACME_HQ_RESOURCES" ADD CONSTRAINT "ACME_HQ_RESOURCES_UK1" UNIQUE ("RESOURCE_NAME", "PLATFORM", "ENV") ENABLE;
/
--------------------------------------------------------
--  Constraints for Table ACME_INTERFACES
--------------------------------------------------------

  ALTER TABLE "ACME_INTERFACES" MODIFY ("IS_ALERTING_ENABLED" NOT NULL ENABLE);
  ALTER TABLE "ACME_INTERFACES" MODIFY ("IS_ARCHIVING_ENABLED" NOT NULL ENABLE);
  ALTER TABLE "ACME_INTERFACES" ADD CONSTRAINT "ACME_INTERFACES_PK" PRIMARY KEY ("IFNAME") ENABLE;
  ALTER TABLE "ACME_INTERFACES" MODIFY ("IFNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_INTERFACES" MODIFY ("PROJECTNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_INTERFACES_SEQUENCEDIAG
--------------------------------------------------------

  ALTER TABLE "ACME_INTERFACES_SEQUENCEDIAG" MODIFY ("SERVICEFULLPATH" NOT NULL ENABLE);
  ALTER TABLE "ACME_INTERFACES_SEQUENCEDIAG" MODIFY ("IFNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_INTERFACES_STEPS
--------------------------------------------------------

  ALTER TABLE "ACME_INTERFACES_STEPS" ADD CONSTRAINT "ACME_INTERFACES_STEPS_CHK3" CHECK (ISFIRST IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_INTERFACES_STEPS" ADD CONSTRAINT "ACME_INTERFACES_STEPS_CHK2" CHECK (ISLAST IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_INTERFACES_STEPS" MODIFY ("ISLAST" NOT NULL ENABLE);
  ALTER TABLE "ACME_INTERFACES_STEPS" MODIFY ("ISFIRST" NOT NULL ENABLE);
  ALTER TABLE "ACME_INTERFACES_STEPS" ADD CONSTRAINT "ACME_INTERFACES_STEPS_UK2" UNIQUE ("IFNAME", "EVENT_TYPE") ENABLE;
  ALTER TABLE "ACME_INTERFACES_STEPS" ADD CONSTRAINT "ACME_INTERFACES_STEPS_UK1" UNIQUE ("IFNAME", "STEP_NUMBER") ENABLE;
  ALTER TABLE "ACME_INTERFACES_STEPS" ADD CONSTRAINT "ACME_INTERFACES_STEPS_CHK1" CHECK (ARTIFACT_TYPE IN ('FOLDER', 'PS', 'BS', 'JMS', 'FTP', 'HTTP')) ENABLE;
  ALTER TABLE "ACME_INTERFACES_STEPS" MODIFY ("IFNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_JARS
--------------------------------------------------------

  ALTER TABLE "ACME_JARS" ADD CONSTRAINT "ACME_JARS_PK" PRIMARY KEY ("JARNAME") ENABLE;
  ALTER TABLE "ACME_JARS" MODIFY ("JARNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_JDBCDRIVERS
--------------------------------------------------------

  ALTER TABLE "ACME_JDBCDRIVERS" ADD CONSTRAINT "ACME_JDBCDRIVERS_PK" PRIMARY KEY ("JDBCDRIVER") ENABLE;
  ALTER TABLE "ACME_JDBCDRIVERS" MODIFY ("JDBCDRIVER" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_JMSCONNFACTORY
--------------------------------------------------------

  ALTER TABLE "ACME_JMSCONNFACTORY" ADD CONSTRAINT "ACME_JMSCONNFACTORY_CHK1" CHECK (XA IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_JMSCONNFACTORY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSCONNFACTORY" ADD CONSTRAINT "ACME_JMSCONNFACTORY_UK1" UNIQUE ("JNDINAME") ENABLE;
  ALTER TABLE "ACME_JMSCONNFACTORY" ADD CONSTRAINT "ACME_JMSCONNFACTORY_PK" PRIMARY KEY ("JMSNAME") ENABLE;
  ALTER TABLE "ACME_JMSCONNFACTORY" MODIFY ("JMSMODULENAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSCONNFACTORY" MODIFY ("JMSNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSCONNFACTORY" MODIFY ("XA" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_JMSMODULES
--------------------------------------------------------

  ALTER TABLE "ACME_JMSMODULES" MODIFY ("PROJECTNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSMODULES" ADD CONSTRAINT "ACME_JMSMODULES_PK" PRIMARY KEY ("JMSMODULENAME") ENABLE;
  ALTER TABLE "ACME_JMSMODULES" MODIFY ("JMSMODULENAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSMODULES" MODIFY ("JMSSERVERNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSMODULES" ADD CONSTRAINT "ACME_JMSMODULES_UK2" UNIQUE ("SUBDEPLOYMENTNAME") ENABLE;
  ALTER TABLE "ACME_JMSMODULES" ADD CONSTRAINT "ACME_JMSMODULES_UK1" UNIQUE ("ID") ENABLE;
  ALTER TABLE "ACME_JMSMODULES" MODIFY ("ID" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_JMSQUEUES
--------------------------------------------------------

  ALTER TABLE "ACME_JMSQUEUES" ADD CONSTRAINT "ACME_JMSQUEUES_UK1" UNIQUE ("JNDINAME") ENABLE;
  ALTER TABLE "ACME_JMSQUEUES" ADD CONSTRAINT "ACME_JMSQUEUES_PK" PRIMARY KEY ("JMSNAME") ENABLE;
  ALTER TABLE "ACME_JMSQUEUES" MODIFY ("JMSNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSQUEUES" MODIFY ("JMSMODULENAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSQUEUES" ADD CONSTRAINT "ACME_JMSQUEUES_CHK1" CHECK (QUEUETYPE IN ('INTERMEDIATE', 'INVALIDMESSAGE', 'REPROCESS')) ENABLE;
  ALTER TABLE "ACME_JMSQUEUES" MODIFY ("IFNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSQUEUES" ADD CONSTRAINT "ACME_JMSQUEUES_CHK2" CHECK (ISERRORQUEUE IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_JMSQUEUES" MODIFY ("QUEUETYPE" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSQUEUES" MODIFY ("ISERRORQUEUE" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSQUEUES" MODIFY ("JNDINAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSQUEUES" MODIFY ("ID" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_JMSSERVERS
--------------------------------------------------------

  ALTER TABLE "ACME_JMSSERVERS" ADD CONSTRAINT "ACME_JMSSERVERS_UK1" UNIQUE ("JMSSERVERNAME") ENABLE;
  ALTER TABLE "ACME_JMSSERVERS" ADD CONSTRAINT "ACME_JMSSERVERS_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "ACME_JMSSERVERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSSERVERS" MODIFY ("FILESTORENAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_JMSSERVERS" MODIFY ("JMSSERVERNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_KNOWN_ISSUES
--------------------------------------------------------

  ALTER TABLE "ACME_KNOWN_ISSUES" ADD CONSTRAINT "ACME_KNOWN_ISSUES_UK1" UNIQUE ("MESSAGE") ENABLE;
  ALTER TABLE "ACME_KNOWN_ISSUES" ADD CONSTRAINT "ACME_KNOWN_ISSUES_PK" PRIMARY KEY ("ID") ENABLE;
  ALTER TABLE "ACME_KNOWN_ISSUES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ACME_KNOWN_ISSUES" MODIFY ("MESSAGE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_LOADBALANCERS
--------------------------------------------------------

  ALTER TABLE "ACME_LOADBALANCERS" ADD CONSTRAINT "ACME_LOADBALANCERS_PK" PRIMARY KEY ("CNAME") ENABLE;
  ALTER TABLE "ACME_LOADBALANCERS" MODIFY ("IP" NOT NULL ENABLE);
  ALTER TABLE "ACME_LOADBALANCERS" MODIFY ("CNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_MACHINES
--------------------------------------------------------

  ALTER TABLE "ACME_MACHINES" ADD CONSTRAINT "ACME_MACHINES_PK" PRIMARY KEY ("MACHINENAME") ENABLE;
  ALTER TABLE "ACME_MACHINES" MODIFY ("MACHINENAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_MACHINES" ADD CONSTRAINT "ACME_MACHINES_UK1" UNIQUE ("FQDN") ENABLE;
/
--------------------------------------------------------
--  Constraints for Table ACME_MOUNTS
--------------------------------------------------------

  ALTER TABLE "ACME_MOUNTS" MODIFY ("ENVNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_MOUNTS" ADD CONSTRAINT "ACME_MOUNTPOINTS_PK" PRIMARY KEY ("MOUNT_NAME") ENABLE;
  ALTER TABLE "ACME_MOUNTS" MODIFY ("MOUNT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "ACME_MOUNTS" MODIFY ("MOUNT_NAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_MOUNTSLOCAL
--------------------------------------------------------

  ALTER TABLE "ACME_MOUNTSLOCAL" MODIFY ("ENVNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_MOUNTSLOCAL" MODIFY ("PATH" NOT NULL ENABLE);
  ALTER TABLE "ACME_MOUNTSLOCAL" MODIFY ("NAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_NIC
--------------------------------------------------------

  ALTER TABLE "ACME_NIC" ADD CONSTRAINT "ACME_NIC_PK" PRIMARY KEY ("NICNAME", "MACHINE") ENABLE;
  ALTER TABLE "ACME_NIC" MODIFY ("MACHINE" NOT NULL ENABLE);
  ALTER TABLE "ACME_NIC" MODIFY ("NICNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_OSBPROJECTS
--------------------------------------------------------

  ALTER TABLE "ACME_OSBPROJECTS" MODIFY ("DEPLOYMENT_ORDER" NOT NULL ENABLE);
  ALTER TABLE "ACME_OSBPROJECTS" ADD CONSTRAINT "ACME_OSBPROJECTS_PK" PRIMARY KEY ("OSBPROJECTNAME") ENABLE;
  ALTER TABLE "ACME_OSBPROJECTS" MODIFY ("OSBPROJECTNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_OSBREPORTS_LEGALPROPS
--------------------------------------------------------

  ALTER TABLE "ACME_OSBREPORTS_LEGALPROPS" ADD CONSTRAINT "ACME_OSBREPORTS_LEGALPR_PK" PRIMARY KEY ("PROPERTY_NAME") ENABLE;
  ALTER TABLE "ACME_OSBREPORTS_LEGALPROPS" MODIFY ("PROPERTY_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_OSBREPORTS_LEGALPROPS" ADD CONSTRAINT "ACME_OSBREPORTS_LEGALP_CHK1" CHECK (PROPERTY_GROUP IN ('ARCHIVER', 'OSBREPORT', 'ALERTING')) ENABLE;
/
--------------------------------------------------------
--  Constraints for Table ACME_OSBREPORTS_PROPS
--------------------------------------------------------

  ALTER TABLE "ACME_OSBREPORTS_PROPS" ADD CONSTRAINT "ACME_OSBREPORTS_PROPS_PK" PRIMARY KEY ("PROPERTY_NAME", "DOMAINNAME") ENABLE;
  ALTER TABLE "ACME_OSBREPORTS_PROPS" MODIFY ("DOMAINNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_OSBREPORTS_PROPS" MODIFY ("PROPERTY_VALUE" NOT NULL ENABLE);
  ALTER TABLE "ACME_OSBREPORTS_PROPS" MODIFY ("PROPERTY_NAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_PROJECTS
--------------------------------------------------------

  ALTER TABLE "ACME_PROJECTS" ADD CONSTRAINT "ACME_PROJECTS_CHK4" CHECK (STATUS IN ('ACTIVE', 'DEAD', 'FUTURE')) ENABLE;
  ALTER TABLE "ACME_PROJECTS" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "ACME_PROJECTS" ADD CONSTRAINT "ACME_PROJECTS_CHK3" CHECK (DOMAINNUMBER IN ('1', '2', '3', 'ALL', 'NONE')) ENABLE;
  ALTER TABLE "ACME_PROJECTS" MODIFY ("DOMAINNUMBER" NOT NULL ENABLE);
  ALTER TABLE "ACME_PROJECTS" ADD CONSTRAINT "ACME_PROJECTS_CHK2" CHECK (BUSINESSAREA IN ('Frontend', 'Backend')) ENABLE;
  ALTER TABLE "ACME_PROJECTS" ADD CONSTRAINT "ACME_PROJECTS_CHK1" CHECK (TYPE IN ('NonCritical', 'Critical')) ENABLE;
  ALTER TABLE "ACME_PROJECTS" ADD CONSTRAINT "ACME_PROJECTS_PK" PRIMARY KEY ("PROJECTNAME") ENABLE;
  ALTER TABLE "ACME_PROJECTS" MODIFY ("PROJECTNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_SERVERS
--------------------------------------------------------

  ALTER TABLE "ACME_SERVERS" MODIFY ("PORT" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVERS" ADD CONSTRAINT "ACME_SERVERS_UK1" UNIQUE ("PORT", "LISTEN_ADDRESS_VIP") ENABLE;
  ALTER TABLE "ACME_SERVERS" ADD CONSTRAINT "ACME_SERVERS_UK2" UNIQUE ("FLOATING_IP") ENABLE;
  ALTER TABLE "ACME_SERVERS" ADD CONSTRAINT "ACME_SERVERS_CHK1" CHECK (ISADMIN IN (0, 1)) ENABLE;
  ALTER TABLE "ACME_SERVERS" ADD CONSTRAINT "ACME_SERVERS_PK" PRIMARY KEY ("SERVERNAME") ENABLE;
  ALTER TABLE "ACME_SERVERS" MODIFY ("MACHINENAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVERS" MODIFY ("ISADMIN" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVERS" MODIFY ("SERVERNAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_SERVICE_DEPENDENCIES
--------------------------------------------------------

  ALTER TABLE "ACME_SERVICE_DEPENDENCIES" ADD CONSTRAINT "ACME_SERVICE_DEPENDENCI_UK1" UNIQUE ("SERVICE", "DEPENDENTSERVICE") ENABLE;
  ALTER TABLE "ACME_SERVICE_DEPENDENCIES" MODIFY ("DEPENDENTSERVICE" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVICE_DEPENDENCIES" MODIFY ("SERVICE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_SERVICE_TYPES
--------------------------------------------------------

  ALTER TABLE "ACME_SERVICE_TYPES" ADD CONSTRAINT "ACME_SERVICE_TYPES_PK" PRIMARY KEY ("TYPE") ENABLE;
  ALTER TABLE "ACME_SERVICE_TYPES" MODIFY ("TYPE" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_SERVICES
--------------------------------------------------------

  ALTER TABLE "ACME_SERVICES" MODIFY ("ISPUBLICHTTP" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVICES" MODIFY ("OSBPROJECTNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVICES" MODIFY ("SERVICEFULLPATH" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVICES" MODIFY ("ISHTTPSREQUIRED" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVICES" MODIFY ("ISPS" NOT NULL ENABLE);
  ALTER TABLE "ACME_SERVICES" ADD CONSTRAINT "ACME_SERVICES_PK" PRIMARY KEY ("SERVICEFULLPATH") ENABLE;
  ALTER TABLE "ACME_SERVICES" MODIFY ("SERVICENAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_USER_ROLE
--------------------------------------------------------

  ALTER TABLE "ACME_USER_ROLE" ADD CONSTRAINT "ACME_USER_ROLE_CHK1" CHECK ("ACME_ROLE"='Adm' OR "ACME_ROLE"='Dev' OR "ACME_ROLE"='Arc') ENABLE;
  ALTER TABLE "ACME_USER_ROLE" MODIFY ("ACME_ROLE" NOT NULL ENABLE);
  ALTER TABLE "ACME_USER_ROLE" MODIFY ("DOMAIN_GROUP" NOT NULL ENABLE);
  ALTER TABLE "ACME_USER_ROLE" MODIFY ("WEBLOGIC_GROUP" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_USERS
--------------------------------------------------------

  ALTER TABLE "ACME_USERS" MODIFY ("ACME_ROLE" NOT NULL ENABLE);
  ALTER TABLE "ACME_USERS" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "ACME_USERS" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "ACME_USERS" ADD CONSTRAINT "ACME_USERS_CHK2" CHECK (ACME_ROLE IN ('Arc', 'Dev', 'Adm')) ENABLE;
  ALTER TABLE "ACME_USERS" ADD CONSTRAINT "ACME_USERS_CHK1" CHECK (STATUS IN ('ACTIVE', 'SUSPENDED', 'MANAGER')) ENABLE;
/
--------------------------------------------------------
--  Constraints for Table ACME_VERSION
--------------------------------------------------------

  ALTER TABLE "ACME_VERSION" ADD CONSTRAINT "ACME_VERSION_PK" PRIMARY KEY ("VERSIONNUMBER") ENABLE;
  ALTER TABLE "ACME_VERSION" MODIFY ("VERSIONNUMBER" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Constraints for Table ACME_WORKMANAGERS
--------------------------------------------------------

  ALTER TABLE "ACME_WORKMANAGERS" ADD CONSTRAINT "ACME_WORKMANAGERS_PK" PRIMARY KEY ("WORKMANAGER_NAME") ENABLE;
  ALTER TABLE "ACME_WORKMANAGERS" MODIFY ("WORKMANAGER_NAME" NOT NULL ENABLE);
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_BUILD_F_AND_R
--------------------------------------------------------

  ALTER TABLE "ACME_BUILD_F_AND_R" ADD CONSTRAINT "ACME_BUILD_F_AND_R_NESO_FK1" FOREIGN KEY ("PROPERTYNAME")
	  REFERENCES "ACME_BUILD_F_AND_R_PROPS" ("PROPERTYNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_DATABASE_SCHEMAS
--------------------------------------------------------

  ALTER TABLE "ACME_DATABASE_SCHEMAS" ADD CONSTRAINT "ACME_DATABASE_USERS_NES_FK1" FOREIGN KEY ("DBNAME")
	  REFERENCES "ACME_DATABASES" ("DBNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_DATASOURCES
--------------------------------------------------------

  ALTER TABLE "ACME_DATASOURCES" ADD CONSTRAINT "ACME_DATASOURCES_ACME_FK1" FOREIGN KEY ("JDBCDRIVER")
	  REFERENCES "ACME_JDBCDRIVERS" ("JDBCDRIVER") ENABLE;
  ALTER TABLE "ACME_DATASOURCES" ADD CONSTRAINT "ACME_DATASOURCES_ACME_FK3" FOREIGN KEY ("PROJECT")
	  REFERENCES "ACME_PROJECTS" ("PROJECTNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_DATASOURCES_ENV
--------------------------------------------------------

  ALTER TABLE "ACME_DATASOURCES_ENV" ADD CONSTRAINT "ACME_DATASOURCES_ENV_NE_FK2" FOREIGN KEY ("DSNAME")
	  REFERENCES "ACME_DATASOURCES" ("DSNAME") ENABLE;
  ALTER TABLE "ACME_DATASOURCES_ENV" ADD CONSTRAINT "ACME_DATASOURCES_ENV_NE_FK3" FOREIGN KEY ("SCHEMA_NAME")
	  REFERENCES "ACME_DATABASE_SCHEMAS" ("SCHEMA_NAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_DBADAPTER
--------------------------------------------------------

  ALTER TABLE "ACME_DBADAPTER" ADD CONSTRAINT "ACME_DBADAPTER_ACME_D_FK1" FOREIGN KEY ("DOMAIN_GROUP")
	  REFERENCES "ACME_DOMAIN_GROUP" ("DOMAIN_GROUP") ENABLE;
  ALTER TABLE "ACME_DBADAPTER" ADD CONSTRAINT "ACME_DBADAPTER_ACME_D_FK2" FOREIGN KEY ("DATASOURCENAME")
	  REFERENCES "ACME_DATASOURCES" ("DSJNDINAME") ENABLE;
  ALTER TABLE "ACME_DBADAPTER" ADD CONSTRAINT "ACME_DBADAPTER_ACME_D_FK3" FOREIGN KEY ("XADATASOURCENAME")
	  REFERENCES "ACME_DATASOURCES" ("DSJNDINAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_DOMAINS
--------------------------------------------------------

  ALTER TABLE "ACME_DOMAINS" ADD CONSTRAINT "ACME_DOMAINS_ACME_DAT_FK1" FOREIGN KEY ("SCHEMA_NAME_SOAINFRA")
	  REFERENCES "ACME_DATABASE_SCHEMAS" ("SCHEMA_NAME") ENABLE;
  ALTER TABLE "ACME_DOMAINS" ADD CONSTRAINT "ACME_DOMAINS_ACME_DAT_FK2" FOREIGN KEY ("SCHEMA_NAME_MDS")
	  REFERENCES "ACME_DATABASE_SCHEMAS" ("SCHEMA_NAME") ENABLE;
  ALTER TABLE "ACME_DOMAINS" ADD CONSTRAINT "ACME_DOMAINS_ACME_ENV_FK1" FOREIGN KEY ("ENVNAME")
	  REFERENCES "ACME_ENVS" ("ENVNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_FILEPOLLERS
--------------------------------------------------------

  ALTER TABLE "ACME_FILEPOLLERS" ADD CONSTRAINT "ACME_FILEPOLLERS_ACME_FK1" FOREIGN KEY ("PROXYSERVICE")
	  REFERENCES "ACME_SERVICES" ("SERVICEFULLPATH") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_FILES
--------------------------------------------------------

  ALTER TABLE "ACME_FILES" ADD CONSTRAINT "ACME_FILES_ACME_ENVS_FK1" FOREIGN KEY ("ENVNAME")
	  REFERENCES "ACME_ENVS" ("ENVNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_FTPSERVERS
--------------------------------------------------------

  ALTER TABLE "ACME_FTPSERVERS" ADD CONSTRAINT "ACME_FTPSERVERS_ACME__FK1" FOREIGN KEY ("DOMAIN_GROUP")
	  REFERENCES "ACME_DOMAIN_GROUP" ("DOMAIN_GROUP") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_HQ_CUSTOM_METRICS
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_CUSTOM_METRICS" ADD CONSTRAINT "ACME_HQ_METRICS_ACME__FK1" FOREIGN KEY ("PROTOTYPE_NAME")
	  REFERENCES "ACME_HQ_PROTOTYPES" ("PROTOTYPE_NAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_HQ_RESOURCE_ALERT
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_RESOURCE_ALERT" ADD CONSTRAINT "ACME_HQ_RESOURCE_ALERT__FK1" FOREIGN KEY ("RESOURCE_GROUP")
	  REFERENCES "ACME_HQ_GROUPS" ("GROUP_NAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_HQ_RESOURCES
--------------------------------------------------------

  ALTER TABLE "ACME_HQ_RESOURCES" ADD CONSTRAINT "ACME_HQ_RESOURCES_NESOA_FK1" FOREIGN KEY ("PROTOTYPE_NAME")
	  REFERENCES "ACME_HQ_PROTOTYPES" ("PROTOTYPE_NAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_INTERFACES
--------------------------------------------------------

  ALTER TABLE "ACME_INTERFACES" ADD CONSTRAINT "ACME_INTERFACES_ACME__FK1" FOREIGN KEY ("PROJECTNAME")
	  REFERENCES "ACME_PROJECTS" ("PROJECTNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_INTERFACES_SEQUENCEDIAG
--------------------------------------------------------

  ALTER TABLE "ACME_INTERFACES_SEQUENCEDIAG" ADD CONSTRAINT "ACME_INTERFACES_SEQUENC_FK1" FOREIGN KEY ("IFNAME")
	  REFERENCES "ACME_INTERFACES" ("IFNAME") ENABLE;
  ALTER TABLE "ACME_INTERFACES_SEQUENCEDIAG" ADD CONSTRAINT "ACME_INTERFACES_SEQUENC_FK2" FOREIGN KEY ("SERVICEFULLPATH")
	  REFERENCES "ACME_SERVICES" ("SERVICEFULLPATH") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_INTERFACES_STEPS
--------------------------------------------------------

  ALTER TABLE "ACME_INTERFACES_STEPS" ADD CONSTRAINT "ACME_INTERFACES_STEPS_N_FK1" FOREIGN KEY ("IFNAME")
	  REFERENCES "ACME_INTERFACES" ("IFNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_JMSCONNFACTORY
--------------------------------------------------------

  ALTER TABLE "ACME_JMSCONNFACTORY" ADD CONSTRAINT "ACME_JMSCONNFACTORY_FK1" FOREIGN KEY ("JMSMODULENAME")
	  REFERENCES "ACME_JMSMODULES" ("JMSMODULENAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_JMSMODULES
--------------------------------------------------------

  ALTER TABLE "ACME_JMSMODULES" ADD CONSTRAINT "ACME_JMSMODULES_ACME__FK1" FOREIGN KEY ("PROJECTNAME")
	  REFERENCES "ACME_PROJECTS" ("PROJECTNAME") ENABLE;
  ALTER TABLE "ACME_JMSMODULES" ADD CONSTRAINT "ACME_JMSMODULES_ACME__FK2" FOREIGN KEY ("OSBPROJECTNAME")
	  REFERENCES "ACME_OSBPROJECTS" ("OSBPROJECTNAME") ENABLE;
  ALTER TABLE "ACME_JMSMODULES" ADD CONSTRAINT "ACME_JMSMODULES_ACME__FK3" FOREIGN KEY ("JMSSERVERNAME")
	  REFERENCES "ACME_JMSSERVERS" ("JMSSERVERNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_JMSQUEUES
--------------------------------------------------------

  ALTER TABLE "ACME_JMSQUEUES" ADD CONSTRAINT "ACME_JMSQUEUES_ACME_I_FK1" FOREIGN KEY ("IFNAME")
	  REFERENCES "ACME_INTERFACES" ("IFNAME") ENABLE;
  ALTER TABLE "ACME_JMSQUEUES" ADD CONSTRAINT "ACME_JMSQUEUES_ACME_J_FK1" FOREIGN KEY ("JMSMODULENAME")
	  REFERENCES "ACME_JMSMODULES" ("JMSMODULENAME") ENABLE;
  ALTER TABLE "ACME_JMSQUEUES" ADD CONSTRAINT "ACME_JMSQUEUES_ACME_J_FK2" FOREIGN KEY ("REPROCESSQUEUE")
	  REFERENCES "ACME_JMSQUEUES" ("JMSNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_MOUNTS
--------------------------------------------------------

  ALTER TABLE "ACME_MOUNTS" ADD CONSTRAINT "ACME_MOUNTS_ACME_ENVS_FK1" FOREIGN KEY ("ENVNAME")
	  REFERENCES "ACME_ENVS" ("ENVNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_MOUNTSLOCAL
--------------------------------------------------------

  ALTER TABLE "ACME_MOUNTSLOCAL" ADD CONSTRAINT "ACME_MOUNTSLOCAL_ACME_FK1" FOREIGN KEY ("ENVNAME")
	  REFERENCES "ACME_ENVS" ("ENVNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_NIC
--------------------------------------------------------

  ALTER TABLE "ACME_NIC" ADD CONSTRAINT "ACME_NIC_ACME_MACHINE_FK1" FOREIGN KEY ("MACHINE")
	  REFERENCES "ACME_MACHINES" ("MACHINENAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_OSBPROJECTS
--------------------------------------------------------

  ALTER TABLE "ACME_OSBPROJECTS" ADD CONSTRAINT "ACME_OSBPROJECTS_ACME_FK1" FOREIGN KEY ("PROJECTNAME")
	  REFERENCES "ACME_PROJECTS" ("PROJECTNAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_OSBREPORTS_PROPS
--------------------------------------------------------

  ALTER TABLE "ACME_OSBREPORTS_PROPS" ADD CONSTRAINT "ACME_OSBREPORTS_PROPS_N_FK1" FOREIGN KEY ("PROPERTY_NAME")
	  REFERENCES "ACME_OSBREPORTS_LEGALPROPS" ("PROPERTY_NAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_SERVERS
--------------------------------------------------------

  ALTER TABLE "ACME_SERVERS" ADD CONSTRAINT "ACME_SERVERS_ACME_ENV_FK1" FOREIGN KEY ("DOMAINNAME")
	  REFERENCES "ACME_DOMAINS" ("DOMAINNAME") ENABLE;
  ALTER TABLE "ACME_SERVERS" ADD CONSTRAINT "ACME_SERVERS_ACME_MAC_FK1" FOREIGN KEY ("MACHINENAME")
	  REFERENCES "ACME_MACHINES" ("MACHINENAME") ENABLE;
/
--------------------------------------------------------
--  Ref Constraints for Table ACME_SERVICES
--------------------------------------------------------

  ALTER TABLE "ACME_SERVICES" ADD CONSTRAINT "ACME_SERVICES_ACME_OS_FK1" FOREIGN KEY ("OSBPROJECTNAME")
	  REFERENCES "ACME_OSBPROJECTS" ("OSBPROJECTNAME") ENABLE;
  ALTER TABLE "ACME_SERVICES" ADD CONSTRAINT "ACME_SERVICES_ACME_SE_FK1" FOREIGN KEY ("TYPE")
	  REFERENCES "ACME_SERVICE_TYPES" ("TYPE") ENABLE;
  ALTER TABLE "ACME_SERVICES" ADD CONSTRAINT "ACME_SERVICES_ACME_WM_FK1" FOREIGN KEY ("WORKMANAGER_NAME")
	  REFERENCES "ACME_WORKMANAGERS" ("WORKMANAGER_NAME") ENABLE;
/
