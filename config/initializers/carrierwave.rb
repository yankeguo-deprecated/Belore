CarrierWave.configure do |config|

  if Rails.env.production?

    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['S3_ACCESS_KEY'],         # required
      :aws_secret_access_key  => ENV['S3_ACCESS_SECRET'],      # required
      :region                 => ENV['S3_REGION'],             # optional, defaults to 'us-east-1'
      :host                   => ENV['S3_HOST']
      :endpoint               => ENV['S3_ENDPOINT']            # optional
    }
    config.fog_directory   = 'blog'                            # required

  end

end
