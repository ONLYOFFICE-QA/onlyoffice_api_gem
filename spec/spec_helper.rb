require 'rspec'
require_relative 'support/http_data'
require_relative '../lib/teamlab'

shared_examples_for 'an api request' do |*flags|
  before { pending } if flags.include?(:pending)
  before do
    @module = Teamlab.send(teamlab_module)
    puts "#{command}(#{args.join(', ')})"
    @response = args.empty? ? @module.send(command) : @module.send(command, *args)
    if add_data_to_collector
      DATA_COLLECTOR[data_param] ||= []
      response = [@response.body['response']].flatten
      response.each do |cur_response|
        DATA_COLLECTOR[data_param] << param_names.inject(cur_response) { |a, e| a[e] }
      end
    end
  end

  context 'Successful api request' do
    it 'returns Teamlab::Response object' do
      expect(@response).to be_instance_of(Teamlab::Response)
    end

    it 'returns Teamlab::Response object with successful parameter, set to true' do
      expect(@response.success).to be_truthy
    end

    it 'returns Teamlab::Response object with nil error parameter' do
      expect(@response.error).to be_nil
    end

    it 'returns Teamlab::Response object with hash body' do
      expect(@response.body).to be_instance_of(Hash)
    end
  end
end
