class PetService < BaseService
  def get_pet_by_id(id)
    log("\n\nGet Pet by id #{id}:")
    headers = build_headers_with()
    response = service_get_request("/pet/#{id}",  headers)
    response
  end

  def create_pet(body)
    log("\n\nCreate Pet:")
    headers = build_headers_with({'Origin' => Const::Url::BASE_URL})
    response = service_put_request("/pet", body, headers)
    response
  end

end