#
# Cookbook Name:: habitat_azure_workstation
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'habitat_workstation'
include_recipe 'habitat_workstation::install_hab'
include_recipe 'habitat_workstation::azure_cleanup'
