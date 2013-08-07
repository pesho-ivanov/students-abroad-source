module Utils 
  class AssertionError < RuntimeError 
    def self.assert &block
      raise AssertionError unless yield
    end
  end

  def obfuscate_email(obf_email)
    orig_email = obf_email.gsub('.alabala.', '')
    AssertionError.assert{ orig_email.length < obf_email.length }    
    return orig_email[0..2] + '<div id="antispam">answer42.195@runforever.com</div>' + orig_email[3..-1]
  end

  def stripped_filename(item)
    %r".*/(?<stripped_filename>[^/.]+)" =~ item[:filename]
    return stripped_filename
  end

  def photo(item)
    return "/photos/" + stripped_filename(item) + ".jpg"
  end

  def feed_url(item)
    link = item[:link]
    #'feeds/posts/default' 
    feed = FeedNormalizer::FeedNormalizer.parse open(feed_link)


    feed.title # => "International Herald Tribune"
    feed.url # => "http://www.iht.com/pages/index.php"
    feed.entries.first.url # => "http://www.iht.com/articles/2006/10/03/frontpage/web.1003UN.php"

    feed.class # => FeedNormalizer::Feed
    feed.parser # => "RSS::Parser"

    return feed.entries[2].content
  end
end
