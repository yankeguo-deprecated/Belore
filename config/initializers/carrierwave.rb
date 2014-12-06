CarrierWave.configure do |config|

  if Rails.env.production?

    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['S3_ACCESS_KEY'],         # required
      :aws_secret_access_key  => ENV['S3_ACCESS_SECRET'],      # required
    }
    config.fog_directory   = ENV['S3_BUCKET']                  # required

  end

end
