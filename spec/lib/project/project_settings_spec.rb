# frozen_string_literal: true

require 'spec_helper'

describe '[Project] Projects' do
  let(:teamlab_module) { :project }

  describe '#projects_settings' do
    it_behaves_like 'an api request' do
      let(:command) { :projects_settings }
    end
  end

  describe '#update_projects_settings' do
    it_behaves_like 'an api request' do
      let(:command) { :update_projects_settings }
      let(:args) { [everebodyCanCreate: false] }
    end
  end
end
