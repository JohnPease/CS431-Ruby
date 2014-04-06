# John Pease, Exam 2 Studying
class MyComplex 

	attr_accessor :real
	attr_accessor :imag

	def initialize (real, imag)
		@real = real
		@imag = imag
	end
	
	def add that
		# return the sum of self and that
		result = MyComplex.new(self.real + that.real, self.imag + that.imag)
	end

	def times that
		# return the product of self and that
		first = self.real * that.real
		second = self.imag * that.imag
		third = self.imag * that.real
		fourth = self.real * that.imag
		result = MyComplex.new(first - second, third + fourth)
	end

	def to_s
		# print the complex
		return @real.to_s + ' + ' + @imag.to_s + 'j'
	end

	def real
		@real
	end

	def imag
		@imag
	end
end

firstComplex = MyComplex.new(2, 3)
secondComplex = MyComplex.new(3, 4)
puts firstComplex.add(secondComplex).to_s
puts firstComplex.times(secondComplex).to_s
