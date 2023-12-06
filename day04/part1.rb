cards = Array.new
buffer = seperator = total = 0
File.open("../inputs/input4.txt" ,"r") do |file|
  while (ch = file.read(1)&.ord) do
    case (ch)
    when 124 then seperator = cards.length # seperator |
    when 32  # space
      if (buffer != 0) # in case of extra spaces between numbers
        cards.push(buffer)
        buffer = 0
      end
    when 10  # new line
      cards.push(buffer)
      total += (2 ** (cards[1, seperator - 1].count{|c| cards[seperator..].include?(c)} - 1)).floor
      cards = Array.new
      seperator = buffer = 0
    when 48..57
      buffer *= 10
      buffer += ch - 48
    end
  end
end
puts total
