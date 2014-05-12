SERVER = ''
USERNAME = ''
PASSWORD = ''

DATA_COLLECTOR = {}

def args
  []
end

def random_word(length = 8)
  (0...length).map { ('a'..'z').to_a[rand(26)] }.join
end

def random_bool
  [true, false].sample
end

def random_email
  random_word + '@sharklasers.com'
end

def add_data_to_collector
  false
end

def random_id(param)
  DATA_COLLECTOR["#{param}_ids".to_sym].sample
end

def random_settings_entity_id
  SETTINGS_ENTITY_IDS.sample
end

def random_info_category(info_type)
  Teamlab.crm.get_all_categories(info_type).body['response'].sample
end

#region OPTIONS
#region People
USER_STATUSES = %w(Active Terminated LeaveOfAbsence Default All)
USER_CONTACTS = [
                { type: 'skype', value: random_word },
                { type: 'email', value: random_email }
                ]
USER_TYPES = %w(All User Visitor)
PATH_TO_IMAGE = 'http://ic.pics.livejournal.com/scryp/14761862/5478/5478_original.jpg'
#endregion

#regions Settings
SETTINGS_ENTITY_IDS = %w(1e044602-43b5-4d79-82f3-fd6208a11960 6743007c-6f95-4d20-8c88-a8601ce5e76d ea942538-e68e-4907-9394-035336ee0ba8
                         f4d98afd-d336-4332-8778-3c6945c81ea0 2a923037-8b2d-487b-9a22-5ac0918acf3f   bf88953e-3c43-4850-a3fb-b1e43ad53a3e 32d24cb5-7ece-4606-9c94-19216ba42086)
SETTINGS_TEST_USER = '27cd9da5-4f97-4335-ac45-55dd05d96d89'
SETTINGS_TALK_MODULE_ID = 'bf88953e-3c43-4850-a3fb-b1e43ad53a3e'
SETTINGS_VERSION = 2
SETTINGS_FOR_TALK = { enabled: true }
#endregion

#region Files
FILE_FOR_OPERATIONS_VERSION = 1
FILES_SHARE_TYPES = %w(None ReadWrite Read Restrict)
#endregion

#region Projects
PROJECT_STATUSES = %w(open paused closed)
PROJECT_MILESTONE_STATUSES = %w(open closed)
PROJECT_TASK_LINK_TYPES = %w(Start End EndStart)
PROJECT_SECURITY_RIGHTS = %w(None Messages Tasks Files Milestone Contacts)
PROJECT_TASKS_STATUSES = %w(open closed)
PROJECT_TASK_TIME_STATUSES = %w(NotChargeable NotBilled Billed )

BASECAMP_URL = "https://basecamp.com/2452154"
BASECAMP_LOGIN = ""
BASECAMP_PSW = ""
#endregion

#region CRM
BID_TYPES = %w(FixedBid PerHour PerDay PerWeek PerMonth PerYear)
COLORS_NAMES = %w(red yellow black white green purple brown grey blue)
INVOICE_STATUSES = %w(Draft Sent Rejected Paid Overdue Archived)
CONTACT_INFO_TYPES = %w(Phone Email Website Skype Twitter LinkedIn Facebook LiveJournal MySpace GMail Blogger Yahoo MSN ICQ Jabber AIM)
ENTITY_TYPES = %w(opportunity company contact)
USER_FIELDS = %w(TextField TextArea SelectBox CheckBox Heading Date)
IMAGE_URL = 'http://thebooksmugglers.com/wp-content/uploads/2009/02/image002-200x300.jpg'#'http://www.soulscode.com/wp-content/uploads/2011/02/doll-200x300.jpg'
#endregion

#region Community
SOME_URL = 'www.teamlab.info'
EVENT_TYPES = %w(None News Order Advert AllNews Poll All)
#endregion

#region Calendar
TIME_ZONES = %w(UTC)
CALENDAR_TO_UPLOAD = 'path_to_file.ics'
#endregion
#endregion