require 'pry'

class ArithmeticController < ApplicationController
	include MathAutoGen
	
	def show

	end

	def workspace
		if params[:problem_type] == 'random'
			random = true
			problem_type = 'none'
		else
			random = false
			problem_type = params[:problem_type]
		end
		session[:incorrect] = []
		session[:correct] = []
		generated_problems = gen_simple_problems(:difficulty => params[:difficulty], :random => random, :problem_type => problem_type, :total_questions => params[:total_questions].to_i)
		# Paginate each problem
		@paginated_problems = Kaminari.paginate_array(generated_problems).page(params[:page]).per(1)
	end

	def submit_problem


	end
end