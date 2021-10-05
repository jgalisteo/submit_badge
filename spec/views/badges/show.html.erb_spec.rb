# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/show', type: :view do
  before(:each) do
    @badge = assign(:badge, Badge.create!(
                              date: Time.zone.today,
                              name: 'Name'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
