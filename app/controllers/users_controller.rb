class UsersController < ApplicationController


    def index
        render json: {data: User.all}
    end

    def create
        user = User.create(user_params)
        # Cookies[:email] = user.email
        render json: { data: user, message: 'User created successfully'}
    end
    def update
        id = params[:id].to_i
        user = User.find(id)
        user.update(user_params)
        render json: {message: 'User updated successfully'}
    end

    def login
        email = params[:email]

        user = User.find_by(email: email)

        if user&.authenticate(params[:passworrd])
            render json: {message: 'authenicated'}
        else 
            render json: {  message: "wrong combo"}
        end

        # if user
        #     authenticated = user.authenticate(params[:password])
        #     render json: {message: authenticated ? "Authenicated" : "Not Authenticated"}, status: authenticated ? :ok : :unauthorized
            # authenticated ? render json: {message: "Logged in successfully"} : render json: {message:"email/password do not match"}, status: :unauthorized
        
        # else
        #     render json: {message: "That user does not exist"}, status: :unprocessable_entity
        # end

        # session[:email] = email
        # render json: {message: "You are logged in"}

    end
    # TODO: delete, show_individual_user, logout(session) ., lift session to after user is authenticated



    private
    def user_params
        params.permit(:email, :password)
    end

end
