require 'json'
class CustomRestClient

  attr_accessor :logger

  def self.logger=(logger)
    @@logger = logger
  end

  def self.get_request(url, headers = nil)
    response = RestClient::Request.new(method: :get, url: url,
                                       headers: headers, timeout: 120, verify_ssl: false)
                   .execute {|response, _request, _result| response}
    print_logs('get', url, headers, nil, response)
    return response
  end

  def self.post_request(url, body = nil, headers = nil)
    payload = body.nil? ? '' : body
    payload = headers['Content-Type'].to_s.end_with?('json') ? payload.to_json : payload
    response = RestClient::Request.new(method: :post, url: url,
                                       payload: payload, headers: headers, timeout: 120, verify_ssl: false)
                   .execute {|response, _request, _result| response}
    print_logs('post', url, headers, body, response)
    response
  end

  def self.put_request(url, body, headers = nil)
    payload = body.nil? ? '' : body
    payload = headers['Content-Type'].to_s.end_with?('json') ? payload.to_json : payload
    response = RestClient::Request.new(method: :put, url: url,
                                       payload: payload, headers: headers, timeout: 120, verify_ssl: false)
                   .execute {|response, _request, _result| response}
    print_logs('put', url, headers, body, response)
    response
  end

  def self.log(message)
    @@logger.log_to_file(message)
    @@logger.log_to_console(message)
  end

  private

  def self.log_to_file(method, url, headers, body = nil, response)
    @@logger.log_to_file('REQUEST METHOD: ' + method + ', to url: ' + url)
    @@logger.log_to_file('with next headers: ' + JSON.pretty_generate(headers))
    if body
      @@logger.log_to_file('with body: ' + JSON.pretty_generate(body))
    end
    @@logger.log_to_file('RESPOND WITH: status code ' + response.code.to_s + ' and body: ' + JSON.pretty_generate(JSON.parse(response.body).to_h))
  rescue JSON::ParserError, NoMethodError, TypeError
    @@logger.log_to_file('RESPOND WITH: status code ' + response.code.to_s + ' and body: ' + response.body)
  end

  def self.log_to_console(method, url, headers, body = nil, response)
    @@logger.log_to_console('REQUEST METHOD: ' + method + ', to url: ' + url)
    @@logger.log_to_console('with next headers: ' + JSON.pretty_generate(headers))
    if body
      @@logger.log_to_console('with body: ' + JSON.pretty_generate(body))
    end
    @@logger.log_to_console('RESPOND WITH: status code ' + response.code.to_s + ' and body: ' + JSON.pretty_generate(JSON.parse(response.body).to_h))
  rescue JSON::ParserError, NoMethodError, TypeError
    @@logger.log_to_console('RESPOND WITH: status code ' + response.code.to_s + ' and body: ' + response.body)
  end

  def self.print_logs(method, url, headers, body = nil, response)
    log_to_console(method, url, headers, body, response)
    log_to_file(method, url, headers, body, response)
  end

end
