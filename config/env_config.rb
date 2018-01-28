module EnvConfig
  SUITES = ENV['SUITES'] ||= 'all'
  APP_ROOT = File.expand_path('../..', __FILE__)
end
