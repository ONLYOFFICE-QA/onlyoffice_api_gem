# frozen_string_literal: true

require 'spec_helper'

user_to_remove = api.people.add_user(random_bool, random_email, random_word.capitalize, random_word.capitalize).data
api.people.change_people_status('2', [user_to_remove['id']])

describe '[People] Remove' do
  let(:teamlab_module) { :people }

  describe '#start_remove' do
    it_behaves_like 'an api request' do
      let(:command) { :start_remove }
      let(:args) { [user_to_remove['id']] }
    end
  end

  describe '#remove_progress' do
    it_behaves_like 'an api request' do
      let(:command) { :remove_progress }
      let(:args) { [user_to_remove['id']] }
    end
  end

  describe '#terminate_remove' do
    it_behaves_like 'an api request' do
      let(:command) { :terminate_remove }
      let(:args) { [user_to_remove['id']] }
    end
  end
end
