# frozen_string_literal: true

require 'spec_helper'

describe '[Mailserver][Functional] Mailboxes' do
  let(:mailbox_name) { Faker::Name.first_name }
  let(:my_id) { Teamlab.people.get_self.body['response']['id'] }
  let(:domain_id) { Teamlab.mailserver.tenant_domain_list.body['response'].first['id'] }
  let(:add_mailbox) do
    Teamlab.mailserver.add_mailbox(name: mailbox_name,
                                   local_part: mailbox_name,
                                   domain_id: domain_id,
                                   user_id: my_id)
  end

  it 'Create new mailbox' do
    response = add_mailbox
    expect(response.body['response']['id']).to be_a(Integer)
  end

  it 'Get mailbox list' do
    response = Teamlab.mailserver.mailboxes
    expect(response.body['response'].first['id']).to be_a(Integer)
  end

  it 'Delete mailbox' do
    mailbox_id = add_mailbox.body['response']['id']
    expect(Teamlab.mailserver.delete_mailbox(mailbox_id).body['response']).to be_a(Hash)
  end
end
