text = []
File.open("text.txt") do |file|
  file.each do |line|
    text << line.split(%r{[\W]+})
  end
end
puts text.flatten.join(" ")