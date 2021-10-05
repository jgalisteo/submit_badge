# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/badges', type: :request do
  # Badge. As you add validations to Badge, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {date: Time.zone.today, name: 'Name'}
  end

  let(:invalid_attributes) do
    {date: nil, name: nil}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Badge.create! valid_attributes
      get badges_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      badge = Badge.create! valid_attributes
      get badge_url(badge)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_badge_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Badge' do
        expect do
          post badges_url, params: { badge: valid_attributes }
        end.to change(Badge, :count).by(1)
      end

      it 'redirects to the created badge' do
        post badges_url, params: { badge: valid_attributes }
        expect(response).to redirect_to(badge_url(Badge.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Badge' do
        expect do
          post badges_url, params: { badge: invalid_attributes }
        end.to change(Badge, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post badges_url, params: { badge: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested badge' do
      badge = Badge.create! valid_attributes
      expect do
        delete badge_url(badge)
      end.to change(Badge, :count).by(-1)
    end

    it 'redirects to the badges list' do
      badge = Badge.create! valid_attributes
      delete badge_url(badge)
      expect(response).to redirect_to(badges_url)
    end
  end
end