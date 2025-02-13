/*
  Copyright (c) 2021 Qualcomm Technologies, Inc.
  All Rights Reserved.
  Confidential and Proprietary - Qualcomm Technologies, Inc.
*/

UPDATE qcril_properties_table set def_val='11' where property='qcrildb_version';
CREATE TABLE IF NOT EXISTS MODULES (ROWID  INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, MODULE TEXT, MANDATORY BOOLEAN, INTERNAL BOOLEAN, PRIO INTEGER);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_MODULES_MODULE ON MODULES (MODULE);
CREATE UNIQUE INDEX IF NOT EXISTS IDX_MODULES_PRIO ON MODULES (PRIO);
CREATE TABLE IF NOT EXISTS CONFIGS (ROWID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, NAME TEXT, DESCRIPTION TEXT);
CREATE TABLE IF NOT EXISTS CONFIG_MODULES ( ROWID INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, CONFIG_ID INTEGER, MODULE_ID INTEGER, FOREIGN KEY (CONFIG_ID) REFERENCES CONFIGS(ROWID), FOREIGN KEY (MODULE_ID) REFERENCES MODULES(ROWID));
INSERT OR REPLACE INTO MODULES VALUES( 1, "DatabaseModule", TRUE, TRUE, 1);
INSERT OR REPLACE INTO MODULES VALUES( 2, "libqcrilNrModuleConfigModule.so", FALSE, FALSE, 2);
INSERT OR REPLACE INTO MODULES VALUES( 3, "qcrilNrAndroidModule", FALSE, TRUE, 3);
INSERT OR REPLACE INTO MODULES VALUES( 4, "libqcrilNrVoiceModule.so", FALSE, FALSE, 4);
INSERT OR REPLACE INTO MODULES VALUES( 5, "qcrilNrLpaModule", FALSE, TRUE, 5);
INSERT OR REPLACE INTO MODULES VALUES( 6, "qcrilNrNasModule", TRUE, TRUE, 6);
INSERT OR REPLACE INTO MODULES VALUES( 7, "qcrilNrNwRegistrationModule", FALSE, TRUE, 7);
INSERT OR REPLACE INTO MODULES VALUES( 8, "qcrilNrDmsModule", TRUE, TRUE, 8);
INSERT OR REPLACE INTO MODULES VALUES( 9, "libqcrilNrSmsModule.so", FALSE, FALSE, 9);
INSERT OR REPLACE INTO MODULES VALUES( 10, "libqcrilNrCellInfoModule.so", FALSE, FALSE, 10);
INSERT OR REPLACE INTO MODULES VALUES( 11, "qcrilNrUimModule", TRUE, TRUE, 11);
INSERT OR REPLACE INTO MODULES VALUES( 12, "qcrilNrGstkModule", TRUE, TRUE, 12);
INSERT OR REPLACE INTO MODULES VALUES( 13, "qcrilNrUimServiceModule", FALSE, TRUE, 13);
INSERT OR REPLACE INTO MODULES VALUES( 14, "libqcrilNrImsModule.so", FALSE, FALSE, 14);
INSERT OR REPLACE INTO MODULES VALUES( 15, "libqcrilNrPbmModule.so", FALSE, FALSE, 15);
INSERT OR REPLACE INTO MODULES VALUES( 16, "libqcrilDataModule.so", FALSE, FALSE, 16);
INSERT OR REPLACE INTO MODULES VALUES( 17, "qcrilNrAndroidAudioModule", FALSE, TRUE, 17);
INSERT OR REPLACE INTO MODULES VALUES( 18, "qcrilNrMbnModule", FALSE, TRUE, 18);
INSERT OR REPLACE INTO MODULES VALUES( 19, "qcrilNrSapModule", FALSE, TRUE, 19);
INSERT OR REPLACE INTO MODULES VALUES( 20, "qcrilNrUimRemoteClientModule", FALSE, TRUE, 20);
INSERT OR REPLACE INTO MODULES VALUES( 21, "qcrilNrUimRemoteServerModule", FALSE, TRUE, 21);
INSERT OR REPLACE INTO MODULES VALUES( 22, "qcrilNrSecureElementModule", FALSE, TRUE, 22);
INSERT OR REPLACE INTO MODULES VALUES( 23, "qcrilNrQtiRadio", FALSE, TRUE, 23);
INSERT OR REPLACE INTO MODULES VALUES( 24, "qcrilNrRadioConfigModule", FALSE, TRUE, 24);
INSERT OR REPLACE INTO MODULES VALUES( 25, "qcrilNrAndroidImsRadio", FALSE, TRUE, 25);
INSERT OR REPLACE INTO MODULES VALUES( 26, "qcrilNrOemHookModule", FALSE, TRUE, 26);
INSERT OR REPLACE INTO MODULES VALUES( 27, "qcrilLteDirectModule", FALSE, TRUE, 27);
INSERT OR REPLACE INTO MODULES VALUES( 28, "libqcrilNrSocketModule.so", FALSE, FALSE, 28);

INSERT OR REPLACE INTO CONFIGS VALUES ( 1, "Full", "Full configuration including all the modules");
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 1);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 2);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 3);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 4);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 5);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 6);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 7);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 8);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 9);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 10);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 11);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 12);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 13);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 14);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 15);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 16);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 17);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 18);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 19);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 20);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 21);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 22);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 23);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 24);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 25);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 26);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 27);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 1, 28);
INSERT OR REPLACE INTO qcril_properties_table (property, value) VALUES ('qcril-current-config', 1);

INSERT OR REPLACE INTO CONFIGS VALUES ( 2, "Data", "Data-only configuration");
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 1);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 2);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 3);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 6);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 8);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 11);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 12);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 16);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 2, 28);

INSERT OR REPLACE INTO CONFIGS VALUES ( 3, "Voice_Data", "Voice and Data. Supports IMS and SMS");
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 1);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 2);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 3);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 4);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 6);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 8);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 9);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 10);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 11);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 12);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 12);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 14);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 15);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 16);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 17);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 18);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 25);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 3, 28);

INSERT OR REPLACE INTO CONFIGS VALUES ( 4, "Minimal", "For testing only. Contains only mandatory modules");
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 4, 1);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 4, 2);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 4, 3);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 4, 6);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 4, 8);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 4, 11);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 4, 12);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 4, 28);

INSERT OR REPLACE INTO CONFIGS VALUES ( 5, "Custom", "Custom configuration");
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 1);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 2);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 3);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 4);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 5);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 6);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 7);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 8);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 9);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 10);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 11);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 12);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 13);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 14);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 15);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 16);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 17);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 18);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 19);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 20);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 21);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 22);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 23);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 24);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 25);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 26);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 27);
INSERT OR REPLACE INTO CONFIG_MODULES (CONFIG_ID, MODULE_ID) VALUES( 5, 28);

