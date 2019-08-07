class BitbucketHelper
  def self.get_branch(params)
    params['source']['branch'].gsub(/\//, '_')
  end
end
