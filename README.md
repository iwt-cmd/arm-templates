# ARM Template Collection

## Overview
Collection of ARM templates for setting up a base lab environment.  Originally developed for the A Cloud Guru Azure sandbox which limits uptime to 4 hours max and a single resource group.  While working on labs, these resources were generally needed before actual exercieses could be started.

Standard ARM JSON templates were used rather than BICEP since, at this time, JSON is the native Azure format.  BICEP versions may be provided in the future.

## Templates

### *Networking > vnetdeploy.json / parameters.ventdeploy.json*
---
Deploys 2 VNETs with a single subnet in each.  The first VNET (default: "VENT01") is considered the main network with base resources installed.

### *Core > bastiondeploy.json / parameters.bastiondeploy.json*
---
Deploys Azure bastion host within the first VNET (default: "VNET01") with external access enabled.  This allows for access to the hosts in the main VNET.  Peering, other inter-VNET networking or additional bastion hosts would needed for access other VNET resources.

### *Compute > DC01 > dc01deploy.json / parameters.dc01deploy.json*
---
Deploys a Win 2019 Datacenter VM within the main VNET (default: "VNET01") with no public IP (bastion or supplemental access required).  "test-domain.ps1" and "test-user.ps1" will create a base domain controller with 2 users.  The domain name, domain parameters and user names/passwords can be changed within the individual PoSH scripts.  These can be ran manually or through configuration management post VM deployment.

### *Compute > Win2019Base > w2019deploy.json / parameters.w2019deploy.json*
---
Win 2019 Datacenter base VM similar to DC01 configuration.  Seperated from the DC01 files to allow for easier custom deployments.