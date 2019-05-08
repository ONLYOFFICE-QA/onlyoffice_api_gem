# Change log

## master (unreleased)

### New features

* [#36](https://github.com/ONLYOFFICE/onlyoffice_api_gem/pull/36): Refactoring Response class. Add new calendar methods.
* [#34](https://github.com/ONLYOFFICE/onlyoffice_api_gem/pull/34), [#35](https://github.com/ONLYOFFICE/onlyoffice_api_gem/pull/35):
 Ignore empty arrays as request params.
* Add feed methods: new_feeds_count, filter_feed, read_feed
* Add `GLOBAL_ADMIN_ID` constant to `Settings`
* Add support of `Teamlab.configure#proxy` - `Net::HTTP::Proxy` object
* Add `create_new_if_exists` option to `Files#insert_to_my_docs` 
* Add `Settings#get_version_build` request
* Add `Mail#always_display_images` and `Mail#set_always_display_images` 
* Add `Crm#get_invoice_item_by_id` request
* Add `Project#projects_settings` request
* Add `Community#delete_bookmark`
* Add `Community#delete_forum_post`, `Community#delete_forum_topic`
* Remove usage of `httmultiparty`

### Fixes

* `Crm#create_opportunity` set requred argument `bidCurrencyAbbr`
* Remove non-existing method `Crm#group_contact_info`, `Crm#group_contact_info_update`
* Fix `Crm#get_summary_table` request
* Fix `Crm#create_invoice_line` request
* Fix `Crm#create_task_template` request
* Fix `Settings#get_sso_settings` request
* Fix `Community#update_wiki_page_comment` request
* Fix `Files#create_html_in_common_docs` request
* Fix `Project#get_template` request
* Fix `Crm#delete_contact_status` request
* Fix `Crm#delete_case_group` request
* Fix `Crm#set_rights_to_case` request
* Fix `Crm#change_contact_photo` request
* Fix `Crm#delete_file` request
* Fix `Crm#update_invoice` request
* Fix `Crm#delete_invoice_line` request
* Fix `Crm#update_organisation_address`
* Fix `Projects#update_subtask` request
* Rename `Crm#update_invoice_patch_status` to `Crm#update_invoice_group_status`
* Rename `Crm#add_deal_to_contact` to `Crm#add_contact_opportunity`
* Remove non-existing method `Crm#add_contact_address`
* Remove non-existing method `Crm#update_contact_address`
* Remove non-existing method `People#remind_password`
* Remove non-existing method `Community#delete_post_in_topic`
* Remove deprecated method for CRM Task Template
* Remove non-documented and not working `Projects#set_task_order`
* Remove non-documented `Projects#get_simple_task_by_filter`

### Refactor

* Move development dependencies to `Gemfile`
* Remove dependency of `activesupport`
* Remove deprecated `Crm#delete_contact_address`
* Remove deprecated `Crm#save_crm_settings`
* Rename `Crm#get_settings` to `Crm#get_invoice_settings`

## 0.6
### New features
* Support of keepConvertStatus for insert methods (from OnlyOffice > 8.9.1)
* File - Insert methods now support setting default file name
* Rename this gem from `teamlab` to `onlyoffice_api`

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
