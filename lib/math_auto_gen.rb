require 'pry'
module MathAutoGen
	def test
		puts "HELLO WORLD"
	end

	def gen_simple_geometry_area_problems(option = {})
		case option[:difficulty]
		when 'baby-byte'
			min = 1
			max = 50
		when 'easy'
			min = 1
			max = 100
		when 'medium'
			min = 100
			max = 500
		when 'hard'
			min = 500
			max = 1000
		when 'pro'
			min = 1000
			max = 5000
		end		
		# Find Area problems
		# TODO: Generate Quad-Problems
		# TODO: Generate Triangle-Problems
		# Expected return:
		# { 1 => { :type => quad, :points => {:p1 => [0,0], :p2 => [0,1] , ;p3 => [1,0], :p4 => [1,1]}, :answer => value }, 2 => {} }
		# generate random points based on :type
		questions = {}
		option[:total_questions].times do |i|
			problem_num = i + 1
			questions[problem_num] = {}
			case option[:type]
			when 'quad-simple'
				total_points = 4
				align = true
			when 'quad-slant'
				total_points = 4
				align = false
			end
			questions[problem_num][:points] = {}
			points = questions[problem_num][:points]
			points[:p1] = [0,0]
			(total_points - 1).times do |i|
				# proceeding in clockwise fashion
				reference_point = points["p#{i+1}".to_sym]
				current_point = i + 2
				points["p#{current_point}".to_sym] = []
				working_point = points["p#{current_point}".to_sym]
				if align
					if option[:type] == 'quad-simple'
						if reference_point[0] == 0 && reference_point[1] == 0
							working_point.push reference_point[0]
							working_point.push rand(min..max)
						elsif reference_point[0] == 0 && reference_point[1] > 0
							working_point.push rand(min..max)
							working_point.push reference_point[1]
						elsif reference_point[0] > 0 && reference_point[1] > 0
							working_point.push reference_point[0]
							working_point.push 0
						end
					end
				else
					if option[:type] == 'quad-slant'
						# Generate Points
						checking_points = true
						while checking_points do
							case i
							when 0 # Point 2
								creating_pointx = rand(min..max)
								creating_pointy = rand(min..max)
							when 1 # Point 3
								creating_pointx = rand((points[:p2][0]+1)..max)
								creating_pointy = reference_point[1]
							when 2 # Point 4
								creating_pointx = rand((points[:p2][0]+1)..max)
								creating_pointy = 0
							end										
							unless creating_pointx.nil? || creating_pointy.nil?
								working_point.push creating_pointx 
								working_point.push creating_pointy
								checking_points = false
							end		
						end						
					end
				end
			end
			if option[:type].include?('quad')
				if align
					length = points[:p2][1]
					width = points[:p3][0]
					questions[problem_num][:length] = length
					questions[problem_num][:width] = width
					area_answer = length * width
					questions[problem_num][:area_answer] = area_answer
				else
					questions[problem_num][:sub_shapes] = {}
					sub_shapes = questions[problem_num][:sub_shapes]
					# How to find the right triangles?
					# 1. Commonly we can indicate it with 90 degree intetersection
					# 2. Couple it with indication of slanted line + 90 degree?
					# Generate points for quad - assume static [0,0] start point
					# Points are always positive for now.
					quad = generate_quad_points(points)
					# Defined quad point hash
					checking_points = true
					while checking_points do
						nil_list = []
						quad.each do |k,v|
							if v.nil?
								nil_list.push nil
							end
						end
						if nil_list.include?(nil)
							quad = generate_quad_points(points)
						else
							checking_points = false
						end
					end
					quad_area = find_quad_area(quad, points)
					sub_shapes[:quad] = quad
					# Checking if there are more than one triangles, since you can also have
					# the following:
					# [0,0], [5,10], [10,10], [10,0]
					# Resulting in one triangle
					# Defining correct points for triangles 
					triangles = count_and_return_triangles(points, quad) # should return an array of hashes of triangle points
					triangle_areas = []
					i = 0
					triangles.each do |triangle|
						# Setting a 
						if triangle[:p1][0] == triangle[:p2][0]
							a = ( triangle[:p1][1] - triangle[:p2][1] ).abs
						elsif triangle[:p1][1] == triangle [:p2][1]
							a = ( triangle[:p1][0] - triangle[:p2][0] ).abs  
						end
						# Setting b
						if triangle[:p3][0] == triangle[:p2][0]
							b = ( triangle[:p3][1] - triangle[:p2][1] ).abs
						elsif triangle[:p3][1] == triangle [:p2][1]
							b = ( triangle[:p3][0] - triangle[:p2][0] ).abs  
						end
												
						triangle_areas.push ((a*b)/2.0)
						sub_shapes["triangle_#{i}".to_sym] = triangle
						i += 1
					end
					
					area_answer = triangle_areas.inject(:+) + quad_area
					questions[problem_num][:area_answer] = area_answer
				end
			else
				#triangles
			end
		end
		questions
	end

	# option={:difficulty=>'baby-byte',:random=>false,:type_of_questions=>'division',:total_questions=>10}
	def gen_simple_arithmetic_problems(option = {})
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

	def count_and_return_triangles(points, quad, options = {})
		# crossreference the quad to each point
		# develop for quads for now and assume there will be only 2 tringles
		triangles = []
		if quad[:p2][0] > points[:p1][0]
			tri_points = {}
			if points[:p2][1] < quad[:p1][0] 
				tri_points[:p1] = points[:p2]
				tri_points[:p2] = quad[:p1]
				tri_points[:p3] = points[:p1]
			else
				tri_points[:p1] = points[:p1]
				tri_points[:p2] = quad[:p1]
				tri_points[:p3] = points[:p2]
			end
			triangles.push tri_points
		end	
		if points[:p3][0] != points[:p4][0]
			tri_points = {}
			if ( points[:p4][0] - quad[:p4][0] ) > quad[:p3][1]
				if points[:p3][0] < points[:p4][0]
					tri_points[:p1] = points[:p3]
					tri_points[:p2] = quad[:p4]
					tri_points[:p3] = points[:p4]
				else
					tri_points[:p1] = points[:p4]
					tri_points[:p2] = quad[:p3]
					tri_points[:p3] = points[:p3]					
				end				
			elsif ( points[:p3][0] - quad[:p3][0] ) > quad[:p3][1]
				if points[:p3][0] > points[:p4][0]
					tri_points[:p1] = points[:p4]
					tri_points[:p2] = quad[:p3]
					tri_points[:p3] = points[:p3]					
				else
					tri_points[:p1] = points[:p3]
					tri_points[:p2] = quad[:p4]
					tri_points[:p3] = points[:p4]
				end
			else
				if points[:p3][0] > points[:p4][0]
					tri_points[:p1] = points[:p3]
					tri_points[:p2] = quad[:p3]
					tri_points[:p3] = points[:p4]					
				else
					tri_points[:p1] = points[:p4]
					tri_points[:p2] = quad[:p4]
					tri_points[:p3] = points[:p3]
				end				
			end
			triangles.push tri_points
		end
		triangles
	end

	def generate_quad_points(points)
		quad_point1 = [points[:p2][0], 0]
		quad_point2 = points[:p2]
		if points[:p3][0] > points[:p4][0]
			quad_point3 = [points[:p4][0], points[:p2][1]]
			quad_point4 = points[:p4]
		elsif points[:p3][0] < points[:p4][0]
			quad_point3 = points[:p3]
			quad_point4 = [points[:p3][0], 0]
		else
			quad_point3 = points[:p3]
			quad_point4 = points[:p4]
		end
		quad = {:p1 => quad_point1, :p2 => quad_point2, :p3 => quad_point3, :p4 => quad_point4}
	end

	def find_quad_area(quad, points)
		if quad[:p3][0] > points[:p4][0] || quad[:p3][0] == quad[:p4][0]
			quad_area = quad[:p2][1] * ( quad[:p4][0] - quad[:p2][0] )
		else
			quad_area = quad[:p2][1] * ( quad[:p3][0] - quad[:p2][0] )
		end	
	end
end