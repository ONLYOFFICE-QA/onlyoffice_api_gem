# frozen_string_literal: true

require 'spec_helper'

describe '[Feed]' do
  let(:teamlab_module) { :feed }

  describe '#get_fresh_news_count' do
    it_behaves_like 'an api request' do
      let(:command) { :new_feeds_count }
    end
  end
end
