require 'spec_helper'

describe '[Project] Team' do
  let(:teamlab_module) { :project }

  describe '#create_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_template }
      let(:args) { [random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_template_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_templates' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_templates }
    end
  end

  describe '#get_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_template }
      let(:args) { [random_id(:project_template)] }
    end
  end

  describe '#update_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_template }
      let(:args) { [random_id(:project_template), random_word] }
    end
  end

  describe '#delete_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_template }
      let(:args) { [DATA_COLLECTOR[:project_template_ids].pop] }
    end
  end
end
