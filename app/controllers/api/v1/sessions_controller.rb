class Api::V1::SessionsController < ApplicationController
    def create
        
        @user = User.find_by(username: params[:user][:username])
    
        if @user && @user.authenticate(params[:user][:password])
            @token = encode_token(user_id: @user.id)
            render json: {
                user: {
                id: @user.id,
                email: @user.email,
                username: @user.username,
                password: @user.password,
                logged_in: true
            },
        token: @token,
    status: 200}
        elsif @user
            render json: {
                status: :unprocessable_entity,
                error: "Password Is Incorrect"
            }
        else
            render json: {
                status: :unprocessable_entity,
                error: "Username Not Found"
            }
        end
    end

    def logout
        reset_session
        render json: {status: 200, logged_in: false}
    end
end
