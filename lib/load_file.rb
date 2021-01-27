class Load_file
  def initialize(url)
    @url = url 
  end

  def read_file
    local_dir = Dir.glob(@url).first
    file = File.open(local_dir)

    file.readlines.each do | lines|
        puts lines
    end
    
    file.close
  end
end
