# Continuous Integration class
class Ci
  # @param branch [String]
  def self.docker_down(branch)
    system('~/docker/docker-deployment-down.sh', '-b', branch)
  end
end
