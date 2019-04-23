require 'spec_helper'

describe '[Community]' do
  let(:teamlab_module) { :community }

  describe '#add_thread_to_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_thread_to_category }
      let(:args) { [-1, random_word, random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :thread_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_topic_to_thread' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_topic_to_thread }
      let(:args) { [random_id(:thread), random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :thread_topic_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_post_to_topic' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_post_to_topic }
      let(:args) { [DATA_COLLECTOR[:thread_topic_ids].last, random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :topic_post_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_forums' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_forums }
    end
  end

  describe '#get_thread_topics' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_thread_topics }
      let(:args) { [random_id(:thread)] }
    end
  end

  describe '#get_last_updated_topics' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_last_updated_topics }
    end
  end

  describe '#get_posts' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_posts }
      let(:args) { [random_id(:thread_topic)] }
    end
  end

  describe '#search_topics' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_topics }
      let(:args) { [random_word(5)] }
    end
  end

  describe '#update_topic_in_thread' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_topic_in_thread }
      let(:args) { [random_id(:thread_topic), random_word] }
    end
  end

  describe '#update_post_in_topic' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_post_in_topic }
      let(:args) { [DATA_COLLECTOR[:thread_topic_ids].last, random_id(:topic_post)] }
    end
  end

  describe '#delete_post_in_topic' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_post_in_topic }
      let(:args) { [DATA_COLLECTOR[:thread_topic_ids].last, DATA_COLLECTOR[:topic_post_ids].pop] }
    end
  end
end
