# frozen_string_literal: true

require 'spec_helper'

describe '[Mail] HelpCenter' do
  let(:teamlab_module) { :mail }

  describe '#get_html_of_help_center' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_html_of_help_center }
    end
  end
end
