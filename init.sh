mkdir images
mkdir remove
mkdir pullandtag

chmod u+x ~/TestImagePuller/images.sh
chmod u+x ~/TestImagePuller/pull.py
chmod u+x ~/TestImagePuller/remove.py
# m h dom mon dow   command
echo "* * * * * ~/TestImagePuller/images.sh" >> /var/spool/cron/crontabs/root
echo "*/5 * * * * python ~/TestImagePuller/pull.py"   >> /var/spool/cron/crontabs/root
echo "*/5 * * * * python ~/TestImagePuller/remove.py" >> /var/spool/cron/crontabs/root
