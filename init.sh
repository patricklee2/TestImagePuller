# m h dom mon dow   command
chmod u+x ~/TestImagePuller/images.sh
chmod u+x ~/TestImagePuller/pull.sh
chmod u+x ~/TestImagePuller/remove.sh
echo "*/5 * * * * ~/TestImagePuller/images.sh" >> /var/spool/cron/crontabs/root
echo "*/5 * * * * ~/TestImagePuller/pull.sh"   >> /var/spool/cron/crontabs/root
echo "*/5 * * * * ~/TestImagePuller/remove.sh" >> /var/spool/cron/crontabs/root
