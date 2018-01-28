RSpec.describe 'Create pet -', feature: Const::Features::PET_SERVICE, severity: :normal do
  CREATE_PET = YamlLoader.read_yaml("#{APP_ROOT}/spec/fixtures/services_fs/pet_service_fs/create_pet.yml")
  before do
    @pet_service = get_pet_service
  end

  context 'success 200' do
    @test_data = bundle_test_name description, CREATE_PET
    @test_data.each do |test_set|
      it " (#{test_set['description']})" do
        response = @pet_service.create_pet(test_set['request_data'])
        expect(response.full_response.code).to be(200)
        expect(response.response_entity).to eq(test_set['response_data'])
      end
    end
  end

  context 'fail 500' do
    @test_data = bundle_test_name description, CREATE_PET
    @test_data.each do |test_set|
      it " (#{test_set['description']})" do
        response = @pet_service.create_pet(test_set['request_data'])
        expect(response.full_response.code).to be(500)
        expect(response.response_entity).to eq(test_set['response_data'])
      end
    end
  end

end