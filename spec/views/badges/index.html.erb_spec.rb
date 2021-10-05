# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/index', type: :view do
  before(:each) do
    assign(:badges, [
             Badge.create!(
               date: Time.zone.yesterday,
               name: 'Name'
             ),
             Badge.create!(
               date: Time.zone.today,
               name: 'Name'
             )
           ])
  end

  it 'renders a list of badges' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end
end
