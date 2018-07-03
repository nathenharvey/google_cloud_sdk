#
# Cookbook:: google_cloud_sdk
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'google_cloud_sdk::default' do
  %w( 16.04 14.04 ).each do |os_version|
    context "When all attributes are default, on Ubuntu #{os_version}" do
      let(:chef_run) do
        # for a complete list of available platforms and versions see:
        # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
        runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: os_version)
        runner.converge(described_recipe)
      end

      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end

      it 'creates an apt repository' do
        expect(chef_run).to add_apt_repository('google-cloud-sdk')
      end

      it 'installs the google-cloud-sdk package' do
        expect(chef_run).to install_package('google-cloud-sdk')
      end
    end
  end
end
