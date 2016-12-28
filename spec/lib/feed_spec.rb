require 'spec_helper'

describe '[Feed]' do
  let(:teamlab_module) { :feed }

  before :all do
    Teamlab.configure do |config|
      config.server = SERVER
      config.username = USERNAME
      config.password = PASSWORD
    end
  end

  describe '#get_fresh_news_count' do
    it_should_behave_like 'an api request' do
      let(:command) { :new_feeds_count }
    end
  end
end
