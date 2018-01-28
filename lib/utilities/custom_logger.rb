require 'logger'

class CustomLogger
  def initialize(file)
    @logger_f = Logger.new(file)
    @logger_c = Logger.new(STDOUT)
    @logger_f.datetime_format = '%Y-%m-%d %H:%M:%S'
    @logger_c.datetime_format = '%Y-%m-%d %H:%M:%S'
  end

  def log_to_file(msg)
    @logger_f.debug(msg)
  end

  def log_to_console(msg)
    @logger_c.debug(msg)
  end

  def log(msg)
    @logger_f.debug(msg)
    @logger_c.debug(msg)
  end

  def close
    @logger_f.close
  end
end
