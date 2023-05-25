# Setting up a CPU usage alarm
![Alt text](imgs-alarm/1-cloudwatchdiag.png)
# Turn on detailed monitoring
1. Make a EC2 instance and go down to monitoring and select **manage detailed monitoring**![Alt text](imgs-alarm/2.png)![Alt text](imgs-alarm/3-enabledetailed.png)
2. You can now add this EC2 to a new or existing dashboard:
![Alt text](imgs-alarm/4-adddash.png)![Alt text](imgs-alarm/5-n.png)
# Setting up an alarm
1. Open the CloudWatch console at https://console.aws.amazon.com/cloudwatch/.![Alt text](imgs-alarm/6.png)

2. In the navigation pane, choose Alarms, All Alarms.
![Alt text](imgs-alarm/7.png)
1. Choose Create alarm.
![Alt text](imgs-alarm/8-createalarm.png)
2. Choose Select metric.
![Alt text](imgs-alarm/9-selectmetric.png)
3. In the All metrics tab, choose EC2 metrics.
![Alt text](imgs-alarm/10-ec2.png)
4. Choose a metric category (for example, Per-Instance Metrics).
![Alt text](imgs-alarm/11-preinstance.png)
5.  Find the row with the instance that you want listed in the InstanceId column and CPUUtilization in the Metric Name column. Select the check box next to this row, and choose Select metric.
![Alt text](imgs-alarm/12-instc.png)
6.  Under Specify metric and conditions, for Statistic choose Average, choose one of the predefined percentiles, or specify a custom percentile (for example, p95.45).
![Alt text](imgs-alarm/13-avg.png)
7.  Choose a period (for example, 5 minutes).

8.  Under Conditions, specify the following:
![Alt text](imgs-alarm/14-conditions.png)
a. For Threshold type, choose Static.

b. For Whenever CPUUtilization is, specify Greater. Under than..., specify the threshold that is to trigger the alarm to go to ALARM state if the CPU utilization exceeds this percentage. For example, 70.

c. Choose Additional configuration. For Datapoints to alarm, specify how many evaluation periods (data points) must be in the ALARM state to trigger the alarm. If the two values here match, you create an alarm that goes to ALARM state if that many consecutive periods are breaching.

To create an M out of N alarm, specify a lower number for the first value than you specify for the second value. For more information, see Evaluating an alarm.

d. For Missing data treatment, choose how to have the alarm behave when some data points are missing. For more information, see Configuring how CloudWatch alarms treat missing data.

e. If the alarm uses a percentile as the monitored statistic, a Percentiles with low samples box appears. Use it to choose whether to evaluate or ignore cases with low sample rates. If you choose ignore (maintain alarm state), the current alarm state is always maintained when the sample size is too low. For more information, see Percentile-based CloudWatch alarms and low data samples.

11. Choose Next.
12. Under Notification, choose In alarm and select an SNS topic to notify when the alarm is in ALARM state
![Alt text](imgs-alarm/15-notif.png)
To have the alarm send multiple notifications for the same alarm state or for different alarm states, choose Add notification.

To have the alarm not send notifications, choose Remove.
![Alt text](imgs-alarm/16-next.png)
13.  When finished, choose Next.

14. Enter a name and description for the alarm. The name must contain only UTF-8 characters, and can't contain ASCII control characters. Then choose Next.
![Alt text](imgs-alarm/17-namedesc.png)
15. Under Preview and create, confirm that the information and conditions are what you want, then choose Create alarm.![Alt text](imgs-alarm/18-createalarm.png)

16. You should get a email asking you to confirm subscriptions to the alarm ![Alt text](imgs-alarm/19-subconf.png)
Click it and confirm: ![Alt text](imgs-alarm/20-subclick.png)
17. Finished you should receive a email when the alarm is on: ![Alt text](imgs-alarm/21-emailalert.png)
You can also check out the alarm page to see a dashboard of the metric you picked: ![Alt text](imgs-alarm/22-alarmgraph.png)