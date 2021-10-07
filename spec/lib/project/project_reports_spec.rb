# frozen_string_literal: true

require 'spec_helper'

report_template = api.project.create_report_template(random_word).data

describe '[Project] Projects' do
  let(:teamlab_module) { :project }

  describe '#create_report_template' do
    it_behaves_like 'an api request' do
      let(:command) { :create_report_template }
      let(:args) { [random_word] }
    end
  end

  describe '#report_template' do
    it_behaves_like 'an api request' do
      let(:command) { :report_template }
      let(:args) { [report_template['id']] }
    end
  end

  describe '#update_report_template' do
    it_behaves_like 'an api request' do
      let(:command) { :update_report_template }
      let(:args) { [report_template['id'], random_word] }
    end
  end

  describe '#delete_report_template' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_report_template }
      let(:args) { [report_template['id']] }
    end
  end
end
