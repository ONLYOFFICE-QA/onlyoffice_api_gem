# frozen_string_literal: true

require 'spec_helper'

describe '[Community][Functional] Bookmarks' do
  let(:tag) { "tag with space #{SecureRandom.uuid}" }

  it 'Get bookmark by tag with spaces in tag' do
    added = Teamlab.community.add_bookmark('www.google.com',
                                           'description',
                                           tags: tag).body['response']
    expect(Teamlab.community.get_bookmarks_by_tag(tag)
                  .body['response'].first['id']).to eq(added['id'])
  end
end
