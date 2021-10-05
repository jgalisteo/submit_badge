# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/new', type: :view do
  before(:each) do
    assign(:badge, Badge.new(
                     name: 'MyString'
                   ))
  end

  it 'renders new badge form' do
    render

    assert_select 'form[action=?][method=?]', badges_path, 'post' do
      assert_select 'input[name=?]', 'badge[name]'
    end
  end
end
