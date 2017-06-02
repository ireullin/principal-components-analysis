require 'matrix'
require './matrix_extension'
require './enumerable_extension'

class PCA
	def initialize(entries)
		@dimension = entries[0].size
		@entries = Matrix[*entries]
		conv_m = @entries.covariance_matrix
		# p conv_m
		eigen_vectors, eigen_values, v_inv = conv_m.eigensystem

		@eigen = []
		@total_eigenvalue = 0.0
		@dimension.times do |i|
			@eigen << { value: eigen_values[i,i], vector: eigen_vectors.row(i).to_a }
			@total_eigenvalue += eigen_values[i,i]
		end
		@eigen.sort_by!{|v| -v[:value]}
	end

	def eigen
		@eigen
	end

	def reduce(reducing_dimension=1)
		factor_array = []
		sum_eigenvalue = 0.0
		reducing_dimension.times.each do |i|
			factor_array << @eigen[i][:vector].map{|v| v * @eigen[i][:value] }
			sum_eigenvalue += @eigen[i][:value]
		end
		factor = Matrix[ *factor_array ]
		reduced_matrix = @entries * factor.t
		distortion_rate = 1 - (sum_eigenvalue/@total_eigenvalue)
		return reduced_matrix,distortion_rate
	end
end
