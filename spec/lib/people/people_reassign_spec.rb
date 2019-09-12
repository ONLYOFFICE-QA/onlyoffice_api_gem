# frozen_string_literal: true

require 'spec_helper'

describe '[People] Reassign' do
  let(:teamlab_module) { :people }

  describe 'Preconditions' do
    describe '#add_user' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_user }
        let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :user_ids }
        let(:param_names) { %w[id] }
      end
    end

    describe '#add_user' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_user }
        let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :user_ids }
        let(:param_names) { %w[id] }
      end
    end

    describe '#change_people_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :change_people_status }
        let(:args) { [2, @data_collector[:user_ids].first] }
      end
    end
  end

  describe '#start_reassign_user_data' do
    it_should_behave_like 'an api request' do
      let(:command) { :start_reassign_user_data }
      let(:args) { [@data_collector[:user_ids].first, @data_collector[:user_ids].last, false] }
    end
  end

  describe '#get_reassign_progress' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_reassign_progress }
      let(:args) { [@data_collector[:user_ids].first] }
    end
  end

  describe '#terminate_reassign' do
    it_should_behave_like 'an api request' do
      let(:command) { :terminate_reassign }
      let(:args) { [@data_collector[:user_ids].first] }
    end
  end
end
