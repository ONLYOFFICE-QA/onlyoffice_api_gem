# frozen_string_literal: true

require 'spec_helper'

describe '[Project] Projects' do
  let(:teamlab_module) { :project }

  describe '#projects_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :projects_settings }
    end
  end
end
