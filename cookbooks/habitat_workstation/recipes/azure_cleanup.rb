#
# Cookbook Name:: habitat_workstation
# Recipe:: azure_cleanup
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


directory '/home/azure/.ssh' do
  action :delete
  recursive true
end
