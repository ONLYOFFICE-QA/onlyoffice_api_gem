# frozen_string_literal: true

require 'spec_helper'

describe '[Files][Functional] #escape_folder_id' do
  it 'api.files.escape_folder_id will not break some url with some special symbols' do
    id = 'a_b-c'
    expect(api.files.escape_folder_id(id)).to eq(id)
  end

  it 'api.files.escape_folder_id will fix url with |' do
    id = 'a_b-c|d'
    expect(api.files.escape_folder_id(id)).not_to include('|')
  end
end
