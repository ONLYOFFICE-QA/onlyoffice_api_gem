# frozen_string_literal: true

require 'spec_helper'

describe '[Feed]' do
  let(:teamlab_module) { :feed }

  describe '#get_fresh_news_count' do
    it_should_behave_like 'an api request' do
      let(:command) { :new_feeds_count }
    end
  end
end
