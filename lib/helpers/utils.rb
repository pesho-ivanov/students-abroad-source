module Utils 
  class AssertionError < RuntimeError 
    def self.assert &block
      raise AssertionError unless yield
    end
  end

  def obfuscate_email(obf_email)
    orig_email = obf_email.gsub('.alabala.', '')
    AssertionError.assert{ orig_email.length < obf_email.length }    
    return orig_email[0..2] + '<div class="antispam">answer42.195@runforever.com</div>' + orig_email[3..-1]
  end

  def stripped_filename(item)
    %r".*/(?<stripped_filename>[^/.]+)" =~ item[:filename]
    return stripped_filename
  end

  def photo(item)
    return "/photos/" + stripped_filename(item) + ".jpg"
  end

  def find_feed(url)
    # get atom and rss
    feed_urls = TruffleHog.parse_feed_urls(url)
    puts feed_urls

    return feed_urls
  end

  def fetch_feeds()
    return

    feed_links = [] 
    @items['/blogs/'].children.sort_by { |blog| blog[:title] }.each do |blog|
      if !blog[:hide]
        feed_links.push(blog[:feed])
      end
    end

    print feed_links
    feeds = Feedzirra::Feed.fetch_and_parse(feed_links)

    #feeds.each do |feed_url, feed, blog|
    #  print blog[:feed] 
    #end 

    #feed_url = find_feed(item[:link])
    #feed_url = item[:feed]
    #puts feed_url
    #return feed_url
    #feed = FeedNormalizer::FeedNormalizer.parse open(feed_url)

    #return feed

    #feed.title # => "International Herald Tribune"
    #feed.url # => "http://www.iht.com/pages/index.php"
    #feed.entries.first.url # => "http://www.iht.com/articles/2006/10/03/frontpage/web.1003UN.php"

    #feed.class # => FeedNormalizer::Feed
    #feed.parser # => "RSS::Parser"

    #return feed.entries[2].content
  end
end
