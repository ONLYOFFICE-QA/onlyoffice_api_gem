SERVER = 'https://nctautotest-594591526-community-blogs-spec.teamlab.info'.freeze
USERNAME = 'teamlab.ruby@gmail.com'.freeze
PASSWORD = '123456'.freeze

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
  data_name = "#{param}_ids".to_sym
  raise "No data for `#{data_name}` is found in DATA_COLLECTOR" unless DATA_COLLECTOR.key?(data_name)
  raise "Data DATA_COLLECTOR['#{param}'] is empty!" if DATA_COLLECTOR[data_name].empty?

  DATA_COLLECTOR[data_name].sample
end

def random_settings_entity_id
  SETTINGS_ENTITY_IDS.sample
end

def random_info_category(info_type)
  Teamlab.crm.get_all_categories(info_type).body['response'].sample
end

# region OPTIONS
# region People
USER_STATUSES = %w[Active Terminated LeaveOfAbsence Default All].freeze
USER_CONTACTS = [
  { type: 'skype', value: random_word },
  { type: 'email', value: random_email }
]
USER_TYPES = %w[All User Visitor].freeze
PATH_TO_IMAGE = 'http://ic.pics.livejournal.com/scryp/14761862/5478/5478_original.jpg'.freeze
USER_THIRD_PARTIES_PROVIDERS = %w[google facebook twitter linkedin].freeze
USER_THIRD_PARTIES_PROFILES = %w[_Y6rPoq7louElDtnlBdKUqpqz4j5vps35UYBvFloIL3dI-h2b3jlTMyp0au58Atr9HwZYFP6QyOz_ENBvc51NREfFs4vPPDDMfW3xh-wVHfDKjRwQvUVl6I_cpfV_VbFitRvGUktkOW29Ewln_KY7JQQram7uozMK8ouBVPssuyOzOUc8byOtQpfVsXY8aRvfJDLKpwNmzwuiwHkYEN6Tqm2KcxkQvo-ADDEoEDwkyzBXrhaW6kRKGNRiPMg3XofIlJCani43p8XoCjk2JvYM8iLVARbT1QXUW5FWZkoZ3udlM3qQWQcWkExjmVgUnPfdxDCRU4fq2q6QFBC-NHpFF3KDJtRF7cYMGGTnTqM_4zv460kDCFcgrfHPWc7kvdd0
                                 daINQQMQndCSeUMQ-1f1wCGoSuDAK33X8c95AiT3Pe610W4u9m02V_dx_Z4itELYlh5xLA6qDLE2RCiU_hWM6CJqVcja5hvWvRbbWUH-ouq3miQEnj9RzGs2EAq4XiqeoBSWNEYfrdsFvyxVIRIuy1Jex0xFVe6d9cxEBUG-8DiJy08bEW5MXnuhm2mgTG0D4aHRd0iKNXfe1ZHWXSFETGJYwotdXkyVQCkiETIytuifRxxIak7SecRleDy-eB4Cq-nY6DFLpU0QoN0kkcAZH_pMNDiFckn4LFASl9PGaWfpIyHIVKJovqB_ChakGlXS0
                                 6RE5NMhq-NyjwE7XQerUURcK_JycrRUBpgUBG1Ac7mShbkcprqSPAoFuZXeEuVrbopbT2NtwVAxqlkT-2zC4wnP88y_3pmDqxbC_btGLzjltJKFy8_apcSEHX5cYqGvB0CkWIy15Tp7Yz1nHLopBHXccBOfmP4OyN88H2N1BAfQW5Sz5iLw-deVVEKc1NTyD0
                                 AgWQakKDSFqlYFG0e96-0uwdwgCGf97R6NgEiLwh3dNjDZmm_7HQxAw0zzKNn3JvNkdRzs-n2kglXapJgYyhw2ADcDH_4LnCb8yM7ltgC8E1].freeze
# endregion

# regions Settings
SETTINGS_ENTITY_IDS = ['1e044602-43b5-4d79-82f3-fd6208a11960',
                       '6743007c-6f95-4d20-8c88-a8601ce5e76d',
                       'ea942538-e68e-4907-9394-035336ee0ba8',
                       'ea942538-e68e-4907-9394-035336ee0ba8',
                       'f4d98afd-d336-4332-8778-3c6945c81ea0',
                       '2a923037-8b2d-487b-9a22-5ac0918acf3f',
                       'bf88953e-3c43-4850-a3fb-b1e43ad53a3e',
                       '32d24cb5-7ece-4606-9c94-19216ba42086',
                       Teamlab::Settings::GLOBAL_ADMIN_ID]

SETTINGS_TEST_USER = '27cd9da5-4f97-4335-ac45-55dd05d96d89'.freeze
SETTINGS_TALK_MODULE_ID = 'bf88953e-3c43-4850-a3fb-b1e43ad53a3e'.freeze
SETTINGS_VERSION = 2
SETTINGS_FOR_TALK = { enabled: true }.freeze
SETTINGS_TIMEZONE = 'Central Brazilian Standard Time'.freeze
SETTINGS_PORTAL_DEFAULT_PAGE_MODULE_CHOICE = '00000000-0000-0000-0000-000000000000'.freeze
# endregion

# region Files
FILE_FOR_OPERATIONS_VERSION = 1
FILES_SHARE_TYPES = %w[None ReadWrite Read Restrict].freeze
FILE_FOR_UPLOAD = "#{File.dirname(__FILE__)}/../../spec/lib/data/docx_file.docx".freeze
# endregion

# region Projects
PROJECT_STATUSES = %w[open paused closed].freeze
PROJECT_MILESTONE_STATUSES = %w[open closed].freeze
PROJECT_TASK_LINK_TYPES = %w[Start End EndStart].freeze
PROJECT_SECURITY_RIGHTS = %w[None Messages Tasks Files Milestone Contacts].freeze
PROJECT_TASKS_STATUSES = %w[open closed].freeze
PROJECT_TASK_TIME_STATUSES = %w[NotChargeable NotBilled Billed].freeze
PROJECT_DISCUSSION_STATUSES = %w[Open Archived].freeze

BASECAMP_URL = 'https://basecamp.com/2452154'.freeze
BASECAMP_LOGIN = ''.freeze
BASECAMP_PSW = ''.freeze
# endregion

# region CRM
BID_TYPES = %w[FixedBid PerHour PerDay PerWeek PerMonth PerYear].freeze
COLORS_NAMES = %w[red yellow black white green purple brown grey blue].freeze
INVOICE_STATUSES = %w[Draft Sent Rejected Paid Overdue Archived].freeze
CONTACT_INFO_TYPES = %w[Phone Email Website Skype Twitter LinkedIn Facebook LiveJournal MySpace GMail Blogger Yahoo MSN ICQ Jabber AIM].freeze
ENTITY_TYPES = %w[opportunity company contact].freeze
USER_FIELDS = %w[TextField TextArea SelectBox CheckBox Heading Date].freeze
IMAGE_URL = 'http://thebooksmugglers.com/wp-content/uploads/2009/02/image002-200x300.jpg'.freeze # 'http://www.soulscode.com/wp-content/uploads/2011/02/doll-200x300.jpg'
DUE_DATE = '2020-04-10T08:00:00.0000000+03:00'.freeze
LANGUAGE = %w[az-Latn-AZ cs-CZ de-DE el-GR en-GB en-US es-ES fi-FI fr-FR it-IT ja-JP ko-KR lv-LV pl-PL pt-BR pt-PT ru-RU sl-SI tr-TR uk-UA vi-VN zh-CN].freeze
CURRENCY = %w[AUD CAD CHF EUR GBP JPY USD AMD ARS AZN BDT BGN BRL BYR CLP CNY COP CRC CUP CZK DKK DOP DZD GEL HKD HRK HUF IDR ILS INR KRW KWD KZT LTL LVL MAD MDL MGA MUR MXN MYR NGN NOK NZD PHP PKR PLN RUB SAR SEK SGD THB TRY TTD UAH UZS VEF VND XAF XOF ZAR].freeze
# endregion

# region Community
SOME_URL = 'www.teamlab.info'.freeze
EVENT_TYPES = %w[None News Order Advert AllNews Poll All].freeze
# endregion

# region Calendar
TIME_ZONES = %w[UTC].freeze
CALENDAR_TO_UPLOAD = File.expand_path('../lib/data/basic.ics', __dir__)
EVENT_ICS = File.expand_path('../lib/data/event.ics', __dir__)
CALENDAR_WEB_URL = 'https://raw.githubusercontent.com/ONLYOFFICE/onlyoffice_api_gem/master/spec/lib/data/basic.ics'.freeze
# endregion
# endregion
