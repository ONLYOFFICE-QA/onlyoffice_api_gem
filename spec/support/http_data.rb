SERVER = 'https://autotestdoc.teamlab.com'
#SERVER = 'https://autotestdoc.teamlab.info'
USERNAME = 'shockwavenn@gmail.com'
PASSWORD = '123456'

def args
  []
end

def random_word(length, capitalize = false)
  capitalize ? (0...length).map { ('a'..'z').to_a[rand(26)] }.join.capitalize : (0...length).map { ('a'..'z').to_a[rand(26)] }.join
end

def random_email
  random_word(7) + '@sharklasers.com'
end

#region OPTIONS
#region People
SEARCH_USER_NAME = 'Allison'
USER_FILTER = { activationStatus: 1 }
USER_ID = 'ed15b5d0-4e7d-478a-9a11-45640378a8f8'#'e83cceef-2cbf-4cdf-9a4c-fea4e810705b'
USER_STATUS = 'Active'
SEARCH_QUERY = 'Doria'
USER_EMAIL = 'shockwavenn@gmail.com'
IS_VISITOR = false
NEW_USER_FIRSTNAME = random_word(7, true)
NEW_USER_LASTNAME = random_word(7, true)
USER_CONTACTS = [
                { 'type' => 'skype', 'value' => 'mondovoshka' },
                { 'type' => 'email', 'value' => 'mondovoshka@mail.ru' }
                ]
FEW_USER_IDS = ['37f5ce64-9db1-4df9-8b93-436e39721b4d', '6d5c7d2f-b81e-4afb-b5d6-cd6ef2426e35']
USERS_TO_DELETE = ['864663e3-6135-4252-a11c-e507f96e59a9']
USER_TYPE = 'User'
PATH_TO_IMAGE = 'http://ic.pics.livejournal.com/scryp/14761862/5478/5478_original.jpg'
#endregion

#region Group
GROUP_ID = '06a9bf1b-3354-4347-805c-934265b62773'
GROUP_NAME = random_word(7)
GROUP_ID_FOR_OPERATIONS = 'd868c0fb-d669-495f-aa00-1279395285ea'
GROUP_UPDATE_OPTIONS = { groupManager: USER_ID, groupName: GROUP_NAME, members: FEW_USER_IDS }
GROUP_ID_TO_DELETE = '97b92796-79b1-4688-869e-1d09487d91d8'
#endregion

#regions Settings
SETTINGS_ENTITY_IDS = ['ea942538-e68e-4907-9394-035336ee0ba8', '28b10049-dd20-4f54-b986-873bc14ccfc7']
SETTINGS_TEST_USER = '27cd9da5-4f97-4335-ac45-55dd05d96d89'
SETTINGS_TALK_MODULE_ID = 'bf88953e-3c43-4850-a3fb-b1e43ad53a3e'
SETTINGS_VERSION = 2
SETTINGS_FOR_TALK = { enabled: true }
#endregion

#region Files
FOLDER_COMMON_DOCS_ID = '225508'
FOLDER_TITLE = random_word(10)
FOLDER_FOR_OPERATIONS_ID = '1553123'
FILE_FOR_OPERATIONS_ID = '3434235'
FILE_FOR_OPERATIONS_VERSION = 1
FILES_SHARE_TYPE = 'Read'
FILE_TO_UPLOAD = '/home/zagudaev-2/Documents/txt_files.txt'
FILE_MORE_THAN_5_MB = '/mnt/data_share/Files/PDF/AllPDF/600 Essential Words for the TOEIC Test.pdf'
FILE_SIZE_IN_BYTES = 107374182.4
NEW_FILE_NAME = random_word(8)
NEW_FILE_CONTENT = random_word(40)
THIRD_PARTY_SERVICE = 'Box.com'
THIRD_PARTY_LOGIN = 'teamlab.ruby@gmail.com'
THIRD_PARTY_PASSWORD = '123456'
THIRD_PARTY_LOGIN_DATA = {login: THIRD_PARTY_LOGIN, password: THIRD_PARTY_PASSWORD}
THIRD_PARTY_FOLDER_ID = '1042248535'
IGNORE_COINCIDENCE_FILES = true
DATA_TO_IMPORT = []
FILE_TO_DELETE_ID = '3482889'
FOLDER_TO_DELETE_ID = '1555056'
ACCESS_TYPE = 1
NOTIFY_USER = true
NOTIFICATION_MESSAGE = random_word(10)
PROVIDER_ID = '12137'
#endregion

#region Projects
BASECAMP_URL = "https://basecamp.com/2452154"
BASECAMP_LOGIN = "qwegsdfs@qwe.ru"
BASECAMP_PSW = "123456"
IMPORT_CLOSED_PROJECTS = true
DISABLE_NOTIFICATONS = false
IMPORT_USERS_AS_COLLABORATORS = true
PROJECT_ID_FOR_OPERATIONS = '405065'
MESSAGE_ID = '268060'

#endregion

#endregion