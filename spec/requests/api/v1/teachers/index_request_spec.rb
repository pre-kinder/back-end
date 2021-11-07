require 'rails_helper'

RSpec.describe 'Teachers index endpoint' do
  it 'returns a list of teachers in a classroom' do
    create_list(:teacher, 10)

    get '/api/v1/classroom/1/teachers'
  end
end
