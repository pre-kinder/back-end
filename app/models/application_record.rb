class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search_email(email_params)
    where('email = ?', email_params)
  end

  def self.search_google_id(google_id_params)
    where('google_id = ?', google_id_params)
  end
end
