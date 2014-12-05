require "addressable/uri"

module ApplicationHelper

  # Automatically set locale override for all url
  def url_for(options={})
    val = super
    if params[:locale].present?
      parsed = Addressable::URI.parse(val)
      parsed.query_values = (parsed.query_values(Array) || []) << ['locale', params[:locale]]
      parsed.to_s
    else
      val
    end
  end
end
