#ruby proj7.rb -ids or -name > scores.html
#must have csv file in the same diectory as the ruby file
require 'csv'

count = 1
possible_array = []
assignments = 0, tests = 0, assignment_weight = 0, test_weight = 0
asst_1 = 0
asst_2 = 0
asst_3 = 0
asst_4 = 0
asst_5 = 0
asst_6 = 0
asst_7 = 0
asst_8 = 0
test_1 = 0
test_2 = 0
average = 0, asst_total = 0, test_total = 0
student_asst = 0
student_test = 0
student_average = 0
puts "<!DOCTYPE html>"
puts "<html>"
puts "<style>
    table, th, td {
    border:1px solid black;
    text-align:center;
    }
    </style>"
puts "<body>"
puts "<h1>CS 13 Score Summary</h1>" 
puts "<table>"

#opening up the csv and grabing the entires needed for the variable
csv = CSV.read("scores1.csv")
assignments = csv[1][2].to_f                    #8 assignments
tests = csv[2][2].to_f                          #2 test
assignment_weight = csv[3][2].to_f              
assignment_weight *= 0.01                       #0.40
test_weight = csv[4][2].to_f
test_weight *= 0.01                             #0.60
#Row is an array
CSV.foreach(("scores1.csv"), headers: false) do |row|
   
   
   if count == 6
        puts "\t<tr>"
        row.each{ |entries|
            if entries == "Name"
                next
            end
            puts "\t\t<th>" + entries + "</th>"
        }
        puts "\t\t<th>Average</th>"
        puts "\t</tr>" 
   end

   #Getting the total score of the assignment and test
   if count == 7
        possible_array = row

        possible_count = 0
        possible_array.each{ |entires|
        
            if possible_count >= 2 and possible_count <= 9  
                asst_total += entires.to_f
            elsif possible_count > 9
                test_total += entires.to_f
            end
            possible_count += 1
    }
    end

  if count > 7
    if ARGV[0] == "-ids"
        puts "\t\t<td>" + row[0] + "</td>"
    elsif ARGV[0] == "-names"
        puts "\t\t<td>" + row[1].downcase + "</td>"
    end

    asst_1 += row[2].to_f
    student_asst += row[2].to_f 
    if row[2].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[2] + "</td>"
    end

    asst_2 += row[3].to_f
    student_asst += row[3].to_f 
    if row[3].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[3] + "</td>"
    end

    asst_3 += row[4].to_f
    student_asst += row[4].to_f 
    if row[4].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[4] + "</td>"
    end

    asst_4 += row[5].to_f
    student_asst += row[5].to_f
    if row[5].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[5] + "</td>"
    end

    asst_5 += row[6].to_f
    student_asst += row[6].to_f
    if row[6].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[6] + "</td>"
    end

    asst_6 += row[7].to_f
    student_asst += row[7].to_f
    if row[7].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[7] + "</td>"
    end

    asst_7 += row[8].to_f
    student_asst += row[8].to_f
    if row[8].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[8] + "</td>"
    end

    asst_8 += row[9].to_f
    student_asst += row[9].to_f
    if row[9].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[9] + "</td>"
    end

    test_1 += row[10].to_f
    student_test += row[10].to_f
   
    if row[10].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[10] + "</td>"
    end

    test_2 += row[11].to_f
    student_test += row[11].to_f

    if row[11].nil?
        puts "\t\t<td>  </td>"
    else
        puts "\t\t<td>" + row[11] + "</td>"
    end

    student_average = (((student_asst / asst_total) * assignment_weight) + ((student_test / test_total) * test_weight)) * 100
    print("\t\t<td>", student_average.round(2), "</td>\n")
    puts "\t</tr>" 
   
end

   student_asst = 0
   student_test = 0
   student_average = 0
   count = count + 1
end

#Getting the averages and adjusting the count for the average
puts "\t<tr>"
puts "\t\t<td><b>Average</b</td>"
print("\t\t<td><b>", (asst_1 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (asst_2 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (asst_3 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (asst_4 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (asst_5 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (asst_6 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (asst_7 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (asst_8 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (test_1 / (count - 9)).round(1), "</b></td>\n")
print("\t\t<td><b>", (asst_2 / (count - 9)).round(1), "</b></td>\n")
puts "\t<tr>"

puts "\t<tr>"
puts "\t\t<td><b>possible</b></td>"
puts "\t\t<td><b>" + possible_array[2] + "</b></td>"
puts "\t\t<td><b>" + possible_array[3] + "</b></td>"
puts "\t\t<td><b>" + possible_array[4] + "</b></td>"
puts "\t\t<td><b>" + possible_array[5] + "</b></td>"
puts "\t\t<td><b>" + possible_array[6] + "</b></td>"
puts "\t\t<td><b>" + possible_array[7] + "</b></td>"
puts "\t\t<td><b>" + possible_array[8] + "</b></td>"
puts "\t\t<td><b>" + possible_array[9] + "</b></td>"
puts "\t\t<td><b>" + possible_array[10] + "</b></td>"
puts "\t\t<td><b>" + possible_array[11] + "</b></td>"
puts "\t</tr>"
puts "</table>"
puts "</html>"
