# For Log rotation 
1. first we usually write logs to rsyslog . 
2. through rsyslog , we will get the timestamps of logs , In general we use rsyslog timestamp instead of kamailio $Ts timestamp..
3. So Lets copy rsyslog-kamailio.conf to /etc/rsyslog.d/rsyslog-kamailio.conf 
4. then we systemctl restart rsyslog.d, Now we will see timestamp in the specific format of rsyslog config. 

5. Now we can apply rotation on rsyslog 
6. copy kamailio-logrotate.conf to /etc/logrotate.d/kamailio-logrotate.conf
7. now to test you can execute below / its a kind of force rotation for testing..
-> logrotate -d /etc/logrotate.d/kamailio-logrotate.conf

8. Now lets do it automatically through cron jobs 
9. Copy hourly-cron.conf to /etc/cron.hourly/logrotate
10. OR cp /etc/cron.daily/logrotate /etc/cron.hourly/logrotate
    
11. chmod +x /etc/cron.hourly/logrotate


12. systemctl enable crond # if not enabled.
13. systemctl restart crond
