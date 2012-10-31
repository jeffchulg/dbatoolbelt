--Source: http://sqlserverpedia.com/blog/sql-server-bloggers/sql-server-%E2%80%93-check-sql-agent-job-history-using-t-sql/

-- get agent history
SELECT      [JobName]   = JOB.name,
            [Step]      = HIST.step_id,
            [StepName]  = HIST.step_name,
            [Message]   = HIST.[message],
            [Status]    = CASE WHEN HIST.run_status = 0 THEN 'Failed'
            WHEN HIST.run_status = 1 THEN 'Succeeded'
            WHEN HIST.run_status = 2 THEN 'Retry'
            WHEN HIST.run_status = 3 THEN 'Canceled'
            END,
            [RunDate]   = HIST.run_date,
            [RunTime]   = HIST.run_time,
            [Duration]  = HIST.run_duration
FROM        sysjobs JOB
INNER JOIN  sysjobhistory HIST ON HIST.job_id = JOB.job_id
-- WHERE    JOB.name = 'Job1'
ORDER BY    HIST.run_date, HIST.run_time