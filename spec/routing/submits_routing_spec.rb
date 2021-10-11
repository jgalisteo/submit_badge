require 'rails_helper'

RSpec.describe SubmitsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/submits').to route_to('submits#create')
    end

    it 'routes to #success' do
      expect(get: '/submits/1/success').to route_to('submits#success', id: '1')
    end
  end
end
