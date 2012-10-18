/*
	Make sure you set up SQL Agent to use  Databasemail
	This will create the alerts.... create an operator named  DBA.... then add that operator to all the alert notifications
	and of course... make sure you add your email to the sp_add_operator  action
*/
USE [msdb]
GO
DECLARE @Email_List varchar(200)
SET @Email_List = 'ADD YOUR EMAIL HERE!'


/****** Object:  Operator [DBA]    Script Date: 02/18/2010 08:15:18 ******/
EXEC msdb.dbo.sp_add_operator @name=N'DBA', 
		@enabled=1, 
		@weekday_pager_start_time=90000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=0, 
		@email_address=@Email_List, 
		@category_name=N'[Uncategorized]'



USE [msdb]
GO
/****** Object:  Alert [Unexpected failure acquiring application lock.]    Script Date: 02/18/2010 07:54:40 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Unexpected failure acquiring application lock.', 
		@message_id=21414, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


EXEC msdb.dbo.sp_add_alert @name=N'Unexpected failure releasing application lock', 
		@message_id=21415, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Potentially Fatal Error Insufficient Resources]    Script Date: 02/18/2010 07:54:37 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Potentially Fatal Error Insufficient Resources', 
		@message_id=0, 
		@severity=17, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Non Logged SQL Server Shutdown]    Script Date: 02/18/2010 07:54:34 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Non Logged SQL Server Shutdown', 
		@message_id=20531, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'

/****** Object:  Alert [Misc Table Error]    Script Date: 02/18/2010 07:54:30 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Misc Table Error', 
		@message_id=2511, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'

/****** Object:  Alert [Login Failure]    Script Date: 02/18/2010 07:54:27 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Login Failure', 
		@message_id=0, 
		@severity=14, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Lock request timeout period exceeded]    Script Date: 02/18/2010 07:54:23 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Lock request timeout period exceeded', 
		@message_id=1222, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Lock Allocation]    Script Date: 02/18/2010 07:54:21 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Lock Allocation', 
		@message_id=17125, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Full Log - 9002]    Script Date: 02/18/2010 07:54:16 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Full Log - 9002', 
		@message_id=9002, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Fatal Errror - 025]    Script Date: 02/18/2010 07:54:13 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Errror - 025', 
		@message_id=0, 
		@severity=25, 
		@enabled=1, 
		@delay_between_responses=20, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Fatal Error: Table Integrity Suspect - 022]    Script Date: 02/18/2010 07:54:08 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error: Table Integrity Suspect - 022', 
		@message_id=0, 
		@severity=22, 
		@enabled=1, 
		@delay_between_responses=30, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Fatal Error: Hardware Error - 024]    Script Date: 02/18/2010 07:54:05 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error: Hardware Error - 024', 
		@message_id=0, 
		@severity=24, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'



/****** Object:  Alert [Fatal Error: Database Integrity Suspect - 023]    Script Date: 02/18/2010 07:54:03 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error: Database Integrity Suspect - 023', 
		@message_id=0, 
		@severity=23, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'



/****** Object:  Alert [Fatal Error In Resource - 019]    Script Date: 02/18/2010 07:54:00 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error In Resource - 019', 
		@message_id=0, 
		@severity=19, 
		@enabled=1, 
		@delay_between_responses=30, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'



/****** Object:  Alert [Fatal Error in Database Processes - 021]    Script Date: 02/18/2010 07:53:57 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error in Database Processes - 021', 
		@message_id=0, 
		@severity=21, 
		@enabled=1, 
		@delay_between_responses=30, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'



/****** Object:  Alert [Fatal Error in current Proccess - 020]    Script Date: 02/18/2010 07:53:54 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error in current Proccess - 020', 
		@message_id=0, 
		@severity=20, 
		@enabled=1, 
		@delay_between_responses=30, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'



/****** Object:  Alert [Driver or Hardware problem with the I/O system]    Script Date: 02/18/2010 07:52:51 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Driver or Hardware problem with the I/O system', 
		@message_id=845, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'


/****** Object:  Alert [Deadlock Event]    Script Date: 02/18/2010 07:52:42 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Deadlock Event', 
		@message_id=1205, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'



/****** Object:  Alert [Backup Failure]    Script Date: 02/18/2010 07:52:39 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Backup Failure', 
		@message_id=3201, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'

EXEC msdb.dbo.sp_add_alert @name = N'825 - Read-Retry Required',
        @message_id = 825,
        @severity = 0,
        @enabled = 1,
        @delay_between_responses = 0,
        @include_event_description_in = 1,
        @category_name=N'[Uncategorized]';






EXEC msdb.dbo.sp_add_notification @alert_name=N'Backup Failure', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Deadlock Event', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Driver or Hardware problem with the I/O system', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error in current Proccess - 020', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error in Database Processes - 021', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error In Resource - 019', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error: Database Integrity Suspect - 023', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error: Hardware Error - 024', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error: Table Integrity Suspect - 022', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Full Log - 9002', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Lock Allocation', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Lock request timeout period exceeded', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Login Failure', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Misc Table Error', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Non Logged SQL Server Shutdown', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Potentially Fatal Error Insufficient Resources', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Unexpected failure acquiring application lock.', @operator_name=N'DBA', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Unexpected failure releasing application lock', @operator_name=N'DBA', @notification_method = 1
GO

EXEC msdb.dbo.sp_add_notification @alert_name=N'825 - Read-Retry Required', @operator_name=N'DBA', @notification_method = 1
GO
