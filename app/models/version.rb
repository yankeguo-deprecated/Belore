class Version < ActiveRecord::Base
  belongs_to :post, inverse_of: :versions

  before_save do
    # Generate content_rich from markdown
    self.content_rich  = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    .render(self.content || "")
    # Generate content_plain from content_rich
    self.content_plain = Sanitize.clean(self.content_rich, Sanitize::Config::STRICT)
    true
  end
end
