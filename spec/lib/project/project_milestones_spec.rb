# frozen_string_literal: true

require 'spec_helper'

milestones_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
milestones_project = api.project.create_project(random_word, random_word, milestones_user['id'], random_word(3), false).data
milestone = api.project.add_milestone(milestones_project['id'], random_word, DateTime.commercial(2015).to_s, milestones_user['id']).data
milestone_to_delete = api.project.add_milestone(milestones_project['id'], random_word, DateTime.commercial(2015).to_s, milestones_user['id']).data
milestone_status = 'Open'

describe '[Project] Milestones' do
  let(:teamlab_module) { :project }

  describe '#add_milestone' do
    it_behaves_like 'an api request' do
      let(:command) { :add_milestone }
      let(:args) { [milestones_project['id'], random_word, DateTime.commercial(2015).to_s, milestones_user['id']] }
    end
  end

  describe '#get_upcoming_milestones' do
    it_behaves_like 'an api request' do
      let(:command) { :get_upcoming_milestones }
    end
  end

  describe '#get_overdue_milestones' do
    it_behaves_like 'an api request' do
      let(:command) { :get_overdue_milestones }
    end
  end

  describe '#get_milestone' do
    it_behaves_like 'an api request' do
      let(:command) { :get_milestone }
      let(:args) { [milestone['id']] }
    end
  end

  describe '#get_milestones_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :get_milestones_by_filter }
      let(:args) { [{ projectid: milestones_project['id'] }] }
    end
  end

  describe '#get_milestone_tasks' do
    it_behaves_like 'an api request' do
      let(:command) { :get_milestone_tasks }
      let(:args) { [milestone['id']] }
    end
  end

  describe '#get_milestones_by_month' do
    it_behaves_like 'an api request' do
      let(:command) { :get_milestones_by_month }
      let(:args) { [rand(2000..Time.now.year.to_i), rand(1..12)] }
    end
  end

  describe '#get_milestones_by_full_date' do
    it_behaves_like 'an api request' do
      let(:command) { :get_milestones_by_full_date }
      let(:args) { [rand(2000..Time.now.year.to_i), rand(1..12), rand(1..31)] }
    end
  end

  describe '#get_milestones_by_project_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_milestones_by_project_id }
      let(:args) { [milestones_project['id']] }
    end
  end

  describe '#get_milestones_by_project_id_and_status' do
    it_behaves_like 'an api request' do
      let(:command) { :get_milestones_by_project_id_and_status }
      let(:args) { [milestones_project['id'], milestone_status] }
    end
  end

  describe '#update_milestone' do
    it_behaves_like 'an api request' do
      let(:command) { :update_milestone }
      let(:args) { [milestone['id'], random_word, DateTime.commercial(2015).to_s] }
    end
  end

  describe '#update_milestone_status' do
    it_behaves_like 'an api request' do
      let(:command) { :update_milestone_status }
      let(:args) { [milestone['id'], PROJECT_MILESTONE_STATUSES.sample] }
    end
  end

  describe '#delete_milestone' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_milestone }
      let(:args) { [milestone['id']] }
    end
  end

  describe '#delete_milestones' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_milestones }
      let(:args) { [[milestone_to_delete['id']]] }
    end
  end
end
