num1 = num2 = total = 0
File.open("../input1.txt", "r") do |file|
  while (ch = file.read(1)&.ord) do
    ch -= 48
    if (ch == -38)
      total += num1 * 10 + num2
      num1 = 0
    elsif (ch <= 9)
      if (num1 == 0)
        num1 = num2 = ch
      else
        num2 = ch
      end
    end
  end
end
puts total
