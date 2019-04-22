require 'spec_helper'

describe '[Community]' do
  let(:teamlab_module) { :community }

  describe '#get_self' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :people }
      let(:command) { :get_self }
      let(:add_data_to_collector) { true }
      let(:data_param) { :self_username }
      let(:param_names) { %w[userName] }
    end
  end

  describe '#add_bookmark' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_bookmark }
      let(:args) { [SOME_URL, random_word, { tags: [random_word(4), random_word(4), random_word(4)].join(', ') }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :bookmark_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_comment_to_bookmark' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_comment_to_bookmark }
      let(:args) { [random_id(:bookmark), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :bookmark_comment_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_all_bookmarks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_bookmarks }
    end
  end

  describe '#get_all_bookmark_tags' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_bookmark_tags }
    end
  end

  describe '#get_bookmark' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_bookmark }
      let(:args) { [random_id(:bookmark)] }
    end
  end

  describe '#get_bookmarks_added_by_me' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_bookmarks_added_by_me }
    end
  end

  describe '#get_my_favourite_bookmarks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_my_favourite_bookmarks }
    end
  end

  describe '#get_top_of_day_bookmarks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_top_of_day_bookmarks }
    end
  end

  describe '#get_top_of_week_bookmarks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_top_of_week_bookmarks }
    end
  end

  describe '#get_top_of_month_bookmarks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_top_of_month_bookmarks }
    end
  end

  describe '#get_top_of_year_bookmarks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_top_of_year_bookmarks }
    end
  end

  describe '#get_bookmarks_by_tag' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_bookmarks_by_tag }
      let(:args) { [random_word(4)] }
    end
  end

  describe '#get_recently_added_bookmarks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_recently_added_bookmarks }
    end
  end

  describe '#get_bookmark_comments' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_bookmark_comments }
      let(:args) { [random_id(:bookmark)] }
    end
  end

  describe '#search_bookmarks' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_bookmarks }
      let(:args) { [random_word] }
    end
  end

  describe '#delete_bookmark' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_bookmark }
      let(:args) { [random_id(:bookmark)] }
    end
  end
end
