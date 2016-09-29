require "serverspec"
require "docker"

if not ENV['IMAGE'] then
  puts "You must provide an IMAGE env variable"
end

RSpec.configure do |c|
  @image = Docker::Image.get(ENV['IMAGE'])
  set :backend, :docker
  set :docker_image, @image.id
  set :docker_container_create_options, {
    'User'       => '100000'
  }
  
  describe "tests" do
    describe file('/test.txt') do
      it { should exist }
    end
    describe file('/test.txt') do
      its(:content) { should contain 'test' }
    end
  end

end