buffer = red = green = blue = id = total = 0
File.open("../input2.txt", "r") do |file|
  while (ch = file.read(1)&.ord) do
    case ch
    when 100     # d (for red)
      red = buffer if buffer > red
      buffer = 0
    when 103    # g
      green = buffer if buffer > green
      buffer = 0
    when 98    # b
      blue = buffer if buffer > blue
      buffer = 0
    when 10     # newline
      total += red * green * blue
      red = green = blue = 0
    when 48..57 # 1-9
      buffer *= 10
      buffer += ch - 48
    when 58     # :
      buffer = 0
    end
  end
end
puts total
