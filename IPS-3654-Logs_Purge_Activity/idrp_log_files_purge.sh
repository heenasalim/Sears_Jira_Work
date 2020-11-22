##########################################################################################################################
#DEVELOPER NAME  :HEENA SALIM SHAIKH
#PROJECT DETAILS :LOG/TMP FILESPURGE
#DEVELOPED ON    :10-DEC-2018
#DESCRIPTION     :This script will delete the all the files those are older than 5 days , so as to avoid the space issues in GBS and failure of the hadoop jobs.
#PROJECT CONTENTS:1)PURGE logic for deleting all the logs files those are older than 5 days.
#                 2)PURGE logic for deleting all the tmp  files those are older than 1 day.
#                 3)PURGE logic for deleting all the tmp HDFS files those are older than 1 day.
#CONTACT DETAILS : Heenasalim.Shaikh@searshc.com
##########################################################################################################################

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CLEANUP THE OLD FILES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#::::::::::::::::::::::::::::::::::::::: LOGIC to cleabnup the old logs files :::::::::::::::::::::::::::::::::::::::::::

find /logs/hdidrp/*.log -mtime +5 -exec rm -rf {} \;
return_code=$?
if [ "$return_code" -ne "0" ]; then
echo "***::::::::==============================================================================================:::::::***"
echo "Purging of the log files is failed" $return_code
echo "***=============================================================================================================***"
exit $return_code
fi
echo "Purging activity for log files completed successfully "
echo "==================================================================================================================="

#::::::::::::::::::::::::::::::::::::: LOGIC to cleanup old HDFS tmp files:::::::::::::::::::::::::::::::::::::::::::::::::

hadoop jar /opt/cloudera/parcels/CDH/jars/search-mr-*-job.jar org.apache.solr.hadoop.HdfsFindTool -find /tmp/* -mtime +1 |xargs hdfs dfs -rm -r -skipTrash /tmp/*;
echo $filenames
return_code=$?
echo " Purging of the HDFS files is completed successfully"
echo "==================================================================================================================="

#::::::::::::::::::::LOGIC to cleanup the /tmp files those are older than two days on LOCAL Filesystem:::::::::::::::::::

find /tmp/* -mtime +1 -exec rm -rf {} \;
return_code=$?
echo "***::::::::==============================================================================================:::::::***"
echo "/tmp files are common for all the users " 
echo "***=============================================================================================================***"
echo " Purging of the /tmp files is completed successfully"
echo "===================================================================================================================="
