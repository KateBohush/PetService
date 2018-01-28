require 'rake'
require 'require_all'
require 'rspec/core/rake_task'
require 'parallel_tests'
require 'parallel_tests/tasks'
require 'rspec'
require 'celluloid/pmap'
require 'rest-client'
require 'rubygems'
require 'yaml'
require_relative 'config/env_config'

include EnvConfig

FileUtils.rm_rf("#{APP_ROOT}/log/") if File.exist?("#{APP_ROOT}/log/")
FileUtils.rm_rf("#{APP_ROOT}/gen/results/") if File.exist?("#{APP_ROOT}/gen/results/")
Dir.mkdir("#{APP_ROOT}/log/") unless File.exist?("#{APP_ROOT}/log/")
Dir.mkdir("#{APP_ROOT}/gen/") unless File.exist?("#{APP_ROOT}/gen/")
Dir.mkdir("#{APP_ROOT}/gen/results/") unless File.exist?("#{APP_ROOT}/gen/results/")

require_relative 'lib/utilities/custom_logger'
require_relative 'lib/rest/custom_rest_client'

STDOUT.sync = true
STDERR.sync = true

require_all 'app'
require_all 'lib'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/services_spec')
end


desc 'Set preconditions'

task :start do
  puts 'Start'
end

desc 'Run tests'
task services_spec: [:start] do
         suites = SUITES.split(',')
cmd = 'parallel_rspec'

suites.each do |suite|
  cmd = "#{cmd} spec/services_spec/#{suite}_spec"
end

begin

  sh cmd
rescue StandardError => er
  puts er.message
end
end

