# Jenkins module for triggering branch builds
module Jenkins
  # @param branch [String]
  # @return response
  def self.trigger_pipeline(branch)
    url = 'https://jenkins.yogaeasy.de/job/YogaEasy%20Parallel/build'
    authorization = Base64.strict_encode64(ENV['JENKINS_USER'] + ':' + ENV['JENKINS_TOKEN'])
    payload = {
      "parameter": [
        { "name":"BRANCH", "value":"develop" },
      ]
    }
    RestClient.post(url, payload, headers: { 'Content-Type': 'application/json', Authorization: 'Basic ' + authorization })
  end
end
