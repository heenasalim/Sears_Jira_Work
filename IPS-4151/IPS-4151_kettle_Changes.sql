select * from stgmgr.job j, stgmgr.job_interface ji, stgmgr.batchctl b
where j.job_name='Pkj_Hadoop_MI_Pre_Master'
and j.job_interface_id=ji.job_interface_id
and ji.job_interface_id=b.job_interface_id
order by batchctl_id desc;


select je.event_name,
       jea.job_event_activity_id,
       to_char(jea.create_ts, 'yyyy-mm-dd hh24:mi:ss'),
       to_char(jea.update_ts, 'yyyy-mm-dd hh24:mi:ss'),
       jes.description
  from stgmgr.job_event          je,
       STGMGR.job_event_activity jea,
       stgmgr.job                j,
       stgmgr.job_event_status   jes,
       stgmgr.job_interface      ji
 where j.job_name = 'Pkj_Hadoop_MI_Pre_Master'
   and j.job_interface_id = ji.job_interface_id
   and jea.job_id = j.job_id
   and jea.batchctl_id = '7138'
   and je.job_event_id = jea.job_event_id
   and jea.job_event_status_id = jes.job_event_status_id
 order by 2 asc, 3; 
 

Update stgmgr.job_event_activity
set job_event_status_id = 3
where batchctl_id in ('7140','7139','7138','7133','7134','7131','7132','7130','7129','7128','7127','7126','7125','7124','7123','7122','7121','7120','7117','7114','7113','7112','7111','6094','6027','2819','2817','2403','2399','2398','2397','2395','2371','2358','2344','2343','2342','2341','2340','2321');

commit;

TRUNCATE  TABLE stgmgr.job_event;
TRUNCATE TABLE stgmgr.job_event_activity;

INSERT INTO stgmgr.job_event_activity ( job_event_activity_id,
      job_id,
      job_event_id,
      job_event_status_id,
      batchctl_id,
      update_user_id,
      create_ts,
      update_ts)
      select job_event_activity_id,
      job_id,
      job_event_id,
      job_event_status_id,
      batchctl_id,
      update_user_id,
      create_ts,
      update_ts from STGMGR.JOB_EVENT_ACTIVITY_BACKUP_2019;

DELETE FROM stgmgr.job_event_activity WHERE batchctl_id = '7138';

SELECT /*+PARALLEL(16)*/ * FROM  STGMGR.JOB_EVENT_ACTIVITY_BACKUP_2019

CREATE TABLE STGMGR.JOB_EVENT_BACKUP_2019 AS SELECT * FROM stgmgr.job_event;
CREATE TABLE STGMGR.JOB_EVENT_ACTIVITY_BACKUP_2019 AS SELECT * FROM stgmgr.job_event_activity;

SELECT COUNT(*) FROM STGMGR.JOB_EVENT_BACKUP_2019;

SELECT COUNT(*) FROM STGMGR.JOB_EVENT_ACTIVITY ;
SELECT COUNT(*) FROM STGMGR.JOB_EVENT_ACTIVITY_BACKUP_2019;

SELECT * FROM stgmgr.job_event WHERE event_name in('Shell_Perform_FastLoad_Teradata_Promo_Hist_Weekly'
,'Shell_Perform_Teradata_FastExport_AD-PLAN_Weekly',
'Shell_Perform_Teradata_FastLoad_PMI_Market_Store_Weekly',
'Shell_Perform_FastLoad_Teradata_Promo_Hist_KSN_Locn_Weekly',
'Shell_Perform_Sqoop_Deal_Management_Weekly',
'Shell_Perform_Teradata_FastLoad_PMI_Market_Weekly',
'Shell_Perform_FastLoad_Teradata_Promo_Hist_KSN_Weekly',
'Shell_Perform_CoreDB2_Sqoop_Deal_Management_Weekly',
'Pkj_Perform_Sqoop_ADVPOS_IMPACT_DealManagement_Weekly','Shell_Perform_ksn_locn_hist_intermediate','Shell_Perform_Deal_Management_Weekly_Pre');

Delete from stgmgr.job_event where job_event_id in ('1860','3667','3668','3678','2570',
'1842',
'1852',
'1855',
'1856',
'1861',
'1864',
'1867',
'3669',
'3673',
'3674',
'3675',
'3676',
'3679',
'3680',
'3681');


Delete from stgmgr.job_event_activity where job_event_id in ('1860','3667','3668','3678',
'2570',
'1842',
'1852',
'1855',
'1856',
'1861',
'1864',
'1867',
'3669',
'3673',
'3674',
'3675',
'3676',
'3679',
'3680',
'3681');


	
select * from stgmgr.job j, stgmgr.job_interface ji, stgmgr.batchctl b
where j.job_name='Pkj_Hadoop_MI_Master'
and j.job_interface_id=ji.job_interface_id
and ji.job_interface_id=b.job_interface_id
order by batchctl_id desc;

SELECT * FROM stgmgr.job_event WHERE event_name in('Shell_Perform_Generic_Shell_Script_ADVPOS_Weekly','Shell_Perform_Ad-Plan_Weekly','Shell_Perform_Lpub_Weekly');

Delete from stgmgr.job_event_activity where job_event_id in ('2551','2191','1850');
Delete from stgmgr.job_event where job_event_id in ('2551','2191','1850');
select * from STSC.BUILD_TRACKER where DECOMP_OBJ like '%Marketing Instruments - IMPACT%' order by request_dt desc; 

SELECT /*+PARALLEL(16)*/ * FROM 


Update stgmgr.job_event_activity
set job_event_status_id = 3
where batchctl_id in ('7140','7139','7138','7133','7134','7131','7132','7130','7129','7128','7127','7126','7125','7124','7123','7122','7121','7120','7117','7114','7113','7112','7111','6094','6027','2819','2817','2403','2399','2398','2397','2395','2371','2358','2344','2343','2342','2341','2340','2321');

commit;


//STGMGR.JOB_EVENT_BACKUP_2019          stgmgr.job_event;
STGMGR.JOB_EVENT_ACTIVITY_BACKUP_2019  stgmgr.job_event_activity;
SELECT /*+PARALLEL(16)*/ * FROM  STGMGR.JOB_EVENT_ACTIVITY_BACKUP_2019;
select /*+parallel(16)*/ count(*) from STGMGR.JOB_EVENT_ACTIVITY_BACKUP_2019  ; --393
select /*+parallel(16)*/ count(*) from STGMGR.JOB_EVENT_ACTIVITY; --91

select /*+parallel(16)*/ count( b.JOB_EVENT_ID)  from STGMGR.JOB_EVENT_BACKUP_2019 a,STGMGR.JOB_EVENT b where a.JOB_EVENT_ID =b.JOB_EVENT_ID ;

select  /*+parallel(16)*/  * from STGMGR.JOB_EVENT_ACTIVITY_BACKUP_2019 a where a.JOB_EVENT_ACTIVITY_ID not in 
(select   b.JOB_EVENT_ACTIVITY_ID from STGMGR.JOB_EVENT_ACTIVITY b 
);










SELECT COUNT(*) FROM stgmgr.job_event;
SELECT COUNT(*) FROM STGMGR.JOB_EVENT_BACKUP_2019;
