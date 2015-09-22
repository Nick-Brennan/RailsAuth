class User < ActiveRecord::Base

	validates :email, :password_digest, presence: true
	validates_confirmation_of :password

	def password
		@password
	end

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(@password)
	end

	def authenticate(password)
		if BCrypt::Password.new(self.password_digest) == password
			self
		else
			false
		end
	end

	def self.confirm(email, password)
		user = User.find_by_email(email)
		user.authenticate(password)
	end

end
