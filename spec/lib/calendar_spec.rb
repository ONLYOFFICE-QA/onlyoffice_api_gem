# frozen_string_literal: true

require 'spec_helper'

describe '[Calendar]' do
  let(:teamlab_module) { :calendar }

  describe '#create_calendar' do
    it_behaves_like 'an api request' do
      let(:command) { :create_calendar }
      let(:args) { [random_word, TIME_ZONES.sample] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :calendar_ids }
      let(:param_names) { %w[objectId] }
    end
  end

  describe '#get_icalc_link' do
    it_behaves_like 'an api request' do
      let(:command) { :get_icalc_link }
      i = -1
      let(:args) { [@data_collector[:calendar_ids][i += 1]] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :ical_link_ids }
      let(:param_names) { %w[] }
    end
  end

  describe '#create_calendar_by_ical_link' do
    it_behaves_like 'an api request' do
      let(:command) { :create_calendar_by_ical_link }
      let(:args) { [CALENDAR_WEB_URL, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :calendar_ids }
      let(:param_names) { %w[objectId] }
    end
  end

  describe '#add_event' do
    it_behaves_like 'an api request' do
      let(:command) { :add_event }
      i = -1
      let(:args) { [@data_collector[:calendar_ids][i += 1], random_word, { description: random_word, startDate: DateTime.now, endDate: DateTime.now, repeatType: '', alertType: '-1', isAllDayLong: false }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :calendar_event_ids }
      let(:param_names) { %w[objectId] }
    end
  end

  describe '#add_icsevent' do
    it_behaves_like 'an api request' do
      let(:command) { :add_icsevent }
      i = -1
      let(:args) { [@data_collector[:calendar_ids][i += 1], File.read(EVENT_ICS), { repeatType: '', alertType: '-1' }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :calendar_event_uids }
      let(:param_names) { %w[uniqueId] }
    end
  end

  describe '#get_event_history_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_event_history_by_id }
      i = -1
      let(:args) { [@data_collector[:calendar_event_ids][i += 1]] }
    end
  end

  describe '#get_event_history_by_uid' do
    it_behaves_like 'an api request' do
      let(:command) { :get_event_history_by_uid }
      i = -1
      let(:args) { [@data_collector[:calendar_event_uids][i += 1]] }
    end
  end

  describe '#get_default_access' do
    it_behaves_like 'an api request' do
      let(:command) { :get_default_access }
    end
  end

  describe '#get_calendar' do
    it_behaves_like 'an api request' do
      let(:command) { :get_calendar }
      let(:args) { [random_id(:calendar)] }
    end
  end

  describe '#get_subscription_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_subscription_list }
    end
  end

  describe '#get_access_parameters' do
    it_behaves_like 'an api request' do
      let(:command) { :get_access_parameters }
      let(:args) { [random_id(:calendar)] }
    end
  end

  describe '#get_icalc_feed' do
    it_behaves_like 'an api request' do
      let(:command) { :get_icalc_feed }
      i = -1
      let(:args) { [@data_collector[:calendar_ids][i += 1], @data_collector[:ical_link_ids][i].split('/').last] }
    end
  end

  describe '#get_calendar_events' do
    it_behaves_like 'an api request' do
      let(:command) { :get_calendar_events }
      let(:args) { [DateTime.new(2014).strftime('%Y-%m-%dT%H-%M-%S.%LZ').to_s, DateTime.now.strftime('%Y-%m-%dT%H-%M-%S.%LZ').to_s] }
    end
  end

  describe '#get_calendars_and_subscriptions' do
    it_behaves_like 'an api request' do
      let(:command) { :get_calendars_and_subscriptions }
      let(:args) { [DateTime.new(2014).strftime('%Y-%m-%dT%H-%M-%S.%LZ').to_s, DateTime.now.strftime('%Y-%m-%dT%H-%M-%S.%LZ').to_s] }
    end
  end

  describe '#import_ical' do
    it_behaves_like 'an api request' do
      let(:command) { :import_ical }
      let(:args) { [random_id(:calendar), CALENDAR_TO_UPLOAD] }
    end
  end

  describe '#import_events' do
    it_behaves_like 'an api request' do
      let(:command) { :import_events }
      let(:args) { [random_id(:calendar), EVENT_ICS] }
    end
  end

  describe '#update_calendar' do
    it_behaves_like 'an api request' do
      let(:command) { :update_calendar }
      let(:args) { [random_id(:calendar), random_word, TIME_ZONES.sample] }
    end
  end

  describe '#update_calendar_user_view' do
    it_behaves_like 'an api request' do
      let(:command) { :update_calendar_user_view }
      let(:args) { [random_id(:calendar), random_word, TIME_ZONES.sample, { textColor: 'red', backgroundColor: 'blue' }] }
    end
  end

  describe '#manage_subscriptions' do
    it_behaves_like 'an api request' do
      let(:command) { :manage_subscriptions }
      let(:args) { [[random_word]] }
    end
  end

  describe '#update_event' do
    it_behaves_like 'an api request' do
      let(:command) { :update_event }
      i = -1
      let(:args) { [@data_collector[:calendar_ids][i += 1], @data_collector[:calendar_event_ids][i], random_word, { description: random_word, startDate: DateTime.now, endDate: DateTime.now, repeatType: '', alertType: '-1', isAllDayLong: false }] }
    end
  end

  describe '#update_icsevent' do
    it_behaves_like 'an api request' do
      let(:command) { :update_icsevent }
      i = -1
      let(:args) { [@data_collector[:calendar_ids][i += 1], @data_collector[:calendar_event_ids][i], File.read(EVENT_ICS)] }
    end
  end

  describe '#unsubscribe_from_event' do
    it_behaves_like 'an api request', :pending do
      pending('Probably https://bugzilla.onlyoffice.com/show_bug.cgi?id=57087')
      let(:command) { :unsubscribe_from_event }
      let(:args) { [@data_collector[:calendar_event_ids][-1]] }
    end
  end

  describe '#delete_event' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_event }
      let(:args) { [@data_collector[:calendar_event_ids].pop] }
    end
  end

  describe '#delete_event_series' do
    before do
      event = api.calendar.add_event(@data_collector[:calendar_ids].last, random_word, description: random_word, startDate: DateTime.now, endDate: DateTime.now, repeatType: '', alertType: '-1', isAllDayLong: false)
      @data_collector[:calendar_event_ids] << event.data.first['objectId']
    end

    it_behaves_like 'an api request' do
      let(:command) { :delete_event_series }
      let(:args) { [@data_collector[:calendar_event_ids].pop] }
    end
  end

  describe '#delete_calendar' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_calendar }
      let(:args) { [@data_collector[:calendar_ids].pop] }
    end
  end
end
