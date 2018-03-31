#
# Cookbook:: ariel-test
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'ariel-test::default' do
  before do
    Fauxhai.mock(platform: 'aix', version: '7.1')
  end

  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'install and configures ntp' do
      expect(chef_run).to start_service('xntpd')
    end

    it 'creates a file with the necessary content' do
      expect(chef_run).to create_file('/tmp/something').with(
        owner: "root"
      )
    end
  end


  context 'When all attributes are default, on AIX 7' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'aix', version: '7.1')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'install and configures ntp' do
      expect(chef_run).to start_service('xntpd')
    end

    it 'creates a file with the necessary content' do
      expect(chef_run).to create_file('/tmp/something').with(
        owner: "root",
        content: "1024"
      )
    end

  end

  context 'When all attributes are default, on CentOS 7.4.1708' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
