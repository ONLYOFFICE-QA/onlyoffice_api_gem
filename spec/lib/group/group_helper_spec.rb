# frozen_string_literal: true

require 'spec_helper'

describe 'GroupHelper' do
  let(:user) do
    api.people
       .add_user(false,
                 Faker::Internet.email,
                 Faker::Name.first_name,
                 Faker::Name.last_name)
       .data
  end

  before do
    @group_name = Faker::Music::RockBand.name
    api.group.add_group(user['id'], @group_name)
  end

  describe 'info_by_name', retry: 5 do
    it 'info_by_name return nil for nonexsting group name' do
      expect(api.group.info_by_name('no-group')).to be_nil
    end

    it 'info_by_name return data for existing group name' do
      expect(api.group.info_by_name(@group_name)['manager']).to eq(user['userName'])
    end
  end
end
