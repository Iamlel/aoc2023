DAY = 1
eval s = %q(
  s = "DAY = #{(DAY % 2) + 1}
eval s = %q(#{s})"
  SPELLED = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  num1 = num2 = 0
  num3 = num4 = 0
  buffer_string = ""

  buffer = game = id = 0
  red = green = blue = 0

  total1 = total2 = 0
  File.open("input#{DAY}.txt", "r") do |file|
    while (ch = file.read(1)&.ord) do
      if (DAY == 1)
        if (ch == 10)
          total1 += num1 * 10 + num2
          total2 += num3 * 10 + num4
          num1 = num3 = 0

        elsif (ch <= 57)
          num2 = num4 = ch - 48
          if (num1 == 0) then num1 = num2 end
          if (num3 == 0) then num3 = num4 end

        else
          buffer_string << ch
          i = 1
          until i > 9 do
            if (buffer_string.include?(SPELLED.at(i-1)))
              num4 = i
              if (num3 == 0) then num3 = num4 end
              buffer_string = buffer_string[-1]
              break
            end
            i += 1
          end
        end
      elsif (DAY == 2)
        case ch
        when 100     # d (for red)
          game += (buffer > 12 ? 1 : 0)
          red = buffer if buffer > red
          buffer = 0
        when 103    # g
          game += (buffer > 13 ? 1 : 0)
          green = buffer if buffer > green
          buffer = 0
        when 98    # b
          game += (buffer > 14 ? 1 : 0)
          blue = buffer if buffer > blue
          buffer = 0
        when 10     # newline
          total1 += (game == 0 ? id : 0)
          total2 += red * green * blue
          game = red = green = blue = 0
        when 48..57 # 1-9
          buffer *= 10
          buffer += ch - 48
        when 58     # :
          id = buffer
          buffer = 0
        end
      end
    end
  end
  puts s
  puts "-----------------------"
  puts "Day #{DAY}:"
  puts "Part 1: " << total1.to_s
  puts "Part 2: " << total2.to_s
  puts "-----------------------"
)
