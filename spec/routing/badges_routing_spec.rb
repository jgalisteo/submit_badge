# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BadgesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/badges').to route_to('badges#index')
    end

    it 'routes to #new' do
      expect(get: '/badges/new').to route_to('badges#new')
    end

    it 'routes to #show' do
      expect(get: '/badges/1').to route_to('badges#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/badges').to route_to('badges#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/badges/1').to route_to('badges#destroy', id: '1')
    end
  end
end
