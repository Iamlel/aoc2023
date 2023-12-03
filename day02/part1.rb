buffer = game = id = total = 0
File.open("../input2.txt", "r") do |file|
  while (ch = file.read(1)&.ord) do
    case ch
    when 100     # d (for red)
      game += (buffer > 12 ? 1 : 0)
      buffer = 0
    when 103    # g
      game += (buffer > 13 ? 1 : 0)
      buffer = 0
    when 98    # b
      game += (buffer > 14 ? 1 : 0)
      buffer = 0
    when 10     # newline
      total += (game == 0 ? id : 0)
      game = 0
    when 48..57 # 1-9
      buffer *= 10
      buffer += ch - 48
    when 58     # :
      id = buffer
      buffer = 0
    end
  end
end
puts total
