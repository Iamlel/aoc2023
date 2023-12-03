SPELLED = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
num1 = num2 = total = 0
buffer = ""
File.open("../inputs/input1.txt", "r") do |file|
  while (ch = file.read(1)&.ord) do
    if (ch == 10)
      total += num1 * 10 + num2
      num1 = 0

    elsif (ch <= 57)
      num2 = ch - 48
      if (num1 == 0) then num1 = num2 end

    else
      buffer << ch
      i = 1
      until i > 9 do
        if (buffer.include?(SPELLED.at(i-1)))
          num2 = i
          if (num1 == 0) then num1 = num2 end
          buffer = buffer[-1]
          break
        end

        i += 1
      end
    end
  end
end
puts total
