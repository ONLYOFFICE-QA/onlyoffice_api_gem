require_relative '../spec_helper'

describe Teamlab do

  before :all do
    Teamlab.configure do |config|
      config.server = SERVER
      config.username = USERNAME
      config.password = PASSWORD
    end
  end

  describe 'Preparing enviroment' do
    describe '#add_user' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :people }
        let(:command) { :add_user }
        let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :user_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#get_self' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :people }
        let(:command) { :get_self }
        let(:add_data_to_collector) { true }
        let(:data_param) { :self_username }
        let(:param_names) { %w(userName) }
      end
    end

    describe '#get_my_files' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :files }
        let(:command) { :get_my_files }
        let(:add_data_to_collector) { true }
        let(:data_param) { :my_documents_ids }
        let(:param_names) { %w(current id) }
      end
    end

    describe '#create_file' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :files }
        let(:command) { :create_file }
        let(:args) { [random_id(:my_documents), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :file_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#create_person' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :crm }
        let(:command) { :create_person }
        let(:args) { [random_word.capitalize, random_word.capitalize] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :contact_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#create_project' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :project }
        let(:command) { :create_project }
        let(:args) { [random_word, random_word, random_id(:user), random_word(3), random_bool] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :project_ids }
        let(:param_names) { %w(id) }
      end
    end
  end



  describe '[Community]' do

    let(:teamlab_module) { :community }

    describe '#create_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_post }
        let(:args) { [random_word, random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :community_post_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_post }
        let(:args) { [random_id(:community_post), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :community_post_comment_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_bookmark' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_bookmark }
        let(:args) { [SOME_URL, random_word, {tags: [random_word(4), random_word(4), random_word(4)].join(', ')}] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :bookmark_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_comment_to_bookmark' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_comment_to_bookmark }
        let(:args) { [random_id(:bookmark), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :bookmark_comment_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#create_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_event }
        let(:args) { [random_word, random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :event_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#create_poll' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_event }
        let(:args) { [random_word, random_word, {type: 'Poll'}] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :poll_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_thread_to_category' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24054'
        let(:command) { :add_thread_to_category }
        let(:args) { [-1, random_word, random_word, random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :thread_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_topic_to_thread' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24054'
        let(:command) { :add_topic_to_thread }
        let(:args) { [random_id(:thread), random_word, random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :thread_topic_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_post_to_topic' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24054'
        let(:command) { :add_post_to_topic }
        let(:args) { [DATA_COLLECTOR[:thread_topic_ids].last, random_word, random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :topic_post_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#create_page' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_page }
        let(:args) { [random_word, random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :wiki_page_name_ids }
        let(:param_names) { %w(name) }
      end
    end

    describe '#create_wiki_page_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_wiki_page_comment }
        let(:args) { [random_id(:wiki_page_name), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :wiki_page_comment_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#upload_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :upload_files }
        let(:args) { [random_id(:wiki_pages_name), FILES_TO_UPLOAD] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :wiki_page_file_name_ids }
        let(:param_names) { %w(name) }
      end
    end

    describe '#update_post' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_post }
        let(:args) { [random_id(:community_post), random_word, random_word, {tags: [random_word(4), random_word(4), random_word(4)].join(',')}] }
      end
    end

    describe '#get_all_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_posts }
      end
    end

    describe '#get_blog_tags' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_blog_tags }
      end
    end

    describe '#get_my_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_posts }
      end
    end

    describe '#get_post_by_id' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_post }
        let(:args) { [random_id(:community_post)] }
      end
    end

    describe '#get_posts_by_tag' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_posts_by_tag }
        let(:args) { [random_word(4)] }
      end
    end

    describe '#search_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_posts }
        let(:args) { [random_word] }
      end
    end

    describe '#get_user_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_user_posts }
        let(:args) { [DATA_COLLECTOR[:self_username].sample] }
      end
    end

    describe '#get_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_comments }
        let(:args) { [random_id(:community_post)] }
      end
    end

    describe '#get_all_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_bookmarks }
      end
    end

    describe '#get_all_bookmark_tags' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_bookmark_tags }
      end
    end

    describe '#get_bookmark' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_bookmark }
        let(:args) { [random_id(:bookmark)] }
      end
    end

    describe '#get_bookmarks_added_by_me' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_bookmarks_added_by_me }
      end
    end

    describe '#get_my_favourite_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_favourite_bookmarks }
      end
    end

    describe '#get_top_of_day_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_top_of_day_bookmarks }
      end
    end

    describe '#get_top_of_week_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_top_of_week_bookmarks }
      end
    end

    describe '#get_top_of_month_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_top_of_month_bookmarks }
      end
    end

    describe '#get_top_of_year_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_top_of_year_bookmarks }
      end
    end

    describe '#get_bookmarks_by_tag' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_bookmarks_by_tag }
        let(:args) { [random_word(4)] }
      end
    end

    describe '#get_recently_added_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_recently_added_bookmarks }
      end
    end

    describe '#get_bookmark_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_bookmark_comments }
        let(:args) { [random_id(:bookmark)] }
      end
    end

    describe '#search_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_bookmarks }
        let(:args) { [random_word] }
      end
    end

    describe '#update_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_event }
        let(:args) { [random_id(:event), random_word, random_word] }
      end
    end

    describe '#get_all_events' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_events }
      end
    end

    describe '#get_my_events' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_events }
      end
    end

    describe '#get_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_event }
        let(:args) { [random_id(:event)] }
      end
    end

    describe '#search_events' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_events }
        let(:args) { [random_word] }
      end
    end

    describe '#vote_for_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :vote_for_event }
        let(:args) { [random_id(:poll), rand(2)] }
      end
    end

    describe '#add_comment_to_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_comment_to_event }
        let(:args) { [random_id(:event), random_word] }
      end
    end

    describe '#get_forums' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_forums }
      end
    end

    describe '#get_thread_topics' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24054'
        let(:command) { :get_thread_topics }
        let(:args) { [random_id(:thread)] }
      end
    end

    describe '#get_last_updated_topics' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_last_updated_topics }
      end
    end

    describe '#get_posts' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24054'
        let(:command) { :get_posts }
        let(:args) { [random_id(:thread_topic)] }
      end
    end

    describe '#search_topics' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_topics }
        let(:args) { [random_word(5)] }
      end
    end

    describe '#update_topic_in_thread' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24054'
        let(:command) { :update_topic_in_thread }
        let(:args) { [random_id(:thread_topic), random_word, random_word] }
      end
    end

    describe '#update_post_in_topic' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24054'
        let(:command) { :update_post_in_topic }
        let(:args) { [DATA_COLLECTOR[:thread_topic_ids].last, random_id(:topic_post)] }
      end
    end

    describe '#get_wiki_pages' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_wiki_pages }
      end
    end

    describe '#get_wiki_page' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_wiki_page }
        let(:args) { [random_id(:wiki_page_name)] }
      end
    end

    describe '#get_wiki_file_info' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_wiki_file_info }
        let(:args) { [random_id(:wiki_page_file_name)] }
      end
    end

    describe '#get_page_history' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_page_history }
        let(:args) { [random_id(:wiki_page_name)] }
      end
    end

    describe '#get_all_page_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_page_comments }
        let(:args) { [random_id(:wiki_page_name)] }
      end
    end

    describe '#search_wiki_pages_by_name' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_wiki_pages_by_name }
        let(:args) { [random_word] }
      end
    end

    describe '#search_wiki_pages_by_content' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_wiki_pages_by_content }
        let(:args) { [random_word] }
      end
    end

    describe '#update_wiki_page' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_wiki_page }
        let(:args) { [random_id(:wiki_page_name), random_word] }
      end
    end

    describe '#update_wiki_page_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_wiki_page_comment }
        let(:args) { [random_id(:wiki_page_comment), random_word] }
      end
    end

    describe '#delete_post' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_post }
        let(:args) { [DATA_COLLECTOR[:community_post_ids].pop] }
      end
    end

    describe '#delete_post_in_topic' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24054'
        let(:command) { :delete_post_in_topic }
        let(:args) { [DATA_COLLECTOR[:thread_topic_ids].last, DATA_COLLECTOR[:topic_post_ids].pop] }
      end
    end

    describe '#delete_wiki_page_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_wiki_page_comment }
        let(:args) { [DATA_COLLECTOR[:wiki_page_comment_ids].pop] }
      end
    end

    describe '#delete_wiki_file' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_wiki_file }
        let(:args) { [DATA_COLLECTOR[:wiki_page_file_name_ids].pop] }
      end
    end

    describe '#delete_wiki_page' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_wiki_page }
        let(:args) { [DATA_COLLECTOR[:wiki_page_name_ids].pop] }
      end
    end
  end

  describe '[Calendar]' do

    let(:teamlab_module) { :calendar }

    describe '#create_calendar' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_calendar }
        let(:args) { [random_word, TIME_ZONES.sample] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :calendar_ids }
        let(:param_names) { %w(objectId) }
      end
    end

    describe '#get_icalc_link' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_icalc_link }
        i = -1
        let(:args) { [DATA_COLLECTOR[:calendar_ids][i += 1]] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :ical_link_ids }
        let(:param_names) { %w() }
      end
    end

    describe '#create_calendar_by_ical_link' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_calendar_by_ical_link }
        let(:args) { [random_id(:ical_link)] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :calendar_ids }
        let(:param_names) { %w(objectId) }
      end
    end

    describe '#add_event' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24071'
        let(:command) { :add_event }
        i = -1
        let(:args) { [DATA_COLLECTOR[:calendar_ids][i += 1], random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :event_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#get_default_access' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_default_access }
      end
    end

    describe '#get_calendar' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_calendar }
        let(:args) { [random_id(:calendar)] }
      end
    end

    describe '#get_subscription_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_subscription_list }
      end
    end

    describe '#get_access_parameters' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_access_parameters }
        let(:args) { [random_id(:calendar)] }
      end
    end

    describe '#get_icalc_feed' do
      it_should_behave_like 'an api request' do
        pending 'Выкачивает .ics файл. Response в IDE выглядит извращенно'
        let(:command) { :get_icalc_feed }
        i = -1
        let(:args) { [DATA_COLLECTOR[:calendar_ids][i += 1], DATA_COLLECTOR[:ical_link_ids][i].split('/').last] }
      end
    end

    describe '#get_calendar_events' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24069'
        let(:command) { :get_calendar_events }
        let(:args) { [DateTime.commercial(2014).to_s, DateTime.commercial(2015).to_s] }
      end
    end

    describe '#get_calendars_and_subscriptions' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24069'
        let(:command) { :get_calendars_and_subscriptions }
        let(:args) { [DateTime.commercial(2014).to_s, DateTime.commercial(2015).to_s] }
      end
    end

    describe '#create_calendar_by_ical_link' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_calendar_by_ical_link }         #ХЗ ГДЕ ВЗЯТЬ ЛИНКУ
        let(:args) { [random_id(:ical_link), random_word] }
      end
    end

    describe '#import_ical' do
      it_should_behave_like 'an api request' do
        let(:command) { :import_ical }
        let(:args) { [random_id(:calendar), CALENDAR_TO_UPLOAD] }
      end
    end

    describe '#update_calendar' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_calendar }
        let(:args) { [random_id(:calendar), random_word, TIME_ZONES.sample] }
      end
    end

    describe '#update_calendar_user_view' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_calendar_user_view }
        let(:args) { [random_id(:calendar), random_word, TIME_ZONES.sample] }
      end
    end

    describe '#manage_subscriptions' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24072'
        let(:command) { :manage_subscriptions }
        let(:args) { [[random_word]] }
      end
    end

    describe '#update_event' do
      it_should_behave_like 'an api request' do
        pending 'http://bugzserver/show_bug.cgi?id=24071'
        let(:command) { :update_event }
        i = -1
        let(:args) { [DATA_COLLECTOR[:calendar_ids][i += 1], DATA_COLLECTOR[:event_ids][i], random_word] }
      end
    end

    describe '#unsubscribe_from_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :unsubscribe_from_event }
        let(:args) { [random_id(:event)] }
      end
    end

    describe '#remove_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_event }
        let(:args) { [random_id(:event)] }
      end
    end

    describe '#delete_event_series' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_event_series }
        let(:args) { [DATA_COLLECTOR[:event_ids].pop] }
      end
    end

    describe '#delete_calendar' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_calendar }
        let(:args) { [DATA_COLLECTOR[:calendar_ids].pop] }
      end
    end
  end

  describe '[Mail]' do

    let(:teamlab_module) { :mail }

    describe '#create_tag' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_tag }
        let(:args) { [random_word(4), {style: rand(15)}] }
      end
    end

    describe '#create_account_by_email' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_account_by_email }
        let(:args) { [USERNAME, PASSWORD] }
      end
    end





########################################################################################################################
############################################# END CREATING #############################################################
########################################################################################################################

    describe '#get_filtered_messages' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_filtered_messages }
        let(:args) { [2] }
      end
    end

    describe '#get_message' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_message }
        let(:args) {message_id}
      end
    end

    describe '#get_message_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_message_template }
      end
    end

    describe '#get_account_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_account_list }
      end
    end

    describe '#get_tag_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_tag_list }
      end
    end



########################################################################################################################
############################################### DELETING ###############################################################
########################################################################################################################
  end

  describe 'Cleaning enviroment' do

    describe '#delete_file' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :files }
        let(:command) { :delete_file }
        let(:args) { [DATA_COLLECTOR[:file_ids].pop] }
      end
    end

    describe '#delete_contact' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :crm }
        let(:command) { :delete_contact }
        let(:args) { [DATA_COLLECTOR[:contact_ids].pop] }
      end
    end

    describe '#delete_project' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :project }
        let(:command) { :delete_project }
        let(:args) { [DATA_COLLECTOR[:project_ids].pop] }
      end
    end
  end
end