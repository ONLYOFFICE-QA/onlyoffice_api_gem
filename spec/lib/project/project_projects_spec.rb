# frozen_string_literal: true

require 'spec_helper'

projects_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
project = api.project.create_project(random_word, random_word, projects_user['id'], random_word(3), false).data
project_to_delete = api.project.create_project(random_word, random_word, projects_user['id'], random_word(3), false).data
project_status = 'open'

describe '[Project] Projects' do
  let(:teamlab_module) { :project }

  describe '#create_project' do
    it_behaves_like 'an api request' do
      let(:command) { :create_project }
      let(:args) { [random_word, random_word, projects_user['id'], random_word(3), false] }
    end
  end

  describe '#get_projects' do
    it_behaves_like 'an api request' do
      let(:command) { :get_projects }
    end
  end

  describe '#get_project' do
    it_behaves_like 'an api request' do
      let(:command) { :get_project }
      let(:args) { [project['id']] }
    end
  end

  describe '#get_participated_projects' do
    it_behaves_like 'an api request' do
      let(:command) { :get_participated_projects }
    end
  end

  describe '#filter_projects' do
    it_behaves_like 'an api request' do
      let(:command) { :filter_projects }
    end
  end

  describe '#get_followed_projects' do
    it_behaves_like 'an api request' do
      let(:command) { :get_followed_projects }
    end
  end

  describe '#get_project_by_status' do
    it_behaves_like 'an api request' do
      let(:command) { :get_project_by_status }
      let(:args) { [project_status] }
    end
  end

  describe '#get_project_files' do
    it_behaves_like 'an api request' do
      let(:command) { :get_project_files }
      let(:args) { [project['id']] }
    end
  end

  describe '#search_all_projects' do
    it_behaves_like 'an api request' do
      let(:command) { :search_all_projects }
      let(:args) { [random_word] }
    end
  end

  describe '#search_project' do
    it_behaves_like 'an api request' do
      let(:command) { :search_project }
      let(:args) { [project['id'], random_word] }
    end
  end

  describe '#update_project_tags' do
    it_behaves_like 'an api request' do
      let(:command) { :update_project_tags }
      let(:args) { [project['id'], random_word(3)] }
    end
  end

  describe '#update_project_status' do
    it_behaves_like 'an api request' do
      let(:command) { :update_project_status }
      let(:args) { [project['id'], project_status] }
    end
  end

  describe '#follow_unfollow_project' do
    it_behaves_like 'an api request' do
      let(:command) { :follow_unfollow_project }
      let(:args) { [project['id']] }
    end
  end

  describe '#update_project' do
    it_behaves_like 'an api request' do
      let(:command) { :update_project }
      let(:args) { [project['id'], random_word, projects_user['id'], { private: true, notify: true }] }
    end
  end

  describe '#delete_project' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_project }
      let(:args) { [project['id']] }
    end
  end

  describe '#delete_projects' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_projects }
      let(:args) { [[project_to_delete['id']]] }
    end
  end
end
