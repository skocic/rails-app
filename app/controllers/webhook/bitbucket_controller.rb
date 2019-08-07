require_relative '../../../lib/ci'
require 'active_support/rescuable'

# Bitbucket Controller
class Webhook::BitbucketController < ApplicationController
  # include Api::JiraHelper

  rescue_from StandardError, with: :handle_error

  before_action do
    if params['access_token'] != ENV['ACCESS_TOKEN']
      render(json: { error: 'access_token failure', code: 400 }) && return
    elsif params['issue_id'].nil?
      render json: { error: 'issue is missing' }
    end
  end

  def pr_closed
    render(json: params) && return
    begin
      branch = get_branch(params['branch'])
      puts branch
      response = Jenkins.trigger_pipeline(branch)
      render json: response
    rescue RestClient::BadRequest => e
      render json: { error: e.message, code: :bad_request }
    rescue RestClient::NotFound => e
      render json: { error: e.message, code: 404 }
    end
  end

  # def down
  #   begin
  #     branch = get_branch(params['issue_id'])
  #     puts branch
  #     Ci.docker_down(branch)
  #     render json: { status: response }
  #   rescue RestClient::BadRequest => e
  #     render json: { error: e.message, code: :bad_request }
  #   rescue RestClient::NotFound => e
  #     render json: { error: e.message, code: 404 }
  #   end
  # end

  def handle_error(exception)
    render(json: { message: exception.message }, status: :bad_request) && return
  end
end
