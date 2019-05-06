require 'spec_helper'

describe '[Project] Projects' do
  let(:teamlab_module) { :project }

  describe '#create_report_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_report_template }
      let(:args) { [random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :report_template_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#update_report_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_report_template }
      let(:args) { [random_id(:report_template), random_word] }
    end
  end

  describe '#delete_report_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_report_template }
      let(:args) { [DATA_COLLECTOR[:report_template_ids].pop] }
    end
  end
end
