class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]
  skip_before_action :verify_authenticity_token

    def index
      @all = User.all
      count = User.count.to_s
      response.set_header('Access-Control-Expose-Headers', "X-Total-Count")
      response.set_header('X-Total-Count', count)
      render json: @all
    end

    def profile
      # find by username because that param is provided
      user = User.find_by(username: params['username'])
      token = encode_token({ user_id: user.id })
      render json: { token: token, user_id: user.id }
    end

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
