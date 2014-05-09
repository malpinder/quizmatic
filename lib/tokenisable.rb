module Tokenisable

  def generate_token(field)
    begin
      self[field] = SecureRandom.urlsafe_base64
    end while self.class.exists?(field => self[field])
  end

end
