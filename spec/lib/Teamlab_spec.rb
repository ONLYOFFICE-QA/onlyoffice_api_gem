require_relative '../spec_helper'

describe Teamlab do

  before :all do
    Teamlab.configure do |config|
      config.server = SERVER
      config.username = USERNAME
      config.password = PASSWORD
    end
  end

  describe 'Preparing enviroment' do
    describe '#add_user' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :people }
        let(:command) { :add_user }
        let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :user_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#get_self' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :people }
        let(:command) { :get_self }
        let(:add_data_to_collector) { true }
        let(:data_param) { :self_username }
        let(:param_names) { %w(userName) }
      end
    end

    describe '#get_my_files' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :files }
        let(:command) { :get_my_files }
        let(:add_data_to_collector) { true }
        let(:data_param) { :my_documents_ids }
        let(:param_names) { %w(current id) }
      end
    end

    describe '#create_file' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :files }
        let(:command) { :create_file }
        let(:args) { [random_id(:my_documents), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :file_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#create_person' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :crm }
        let(:command) { :create_person }
        let(:args) { [random_word.capitalize, random_word.capitalize] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :contact_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#create_project' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :project }
        let(:command) { :create_project }
        let(:args) { [random_word, random_word, random_id(:user), random_word(3), random_bool] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :project_ids }
        let(:param_names) { %w(id) }
      end
    end
  end


  describe '[Mail]' do

    let(:teamlab_module) { :mail }

    describe '#create_tag' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_tag }
        let(:args) { [random_word(4), {style: rand(15)}] }
      end
    end

    describe '#create_account_by_email' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_account_by_email }
        let(:args) { [USERNAME, PASSWORD] }
      end
    end





########################################################################################################################
############################################# END CREATING #############################################################
########################################################################################################################

    describe '#get_filtered_messages' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_filtered_messages }
        let(:args) { [2] }
      end
    end

    describe '#get_message' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_message }
        let(:args) {message_id}
      end
    end

    describe '#get_message_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_message_template }
      end
    end

    describe '#get_account_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_account_list }
      end
    end

    describe '#get_tag_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_tag_list }
      end
    end



########################################################################################################################
############################################### DELETING ###############################################################
########################################################################################################################
  end

  describe 'Cleaning enviroment' do

    describe '#delete_file' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :files }
        let(:command) { :delete_file }
        let(:args) { [DATA_COLLECTOR[:file_ids].pop] }
      end
    end

    describe '#delete_contact' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :crm }
        let(:command) { :delete_contact }
        let(:args) { [DATA_COLLECTOR[:contact_ids].pop] }
      end
    end

    describe '#delete_project' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :project }
        let(:command) { :delete_project }
        let(:args) { [DATA_COLLECTOR[:project_ids].pop] }
      end
    end
  end
end