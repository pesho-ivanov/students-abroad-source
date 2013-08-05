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
end
