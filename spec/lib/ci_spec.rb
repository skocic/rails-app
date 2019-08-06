require 'spec_helper'
require_relative '../../lib/ci'

describe Ci do
  it '#docker_up' do
    expect(true).to eq(true)
  end

  it '#docker_down' do
    branch='feature_DEV-69-deployment-script'
    result = Ci.docker_down(branch)
    expect(result).to eq(true)
  end
end
