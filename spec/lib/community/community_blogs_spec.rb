# frozen_string_literal: true

require 'spec_helper'

describe '[Community]' do
  let(:teamlab_module) { :community }

  describe '#get_self' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :people }
      let(:command) { :get_self }
      let(:add_data_to_collector) { true }
      let(:data_param) { :self_username }
      let(:param_names) { %w[userName] }
    end
  end

  describe '#create_post' do
    it_behaves_like 'an api request' do
      let(:command) { :create_post }
      let(:args) { [random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :community_post_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_comment' do
    it_behaves_like 'an api request' do
      let(:command) { :add_comment }
      let(:args) { [random_id(:community_post), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :community_post_comment_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#update_post' do
    it_behaves_like 'an api request' do
      let(:command) { :update_post }
      let(:args) { [random_id(:community_post), random_word, random_word, { tags: [random_word(4), random_word(4), random_word(4)].join(',') }] }
    end
  end

  describe '#get_all_posts' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_posts }
    end
  end

  describe '#get_blog_tags' do
    it_behaves_like 'an api request' do
      let(:command) { :get_blog_tags }
    end
  end

  describe '#get_my_posts' do
    it_behaves_like 'an api request' do
      let(:command) { :get_my_posts }
    end
  end

  describe '#get_post_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_post }
      let(:args) { [random_id(:community_post)] }
    end
  end

  describe '#get_posts_by_tag' do
    it_behaves_like 'an api request' do
      let(:command) { :get_posts_by_tag }
      let(:args) { [random_word(4)] }
    end
  end

  describe '#search_posts' do
    it_behaves_like 'an api request' do
      let(:command) { :search_posts }
      let(:args) { [random_word] }
    end
  end

  describe '#get_user_posts' do
    it_behaves_like 'an api request' do
      let(:command) { :get_user_posts }
      let(:args) { [@data_collector[:self_username].sample] }
    end
  end

  describe '#get_comments' do
    it_behaves_like 'an api request' do
      let(:command) { :get_comments }
      let(:args) { [random_id(:community_post)] }
    end
  end

  describe '#delete_post' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_post }
      let(:args) { [@data_collector[:community_post_ids].pop] }
    end
  end
end
