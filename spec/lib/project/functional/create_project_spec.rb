# frozen_string_literal: true

require 'spec_helper'

describe '[Project][Functional] createproject' do
  let(:my_id) { api.people.get_self.body['response']['id'] }
  let(:milestone) { { 'title' => 'MyMileStone', responsible: my_id } }

  it 'createproject with milestone as array will create only one project' do
    pending('Bug 58990')
    project_id = api.project.create_project('MyProjectTitleAsArray',
                                            'MyProjectDescription',
                                            my_id,
                                            nil,
                                            false,
                                            milestones: [milestone])
                    .body['response']['id']
    expect(api.project.get_project(project_id)
              .body['response']['milestoneCount']).to eq(1)
  end

  it 'createproject with milestone without array will create only one project' do
    project_id = api.project.create_project('MyProjectTitleAsObject',
                                            'MyProjectDescription',
                                            my_id,
                                            nil,
                                            false,
                                            milestones: milestone)
                    .body['response']['id']
    expect(api.project.get_project(project_id)
              .body['response']['milestoneCount']).to eq(1)
  end
end
