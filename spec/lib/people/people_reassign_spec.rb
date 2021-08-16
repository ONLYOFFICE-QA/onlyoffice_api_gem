# frozen_string_literal: true

require 'spec_helper'

from_user_reassign = api.people.add_user(random_bool, random_email, random_word.capitalize, random_word.capitalize).data
api.people.change_people_status('2', [from_user_reassign['id']])
to_user_reassign = api.people.add_user(random_bool, random_email, random_word.capitalize, random_word.capitalize).data

describe '[People] Reassign' do
  let(:teamlab_module) { :people }

  describe '#start_reassign_user_data' do
    it_behaves_like 'an api request' do
      let(:command) { :start_reassign_user_data }
      let(:args) { [from_user_reassign['id'], to_user_reassign['id'], false] }
    end
  end

  describe '#get_reassign_progress' do
    it_behaves_like 'an api request' do
      let(:command) { :get_reassign_progress }
      let(:args) { [from_user_reassign['id']] }
    end
  end

  describe '#terminate_reassign' do
    it_behaves_like 'an api request' do
      let(:command) { :terminate_reassign }
      let(:args) { [from_user_reassign['id']] }
    end
  end
end
