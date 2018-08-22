#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# help/usage message 
help_msg(){ echo -e '
Usage: ./orchestrate.sh <option> 
WARN: must have docker pip module installed, not docker-py
Arguments:
  -h, --help   help menu
  -run --run'
}

bomb_out(){
  echo "ERROR incorrect usage"
  help_msg
  exit 1
}

run_command(){
  ansible-galaxy install --force -r requirements.yml
  cd dockerfiles/debian
  docker build -t debian .
  cd ../centos
  docker build -t centos .
  cd $DIR
  docker run -td centos bash
  docker run -td debian bash
  ansible-playbook ansible-nginx.yaml -i inventory/inventory.py -vvvv
  CONTAINERS=$(docker ps --format {{.ID}})
  for i in $CONTAINERS; do
      docker rm $i -f 
  done
  printf "###########################################################################################\nLooks like everything went smoothly.\nYou should have two containers tagged with success in their name.\n(∩｀-´)⊃━☆ﾟ.*･｡ﾟ"
}
case "$1" in
  -h | --help | help)
    help_msg
  ;;
  -run| --run)
    shift
    run_command "$@"
  ;;
  *)
    bomb_out
  ;;
esac

