words = []
File.open("en.txt") do |file|
  file.each do |line|
    words << line.strip
  end
end
puts words.include?("magic")
#puts words["saldkaj"]