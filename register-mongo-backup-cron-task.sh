set -e

DIR="$( pwd )/backup"

echo "0 0 * * * root /bin/bash $DIR" >> /etc/cron.d/db-backup
