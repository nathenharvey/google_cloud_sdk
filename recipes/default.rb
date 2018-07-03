#
# Cookbook:: google_cloud_sdk
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

cloud_sdk_repo = "cloud-sdk-#{node['lsb']['codename']}"

apt_repository 'google-cloud-sdk' do
  uri 'http://packages.cloud.google.com/apt'
  distribution ''
  components [cloud_sdk_repo, 'main']
  keyserver 'https://packages.cloud.google.com'
  key 'https://packages.cloud.google.com/apt/doc/apt-key.gpg'
  cache_rebuild true
end

package 'google-cloud-sdk'
