# LoadFile class
class LoadFile
  attr_accessor :file, :close

  def initialize(url)
    @url = url
  end

  def read_file
    local_dir = Dir.glob(@url).first
    @file = File.open(local_dir)
  end
end
