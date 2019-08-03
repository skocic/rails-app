# Bitbucket module for triggering branch builds
module Bitbucket
  def self.trigger_pipeline(branch)
    url = 'https://api.bitbucket.org/2.0/repositories/sasa_kocic/rails-app/pipelines/'
    payload = {
      'target': {
        'ref_type': 'branch',
        'type': 'pipeline_ref_target',
        'ref_name': branch
      }
    }
    RestClient.post(url, payload, headers: { 'Content-Type': 'application/json' })
  end
end
