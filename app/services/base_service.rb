class BaseService

  def service_get_request(url, headers)
    return_response = HttpResponse.new
    return_response.full_response = CustomRestClient.get_request "#{Const::Url::BASE_URL}#{url}", headers
    unless return_response.full_response.eql? ''
      return_response.response_entity = JSON.parse(return_response.full_response)
    end
    return_response
  end

  def service_post_request(url, body, headers)

    return_response = HttpResponse.new
    return_response.full_response = CustomRestClient.post_request "#{Const::Url::BASE_URL}#{url}", body, headers
    unless return_response.full_response.body.eql?('') || return_response.full_response.headers[:content_type].eql?('text/html; charset=utf-8')
      return_response.response_entity = JSON.parse(return_response.full_response)
    end
    return_response
  end

  def service_put_request(url, body, headers)

    return_response = HttpResponse.new
    return_response.full_response = CustomRestClient.put_request "#{Const::Url::BASE_URL}#{url}", body, headers
    unless return_response.full_response.eql? ''
      return_response.response_entity = JSON.parse(return_response.full_response)
    end
    return_response
  end

  def log(message)
    CustomRestClient.log(message)
  end

  def build_headers_with( headers = {})
    {
      'Accept' => 'application/json',
      'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36',
      'Content-Type' => 'application/json',
      'Referer' => 'http://petstore.swagger.io/',
      'Accept-Encoding' => 'gzip, deflate',
      'Accept-Language' => 'en-US,en;q=0.9'
    }.merge!(headers)
  end


end
