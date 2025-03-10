# Change log

## master (unreleased)

### New Features

* Add `ruby-3.2` to CI
* Add `ruby-3.3` to CI
* Add `ruby-3.4` to CI
* Add `dependabot` check for `GitHub Actions`

### Fixes

* Fix not available `IMAGE_URL` constant in specs
* Run `rubocop` in CI through `bundle exec`

### Changes

* Check `dependabot` at 8AM by Moscow Time
* Fix `rubocop-1.28.1` code issues
* Remove deprecated in v12.0 `People#join_to_affiliate_programme` method
* Add `Logger` support in rspec test results
* Drop `ruby-2.5`, `ruby-2.6`, `ruby-2.7` support, since it's EOL'ed
* Run `codecov` in CI only on latest ruby
* Extract `rubocop` CI task to separate job
* Migrate to `codecov-4` GitHub Action
* Prohibit parallel run of CI (cause conflicts with multiple PR's)
* Remove all existing crm tags and cases in specs before running tests
* Remove all existing crm tasks and tasks categories before running tests
* Fixes from `rubocop-1.65.0` upgrade (`Gemspec/AddRuntimeDependency`)
* Remove `ruby-3.0` from CI, since it's EOLed
* Fix `rubocop-performance-1.24.0` cop `Performance/ArraySemiInfiniteRangeSlice`

## 1.0.1 (2022-02-21)

### Fixes

* Fix `markdownlint` failure because of old `nodejs` in CI
* Fix api request for non-escaped urls

## 1.0.0 (2022-02-03)

### New Features

* Add `CRM#get_currency_rate_by_currency` method
* Add `CRM#update_currency_rate` method
* Add `CRM#get_contact_information` method
* Add `CRM#get_contact_access_rights` method
* Add `CRM#add_address_info` method
* Add `CRM#update_address_info` method
* Add `CRM#check_invoice_existence_by_number` method
* Add `CRM#get_invoice_by_number` method
* Add `CRM#get_contact_opportunities` method
* Add `CRM#delete_contact_tag_of_group` method
* Add `People#get_user_by_email` method
* Add `People#get_user_photoes` method
* Add `People#send_delete_instruction` method
* Add `People#join_to_affiliate_programme` method
* Add `People#start_remove` method
* Add `People#remove_progress` method
* Add `People#terminate_remove` method
* Add `Projects#get_a_comment_preview` method
* Add `Projects#add_project_comment` method
* Add `Projects#discussion_subscribers` method
* Add `Projects#preview_of_discussion_message` method
* Add `Projects#delete_milestones` method
* Add `Projects#milestones_by_project_id_and_status` method
* Add `Projects#milestones_by_project_id` method
* Add `Projects#delete_projects` method
* Add `Projects#report_template` method
* Add `Projects#update_projects_settings` method
* Add `Portal#delete_portal` method
* Add `rspec-retry` support
* Add `ruby-3.1` to CI
* Add `yamllint` to CI
* Add `CodeQL` to CI
* Run linters in CI before actual tests

### Refactor

* Rename `set_currency_rate` to `create_currency_rate` according to documentation
* Rename `get_reassign_progress` to `reassign_progress`

### Changes

* Use new uploader for `codecov` instead of deprecated one
* Require `mfa` for releasing gem
* Fix issues from new rubocop version `v1.24.0`
* Remove `teamlab_spec` since it was used for non-actual preparations
* `People#active` removed. Use `People#add_user` instead

## 0.12.0 (2021-07-12)

### New Features

* Add `OnlyofficeApiInstance` class for usage without global namespace setup

## 0.11.0 (2021-06-22)

### Changes

* Add more detailed exception if responce is not JSON

## 0.10.0 (2021-04-29)

### Fixes

* Fix incorrect homepage of gem

## 0.9.0 (2021-04-29)

### Fixes

* Change `Config#default_configuration` domain

## 0.8.0 (2021-03-16)

### New Feature

* Check `rubocop` in CI
* Add `dependabot` config
* Add `MailServer#tenant_domain_list` method
* Add `MailServer#add_mailbox`, `MailServer#mailboxes`,
  `MailServer#delete_mailbox` method
* Add `Mail#operations` method
* Add `rubocop-rake` support
* Add `ruby-3.0` and `ruby-head` to CI

### Fixes

* Fix travis command to running markdownlint
* Fix `Community#get_bookmarks_by_tag` for tag with spaces
* Fix duplicate ids for some CRM requrest (bug #41394)
* Do not use random word length in test, sometimes it's zero
* Remove randomness from `Crm#update_invoice_group_status` test
* `PortalCleanup#remove_users` deletes terminated users
* Add projects cleanup in default spec

### Changes

* Use actual ruby 2.7 in CI tests
* Use GitHub Actions instead of TravisCI
* Add CRM cleanup in rspec tests
* Store all deps in gemspec
* Add `Gemfile.lock` to freeze specific versions
* Require ruby >= 2.5, since older version are EOLed
* Fixes from update `rubocop-performance` to `v1.9.0`
* `--fail-fast` for default `rake` spec task

## 0.7.0 (2020-04-29)

### New features

* [#36](https://github.com/ONLYOFFICE/onlyoffice_api_gem/pull/36):
  Refactoring Response class. Add new calendar methods.
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
* Add `People#start_reassign_user_data`,
  `People#get_reassign_progress`,
  `People#terminate_reassign`
* Add `Community#delete_event`
* Add `Community#delete_thread`
* Add `Community#delete_category`
* Add `params` support to several `Files` methods
* Remove usage of `httmultiparty`
* Add shortcut `Response#data` method
* Add `Group#info_by_name` method
* Add `Mail#set_default_account`
* Add support of `rubocop-performance`
* Add `markdownlint` support in travis
* Add rake task to release gem on `github`

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
* Fix urls for Mail Images methods
* Rename `Crm#update_invoice_patch_status` to `Crm#update_invoice_group_status`
* Rename `Crm#add_deal_to_contact` to `Crm#add_contact_opportunity`
* Remove non-existing method `Crm#add_contact_address`
* Remove non-existing method `Crm#update_contact_address`
* Remove non-existing method `People#remind_password`
* Remove non-existing method `Community#delete_post_in_topic`
* Remove deprecated method for CRM Task Template
* Remove non-documented and not working `Projects#set_task_order`
* Remove non-documented `Projects#get_simple_task_by_filter`
* Remove non-documented `Projects#get_task_order`
* Remove non-documented `Projects#get_tasks_by_ids`
* Fix warning about using `URI.escape`

### Refactor

* Move development dependencies to `Gemfile`
* Remove dependency of `activesupport`
* Remove deprecated `Crm#delete_contact_address`
* Remove deprecated `Crm#save_crm_settings`
* Rename `Crm#get_settings` to `Crm#get_invoice_settings`
* Remove Basecamp import methods
* Remove undocumented `Mail#generate_custom_guid` method
* `Community#update_event` require `type` and change to keyword arguments
* Rename `remove_event` to `delete_event` according to official docs.
  Keep old name as alias
* Minor cleanup in `gemspec`

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

* Add crm methods: save_smtp_settings, update_crm_currency,
  update_organisation_company_name, update_organisation_address
* Change method create_invoice

## 0.4.0

* Add portal submodule with `Portal#invite_user_url` and
  `Portal#invite_visitor_url` methods
* Add rubocop support in project. Fix a lot of minor problems,
  should have no impact on existing working code

## 0.3.16

* change method Settings#set_access

## 0.3.15

* Show more detailed information about response,
  if auth response not containing token

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
