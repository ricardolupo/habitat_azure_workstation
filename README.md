# habitat_azure_workstation

# Overview
This cookbook is a wrapper cookbook that allows you to instantiate n number of Azure VMs for use in Habitat hack days/popups/meetups etc. It utilizes Test-kitchen as the deployment engine to spin up those VMs

# Getting started
In order to get started, you will need to have the following:
1. A valid Azure subscription and a Service Principal setup on your local workstation setup to communicate to your Azure Cloud. https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal
2. *CHEF-DK* Installed on your local workstation. In addition, you will need the *kitchen-azurerm* driver. You can install by running `chef gem install kitchen-azurerm` after you have installed the CHEF-DK.

# Launching VMs

Currently, the Test-kitchen suite is configured to work on Azure's Openlogic Centos7.2 distro. You can swap out this platform for any platform of your choice, as the underlying cookbook that configures the workstations is multi-platform.

Run `kitchen converge` initially to ensure that you have your Azure service principal configured properly. Once you have verified that this is working, go ahead and increment the `1.upto(n)` operator to where n = the number of workstations you want to create.

Once you have specified the number of VMs that you want, run `kitchen converge --parrallel`. This will ensure that instances are created in parallel, rather than in serial.

In the output, you will want to copy the resource group that is created as part of the Test-kitchen run. While the resource group is specified in the .kitchen.yml file, Azure will dynamically create that resource group, with a timestamp at the end of the resource group name.

Once your Test-kitchen run is complete, you can obtain the IP addresses of the VMs by running `azure vm list-ip-address <resource group name>` from the command line, where <resource group name> is the resource group that you copied from the initial Test-kitchen run.

Credentials for the spun up VMs are U: *chef* P: *chef*

#NOTE
You will not be able to re-converge your VMs after the Test-kitchen run is complete, and that is by design. If you have issues with a node, just go ahead and destroy the affected VM and recreate it. 
