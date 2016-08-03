# Change log

## 0.6
### New features
* Support of keepConvertStatus for insert methods (from OnlyOffice > 8.9.1)
* File - Insert methods now support setting default file name
* Add deprecation warning and use of `onlyoffice_api` gem

### Fixes
* File checkconversion method

## 0.5.1
* Fix error bad URI(is not URI?)
* Fix url for method Group#add_group

## 0.5.0
* Add crm methods: save_smtp_settings, update_crm_currency, update_organisation_company_name, update_organisation_address
* Change method create_invoice

## 0.4.0
* Add portal submodule with `Portal#invite_user_url` and `Portal#invite_visitor_url` methods
* Add rubocop support in project. Fix a lot of minor problems, should have no impact on existing working code

## 0.3.16
* change method Settings#set_access

## 0.3.15
* Show more detailed information about response, if auth response not containing token

## 0.3.14
* add method Project#update_message_status 

## 0.3.13.1 & 0.3.13.2
* Fix dependency of httparty

## 0.3.13
* Fix delete_account in mail
* Fix if response == String
* Fix type request update_task_status in projects
* Add link_account, unlink_account in people
* Add empty gemtime dependencies, to remove warning during `gem build`

## 0.3.12
* Add support of Files#document_server_info.

## 0.3.11
* Fix a lot of tests. But not all
* Add get_sso_settings, get_ldap_settings, get_white_label_sizes methods in Settings

## 0.3.10
* Add any error >= 400 handling

## 0.3.9
* Add method Files#update_file_history for version finilization
* Fix Community#add_thread_to_category method

## 0.3.8
* Fix settings#get_usage_quota method because of typo

## 0.3.7.1
* Fix typo in identifying that portal is warming up

## 0.3.7
* Correctly handle portal warming up situation
