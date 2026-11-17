#!/bin/bash
# site ko /var/www me daal ke nginx reload — ek command me publish
set -e
sudo -n rsync -a --delete --exclude deploy.sh /home/ubuntu/bobbin-shared/site/ /var/www/bobbin.ventures/
sudo -n chown -R www-data:www-data /var/www/bobbin.ventures
sudo -n nginx -t >/dev/null && sudo -n systemctl reload nginx
echo "site published: $(ls /var/www/bobbin.ventures)"
