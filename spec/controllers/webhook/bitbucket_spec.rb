require 'spec_helper'
require_relative '../../../app/controllers/webhook/bitbucket_controller'

describe 'Webhook::Bitbucket' do
  describe '#pr_closed' do
    it 'requires authentication' do
      post :pr_closed, pullrequest: request
      expect(response.status).to eq 200
    end
  end
end
