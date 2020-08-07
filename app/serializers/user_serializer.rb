class UserSerializer
  def initialize(user_object)
    @user = user_object
  end

  def to_serialized_json
    options = {
      include: { 
        projects: {
          only: [:title, :description, :difficulty]
        } 
      },
      except: [:email, :password_digest, :created_at, :updated_at]
    }

    @user.to_json(options)
  end
end