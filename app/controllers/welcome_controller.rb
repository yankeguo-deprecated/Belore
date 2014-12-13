class WelcomeController < ApplicationController

  def index
    where_hash = { "versions.lang" => I18n.locale }
    where_hash["posts.is_published"] = true unless user_signed_in?

    @versions = Version.all
    .joins(:post)
    .where(where_hash)
    .order("is_published, rank DESC, id DESC")
    .paginate(:page => params[:page])
  end
end
