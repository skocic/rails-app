#     'feature/DEV-126'
# Get the branch name from issue_id
# @param issue_id [Integer]
# @return [String]
module Api::JiraHelper
  def get_branch(issue_id)
    url = "https://yogaeasy.atlassian.net/rest/dev-status/1.0/issue/detail?issueId=#{issue_id}&applicationType=bitbucket&dataType=pullrequest"
    authorization = Base64.strict_encode64(ENV['JIRA_EMAIL'] + ':' + ENV['JIRA_PASSWORD'])
    response = RestClient.get(url, Authorization: 'Basic ' + authorization, accept: :json)
    json = JSON.parse(response)
    json['detail'].first['branches'].first['name']
  end
end
