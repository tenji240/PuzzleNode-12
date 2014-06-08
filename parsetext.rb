text = []
File.open("text.txt") do |file|
  file.each do |line|
    text << line.split(' ')
  end
end
puts text.flatten.inspect