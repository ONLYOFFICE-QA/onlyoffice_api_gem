require 'spec_helper'

describe '[Community]' do
  let(:teamlab_module) { :community }

  describe '#create_event' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_event }
      let(:args) { [random_word, random_word, { type: 'News' }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :community_event_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_poll' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_event }
      let(:args) { [random_word, random_word, { type: 'Poll' }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :poll_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#update_event' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_event }
      let(:args) do
        [DATA_COLLECTOR[:community_event_ids].first,
         title: random_word,
         content: random_word,
         type: 'News']
      end
    end
  end

  describe '#get_all_events' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_events }
    end
  end

  describe '#get_my_events' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_my_events }
    end
  end

  describe '#get_event' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_event }
      let(:args) { [random_id(:community_event)] }
    end
  end

  describe '#search_events' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_events }
      let(:args) { [random_word] }
    end
  end

  describe '#get_event_comments' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_event_comments }
      let(:args) { [random_id(:community_event)] }
    end
  end

  describe '#vote_for_event' do
    it_should_behave_like 'an api request' do
      let(:command) { :vote_for_event }
      let(:args) { [random_id(:poll), rand(2)] }
    end
  end

  describe '#add_comment_to_event' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_comment_to_event }
      let(:args) { [random_id(:community_event), random_word] }
    end
  end
end
