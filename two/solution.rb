require 'pry'

def read_file(file)
  hash = {
    "red" => 12,
    "green" => 13,
    "blue" => 14
  }
  
  count = 0
  part_two = []
  File.readlines(file).each do |line|
    blue_two = []
    red_two = []
    green_two = []

    blue_arr = []
    red_arr = []
    green_arr = []

    a = line.split(':')[1].split(';')
    id = line.split(': ')[0].split(' ')[-1].to_i

    arr = []
    a.each do |string|
      b = string.lstrip.delete(',')
      c = b.split(' ')
      #  The * is called the splat operator.
      d = Hash[*c].invert
      if ((d.size) * 2) != c.size
        d = {}
        
        c.each_slice(2) do |key, value|
        d[value] = key
        end
        d
      end

      if d.include?("blue") && d.include?("red") && d.include?("green")
        blue = d["blue"].to_i
        red = d["red"].to_i
        green = d["green"].to_i
          if blue > hash["blue"] || red > hash["red"] || green > hash["green"]
            blue_two << blue
            red_two << red
            green_two << green
          else
            arr << id
            blue_arr << blue
            red_arr << red
            green_arr << green
          end
      elsif d.include?("blue") && d.include?("red")
        blue = d["blue"].to_i
        red = d["red"].to_i
          if blue > hash["blue"] || red > hash["red"]
            blue_two << blue
            red_two << red
          else
            arr << id
            blue_arr << blue
            red_arr << red

          end

      elsif d.include?("blue") && d.include?("green")
        blue = d["blue"].to_i
        green = d["green"].to_i
          if blue > hash["blue"] || green > hash["green"]
            blue_two << blue
            green_two << green
          else
            arr << id
            blue_arr << blue
            green_arr << green
          end

      elsif d.include?("red") && d.include?("green")
        red = d["red"].to_i
        green = d["green"].to_i
          if red > hash["red"] || green > hash["green"]
            red_two << red
            green_two << green
          else
            arr << id
            red_arr << red
            green_arr << green
          end
        

      elsif d.include?("green")
        green = d["green"].to_i
          if green > hash["green"]
            green_two << green
          end
        arr << id
        green_arr << green

      elsif d.include?("blue")
        blue = d["blue"].to_i
          if blue > hash["blue"]
            blue_two << blue
          else
            arr << id
            blue_arr << blue

          end

      elsif d.include?("red")
        red = d["red"].to_i
        if red > hash["red"]
          red_two << red
        else
          arr << id
          red_arr << red
        end

      else
        "Not a valid color"
        break
      end
      count += id if arr.size == a.size
    end
    blue_am = (blue_arr + blue_two).sort[-1]
    green_am = (green_arr + green_two).sort[-1]
    red_am = (red_arr + red_two).sort[-1]
    
    total_fewest = blue_am * green_am * red_am
    
    part_two << total_fewest
  end
  part_two.sum
end

puts read_file('data_two.txt')