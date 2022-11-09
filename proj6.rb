#!/user/bin/ruby

#Hash table for program
user_hash = { 'A' => 1,  'F' => 4,  'K' => 5,  'P' => 3,  'U' => 1,
    'B' => 2,  'G' => 2,  'L' => 1,  'Q' => 10, 'V' => 4,
    'C' => 3,  'H' => 4,  'M' => 3,  'R' => 1,  'W' => 4,
    'D' => 2,  'I' => 1,  'N' => 1,  'S' => 1,  'X' => 8,
    'E' => 1,  'J' => 8,  'O' => 1,  'T' => 1,  'Y' => 4,
    'Z' => 10
   }

#Looping the input until empty space is found
while(true)
    puts "Scrabble Score Calculator"
    print "Enter word to score: "
   
    scrabble = gets.chomp
   
    #Check to see no user input
    if scrabble.empty?
        break
    end

    #if it includes a white space
    if scrabble.include?(" ")
        puts "Error found a bad character:\n " + ' '
        next
    end
    #Variables for the programs
    scrabble = scrabble.upcase
    sum = 0
    sum_mul = 1
    counter = 0
    scrabble_array = []
    checkNum = []

    #Going thru the string array and checking for errors
    scrabble.split('').each { |c|
        checkNum << c
        counter = counter + 1
        #Checking to see if it is a number
        result = Integer(c) rescue false
        
        #Checkking to see if it a number
        if result
            int_c = c.to_i
            if counter == 1
                sum_mul = sum_mul * int_c
            else
                last = scrabble_array.pop
                last = last * int_c
                scrabble_array << last
            end
        end
        
        user_hash.each do |key, value|
            if key == c   
                scrabble_array << value
            end
        end
    }

    isNumber = false
    #Loop that checks if there are numbers right next to each other
    checkNum.each_with_index { |val, index|
        char_Num = Integer(checkNum.at(index)) rescue false

        #If the last index is greater then the bound then leave
        if checkNum.length() >= index + 1
            char_Num2 = Integer(checkNum.at(index + 1)) rescue false
        else   
            break
        end

        #Check to see if both numbers
        if char_Num and char_Num2
            puts "Error, found bad character #{checkNum.at(index + 1)}\n"
            isNumber = true
            break
        end
    }

    if isNumber
        next
    end

    #Adding the string in the array
    scrabble_array.each{ |x|
        sum = sum + x
    }

    sum = sum * sum_mul
    puts sum
    puts "\n"
end

puts "bye!"
