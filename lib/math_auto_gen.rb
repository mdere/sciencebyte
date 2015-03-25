require 'pry'
module MathAutoGen
	def test
		puts "HELLO WORLD"
	end
	# option={:difficulty=>'baby-byte',:random=>false,:type_of_questions=>'division',:total_questions=>10}
	def gen_simple_problems(option = {})
		# Returns hash of arrays - each array is a equation
		# Format for 1 + 1 = ? (where ? is also part of the array with given answer)
		# - {[1,1,2]}
		# Note - For application, create user defined difficulty table, then this case
		# function will be deprecated in the future.
		case option[:difficulty]
		when 'baby-byte'
			total_nums = 2
			min = 1
			max = 10
		when 'easy'
			total_nums = 2
			min = 1
			max = 100
		when 'medium'
			total_nums = 2
			min = 100
			max = 500
		when 'hard'
			total_nums = 2
			min = 500
			max = 1000
		when 'pro'
			total_nums = 2
			min = 1000
			max = 5000
		end
		if !option[:random]
			case option[:problem_type]
			when 'addition'
				type = :+
				type_s = "+"
			when 'subtraction'
				type = :-
				type_s = "-"
			when 'multiplication'
				type = :*
				type_s = "*"
			when 'division'
				type = :/
				type_s = "/"
			end
		end
		questions = {}
		option[:total_questions].times do |i|
			problem_num = i+1
			questions[problem_num] = {}
			if option[:random]
				array = [:+,:-,:*,:/]
				type = array[rand(0..3)]
				case type
				when :+
					type_s = "+"
				when :-
					type_s = "-"
				when :*
					type_s = "*"
				when :/
					type_s = "/"
				end
			end
			problem_values = []
			problem_values.push rand(min..max) # First random problem value 
			if type == :/
				not_divisible = true
				while not_divisible do
					next_num = rand(min..max)
					while problem_values.include?(next_num) do
						next_num = rand(min..max)
					end
					if problem_values[0] % next_num == 0
						not_divisible = false
					end
				end
				problem_values.push next_num
			else
				problem_values.push rand(min..max)
			end
			questions[problem_num][:problem] = problem_values
			questions[problem_num][:answer] = problem_values.inject(type)
			questions[problem_num][:type] = type_s
		end
		questions
	end
end