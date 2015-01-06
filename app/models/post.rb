class Post < ActiveRecord::Base
  has_many :comments, inverse_of: :post

  after_create do
    # Ensure versions after_save
    self.ensure_versions
    true
  end

  has_many :versions, inverse_of: :post

  def ensure_versions
    # Check no-exists versions and create them
    I18n.available_locales.each do |lang|
      self.versions.find_or_create_by(lang: lang) do |ver|
        ver.title   = ""
        ver.content = ""
      end
    end
  end
end
