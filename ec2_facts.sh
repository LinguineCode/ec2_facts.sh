#!/bin/bash

# TO DO:
#  1) Find a way to read metadata fields dynamically
#

MAC=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/)
METADATA="ami-id ami-launch-index ami-manifest-path block-device-mapping/ami block-device-mapping/ephemeral0 hostname instance-action instance-id instance-type kernel-id local-hostname local-ipv4 mac metrics/vhostmd network/interfaces/macs/$MAC/device-number network/interfaces/macs/$MAC/interface-id network/interfaces/macs/$MAC/local-hostname network/interfaces/macs/$MAC/local-ipv4s network/interfaces/macs/$MAC/mac network/interfaces/macs/$MAC/owner-id network/interfaces/macs/$MAC/security-group-ids network/interfaces/macs/$MAC/security-groups network/interfaces/macs/$MAC/subnet-id network/interfaces/macs/$MAC/subnet-ipv4-cidr-block network/interfaces/macs/$MAC/vpc-id network/interfaces/macs/$MAC/vpc-ipv4-cidr-block placement/availability-zone profile public-keys/ reservation-id security-groups services/domain/"

# anything at network/interfaces/macs needs the MAC address specified
MAC=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/)

for i in $METADATA
do
 echo "ec2metadata-$(basename $i)=$(curl -s http://169.254.169.254/latest/meta-data/$i/)"
done
