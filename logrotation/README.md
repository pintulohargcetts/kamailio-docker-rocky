# For Log rotation 
1. first we usually write logs to rsyslog . 
2. through rsyslog , we will get the timestamps of logs , In general we use rsyslog timestamp instead of kamailio $Ts timestamp..
3. First in rsyslog-kamailio.conf , '/var/log/kamailio/kamailio.log' replace this to your corresponding log file path
4. then in kamailio-logrotate.conf.conf also , '/var/log/kamailio/kamailio.log' replace this to your corresponding log file path 
5. then Lets copy rsyslog-kamailio.conf to /etc/rsyslog.d/rsyslog-kamailio.conf 
6. then we do 'systemctl restart rsyslogd', Now we will see timestamp in the specific format of rsyslog config. 

7. Now we can apply rotation on rsyslog 
8. copy kamailio-logrotate.conf to /etc/logrotate.d/kamailio-logrotate.conf
9. now to test you can execute below / its a kind of force rotation for testing..
-> logrotate -d /etc/logrotate.d/kamailio-logrotate.conf

10. Now lets do it automatically through cron jobs 
11. Copy hourly-cron.conf to /etc/cron.hourly/logrotate
12. OR cp /etc/cron.daily/logrotate /etc/cron.hourly/logrotate
    
13. chmod +x /etc/cron.hourly/logrotate


14. systemctl enable crond # if not enabled.
15. systemctl restart crond
