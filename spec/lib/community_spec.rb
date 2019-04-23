require_relative '../spec_helper'

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

  describe '#create_page' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_page }
      let(:args) { [random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :wiki_page_name_ids }
      let(:param_names) { %w[name] }
    end
  end

  describe '#create_wiki_page_comment' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_wiki_page_comment }
      let(:args) { [random_id(:wiki_page_name), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :wiki_page_comment_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#upload_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :upload_files }
      let(:args) { [FILE_FOR_UPLOAD] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :wiki_page_file_name_ids }
      let(:param_names) { %w[name] }
    end
  end

  describe '#get_wiki_pages' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_wiki_pages }
    end
  end

  describe '#get_wiki_page' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_wiki_page }
      let(:args) { [random_id(:wiki_page_name)] }
    end
  end

  describe '#get_wiki_file_info' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_wiki_file_info }
      let(:args) { [random_id(:wiki_page_file_name)] }
    end
  end

  describe '#get_page_history' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_page_history }
      let(:args) { [random_id(:wiki_page_name)] }
    end
  end

  describe '#get_all_page_comments' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_page_comments }
      let(:args) { [random_id(:wiki_page_name)] }
    end
  end

  describe '#search_wiki_pages_by_name' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_wiki_pages_by_name }
      let(:args) { [random_word] }
    end
  end

  describe '#search_wiki_pages_by_content' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_wiki_pages_by_content }
      let(:args) { [random_word] }
    end
  end

  describe '#update_wiki_page' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_wiki_page }
      let(:args) { [random_id(:wiki_page_name), random_word] }
    end
  end

  describe '#update_wiki_page_comment' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_wiki_page_comment }
      let(:args) { [random_id(:wiki_page_comment), random_word] }
    end
  end

  describe '#delete_wiki_page_comment' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_wiki_page_comment }
      let(:args) { [DATA_COLLECTOR[:wiki_page_comment_ids].pop] }
    end
  end

  describe '#delete_wiki_file' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_wiki_file }
      let(:args) { [DATA_COLLECTOR[:wiki_page_file_name_ids].pop] }
    end
  end

  describe '#delete_wiki_page' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_wiki_page }
      let(:args) { [DATA_COLLECTOR[:wiki_page_name_ids].pop] }
    end
  end
end
