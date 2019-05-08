require_relative '../spec_helper'

describe '[Project]' do
  let(:teamlab_module) { :project }

  describe '#add_importing_url_to_queue' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_importing_url_to_queue }
      let(:args) { [BASECAMP_URL, BASECAMP_LOGIN, BASECAMP_PSW, IMPORT_CLOSED_PROJECTS, DISABLE_NOTIFICATONS, IMPORT_USERS_AS_COLLABORATORS] }
    end
  end

  describe '#get_projects_for_import' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_projects_for_import }
      let(:args) { [BASECAMP_URL, BASECAMP_LOGIN, BASECAMP_PSW] }
    end
  end

  describe '#get_import_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_import_status }
    end
  end
end
