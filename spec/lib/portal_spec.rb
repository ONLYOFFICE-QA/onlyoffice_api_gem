require_relative '../spec_helper'

describe '[Portals]' do
  let(:teamlab_module) { :portal }

  describe '#invite_user_url' do
    it_should_behave_like 'an api request' do
      let(:command) { :invite_user_url }
    end
  end

  describe '#invite_visitor_url' do
    it_should_behave_like 'an api request' do
      let(:command) { :invite_visitor_url }
    end
  end
end
