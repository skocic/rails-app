require_relative '../../../app/bitbucket/bitbucket'

module Api
  # JIRA controller
  class JiraController < ApplicationController
    include JiraHelper

    def webhook
      if params['access_token'] != ENV['ACCESS_TOKEN']
        render json: { error: 'access_token failure' }
      elsif params['issue_id'].nil?
        render json: { error: 'issue is missing' }
      else
        begin
          branch = get_branch(params['issue_id'])
          puts branch
          response = Bitbucket.trigger_pipeline(branch)
          render json: response
        rescue RestClient::BadRequest => e
          render json: { error: e.message, code: 400 }
        rescue RestClient::NotFound => e
          render json: { error: e.message, code: 404 }
        end
      end
    end
  end
end
