module Utils 
  def obfuscate_email(email)
    return email[0..2] + '<div id="antispam">answer42.195@runforever.com</div>' + email[3..-1]
  end
end
