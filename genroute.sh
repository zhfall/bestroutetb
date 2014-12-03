#!/bin/sh

./generate.sh 20-route \
  --net=cn,hk,jp,0.0.0.0/0 \
  --vpn=us \
  --nodefaultgw=1 \
  --profile=custom \
  --groupgw=1 \
  --header="#!/bin/sh
echo \`date\` \$6-online >> /tmp/ppplog
case \"\$6\" in" \
  --netgroupname=wan \
  --vpngroupname=vpn \
  --groupheader="%name)
ip -b - <<FILE" \
  --format="r a %prefix/%length via %gw" \
  --groupfooter="FILE
;;" \
  --footer="esac
exit 0" \
  --netgw=\$5 \
  --vpngw=\$5

#chmod +x 20-route
#scp 20-route root@192.168.1.1:/etc/ppp/ip-up.d/
#rm -f 20-route
