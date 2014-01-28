require_relative '../spec_helper'

describe Teamlab do

  before do
    Teamlab.configure do |config|
      config.server = SERVER
      config.username = USERNAME
      config.password = PASSWORD
    end
  end

  shared_examples_for 'an api request' do
    before do
      @module = Teamlab.send(teamlab_module)
      @response = options.nil? ? @module.send(command) : @module.send(command, options)
    end

    context 'Successful api request' do

      it 'returns Teamlab::Response object' do
        @response.should be_instance_of(Teamlab::Response)
      end

      it 'returns Teamlab::Response object with successful parameter, set to true' do
        @response.success.should be_true
      end

      it 'returns Teamlab::Response object with nil error parameter' do
        @response.error.should be_nil
      end

      it 'returns Teamlab::response object with hash body' do
        @response.body.should be_instance_of(Hash)
      end
    end
  end

  describe '[People]' do
    let(:teamlab_module) { :people }

    describe '#get_people' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_people }
      end
    end

    describe '#get_self' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_self }
      end
    end
  end
end