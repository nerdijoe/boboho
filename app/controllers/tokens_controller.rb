class TokensController < ApplicationController
  before_action :authenticate!

  def get_token
    Twilio::Util::AccessToken.new(
          ENV['TWILIO_ACCOUNT_SID'],
          ENV['TWILIO_API_SID'],
          ENV['TWILIO_API_SECRET'],
          3600,
          current_user.username
        )
  end

  def get_grant
    grant = Twilio::Util::AccessToken::IpMessagingGrant.new
    grant.endpoint_id = "Chatty:#{current_user.username.gsub(" ", "_")}:browser"
    grant.service_sid = ENV['TWILIO_SERVICE_SID']
    grant
  end

  def create
    token = get_token
    grant = get_grant
    token.add_grant(grant)
    byebug
    render json: {username: current_user.username, token: token.to_jwt}
  end

end
