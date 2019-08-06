# Continuous Integration class
class Ci
  # @param branch [String]
  def self.docker_down(branch)
    cmd = 'D=$(docker ps -qa -f name="' +
             branch +
             '") && if [ -n "$D" ]; then docker stop ' +
             branch +
             '; docker rm ' +
             branch +
             '; fi'
    puts cmd
    system(cmd) &&
      system('docker rmi -f yogaeasy/yogaeasy-rails:' + branch + ' || true')
  end
end
