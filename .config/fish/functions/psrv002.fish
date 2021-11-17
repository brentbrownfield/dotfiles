function psrv002
set -xg GOVC_INSECURE true
set -xg GOVC_DATASTORE ds002a
set -xg GOVC_RESOURCE_POOL cluster01/Resources
set -xg GOVC_NETWORK 'DSwitch01-Production - VLAN20'
set -xg GOVC_USERNAME 'root'
set -xg GOVC_URL psrv002.home.brownfield.soy
set -xg GOVC_PASSWORD (bwPassword -s esxi -u $GOVC_USERNAME)

set -e GOVC_DATACENTER
end
