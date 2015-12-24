module Teamlab
  class Community
    def initialize
      @request = Teamlab::Request.new('community')
    end

    def get_all_posts
      @request.get(%w(blog))
    end

    def get_blog_tags
      @request.get(%w(blog tag))
    end

    def get_my_posts
      @request.get(%w(blog @self))
    end

    def get_post(post_id)
      @request.get(['blog', post_id.to_s])
    end

    def get_posts_by_tag(tag)
      @request.get(['blog', 'tag', tag.to_s])
    end

    def search_posts(query)
      @request.get(['blog', '@search', query.to_s])
    end

    def get_user_posts(username)
      @request.get(['blog', 'user', username.to_s])
    end

    def get_comments(post_id)
      @request.get(['blog', post_id.to_s, 'comment'])
    end

    def create_post(title, content, options = {})
      @request.post(%w(blog), { title: title, content: content }.merge(options))
    end

    def add_comment(post_id, content, options = {})
      @request.post(['blog', post_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def update_post(post_id, title, content, options = {})
      @request.put(['blog', post_id.to_s], { title: title, content: content }.merge(options))
    end

    def delete_post(post_id)
      @request.delete(['blog', post_id.to_s])
    end

    def get_all_bookmarks
      @request.get(%w(bookmark))
    end

    def get_all_bookmark_tags
      @request.get(%w(bookmark tag))
    end

    def get_bookmark(id)
      @request.get(['bookmark', id.to_s])
    end

    def get_bookmarks_added_by_me
      @request.get(%w(bookmark @self))
    end

    def get_my_favourite_bookmarks
      @request.get(%w(bookmark @favs))
    end

    %w(day week month year).each do |e|
      define_method("get_top_of_#{e}_bookmarks") { @request.get(['bookmark', 'top', e.to_s]) }
    end

    def get_bookmarks_by_tag(tag)
      @request.get(['bookmark', 'tag', tag.to_s])
    end

    def get_recently_added_bookmarks
      @request.get(%w(bookmark top recent))
    end

    def get_bookmark_comments(bookmark_id)
      @request.get(['bookmark', bookmark_id.to_s, 'comment'])
    end

    def search_bookmarks(queue)
      @request.get(['bookmark', '@search', queue.to_s])
    end

    def add_bookmark(url, title, options = {})
      @request.post(%w(bookmark), { url: url, title: title }.merge(options))
    end

    def add_comment_to_bookmark(bookmark_id, content, options = {})
      @request.post(['bookmark', bookmark_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def get_all_events
      @request.get(%w(event))
    end

    def get_my_events
      @request.get(%w(event @self))
    end

    def get_event(id)
      @request.get(['event', id.to_s])
    end

    def search_events(query)
      @request.get(['event', '@search', query])
    end

    def get_event_comments(event_id)
      @request.get(['event', event_id.to_s, 'comment'])
    end

    def create_event(title, content, options = {})
      @request.post(%w(event), { title: title, content: content }.merge(options))
    end

    def vote_for_event(event_id, *variants)
      @request.post(['event', event_id.to_s, 'vote'], variants: variants.flatten)
    end

    def add_comment_to_event(event_id, content, options = {})
      @request.post(['event', event_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def update_event(event_id, title, content, options = {})
      @request.put(['event', event_id.to_s], { title: title, content: content }.merge(options))
    end

    def get_forums
      @request.get(%w(forum))
    end

    def get_thread_topics(id)
      @request.get(['forum', id.to_s])
    end

    def get_last_updated_topics
      @request.get(%w(forum topic recent))
    end

    def get_posts(topic_id)
      @request.get(['forum', 'topic', topic_id.to_s])
    end

    def search_topics(query)
      @request.get(['forum', '@search', query.to_s])
    end

    #==================================== TODO: ERROR

    def add_thread_to_category(category_id, category_name, thread_name, description)
      @request.post(%w(forum), categoryId: category_id, categoryName: category_name.to_s, threadName: thread_name, threadDescription: description)
    end

    def add_topic_to_thread(thread_id, subject, content, options = {})
      @request.post(['forum', thread_id], { subject: subject, content: content }.merge(options))
    end

    def add_post_to_topic(topic_id, subject, content, options = {})
      @request.post(['forum', 'topic', topic_id.to_s], { subject: subject, content: content }.merge(options))
    end

    def update_topic_in_thread(topic_id, subject, options = {})
      @request.put(['forum', 'topic', topic_id.to_s], { subject: subject }.merge(options))
    end

    def update_post_in_topic(topic_id, post_id, options = {})
      @request.put(['forum', 'topic', topic_id.to_s, post_id.to_s], options)
    end

    def delete_post_in_topic(topic_id, post_id)
      @request.delete(['forum', 'topic', topic_id.to_s, post_id.to_s])
    end

    def get_wiki_pages
      @request.get(%w(wiki))
    end

    def get_wiki_page(name, options = {})
      @request.get(['wiki', name], options)
    end

    def get_wiki_file_info(name)
      @request.get(['wiki', 'file', name.to_s])
    end

    def get_page_history(name)
      @request.get(['wiki', name.to_s, 'story'])
    end

    def get_all_page_comments(page_name)
      @request.get(['wiki', page_name.to_s, 'comment'])
    end

    def search_wiki_pages_by_name(name)
      @request.get(['wiki', 'search', 'byname', name.to_s])
    end

    def search_wiki_pages_by_content(content)
      @request.get(['wiki', 'search', 'bycontent', content.to_s])
    end

    def create_page(name, body)
      @request.post(%w(wiki), { name: name.to_s, body: body.to_s })
    end

    def upload_files(file)
      @request.post(%w(wiki file), somefile: File.new(file))
    end

    def create_wiki_page_comment(page_name, content, options = {})
      @request.post(['wiki', page_name.to_s, 'comment'], { content: content.to_s }.merge(options))
    end

    def update_wiki_page(name, body)
      @request.put(['wiki', name.to_s], { body: body.to_s })
    end

    def update_wiki_page_comment(comment_id, body)
      @request.put(['wiki', 'comment', comment_id.to_s], body: body)
    end

    def delete_wiki_page(name)
      @request.delete(['wiki', name.to_s])
    end

    def delete_wiki_file(name)
      @request.delete(['wiki', 'file', name.to_s])
    end

    def delete_wiki_page_comment(id)
      @request.delete(['wiki', 'comment', id.to_s])
    end
  end
end
