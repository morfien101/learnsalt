#! /bin/bash 

BASE_PATH="/etc/salt"
MASTER_PATH="$BASE_PATH/master.d"
MINION_PATH="$BASE_PATH/minion.d"
SERVER_PATH="/srv/salt"

for d in $MASTER_PATH $MINION_PATH $SERVER_PATH; do
  mkdir -p $d
done

ln -s /shared/saltstates ./saltstates
SERVER_PATH="/srv/salt"
STATE_BASE="saltstates"
cat << EOF > "$MASTER_PATH/roots.conf"
file_roots:
  base:
    - ${SERVER_PATH}/${STATE_BASE}/base
  dev:
    - ${SERVER_PATH}/${STATE_BASE}/dev
  qa:
    - ${SERVER_PATH}/${STATE_BASE}/qa
  prod:
    - ${SERVER_PATH}/${STATE_BASE}/prod
pillar_roots:
  base:
    - ${SERVER_PATH}/${STATE_BASE}/pillars/base
  dev:
    - ${SERVER_PATH}/${STATE_BASE}/pillars/dev
EOF