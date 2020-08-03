class ApplicationController < ActionController::API

    # lock down app unless user is authenticated
    before_action :authorized
    
    def encode_token(payload)
        # encode takes up to 3 args(payload, secret, hash_algo). 
        # returns jwt as a string
        JWT.encode(payload, ENV['JWT'])
    end

    # Anticipate JWT sent along in request headers
    def auth_header
        # provides access to http headers
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            # headers: { 'Authorization': 'Bearer <token>' }
            token = auth_header.split(' ')[1]
            begin
                # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
                JWT.decode(token, ENV['JWT'], algorithm: 'HS256')
              rescue JWT::DecodeError
                # or nil if we can't decode the token
                nil
            end
        end
    end

    def current_user
        if decoded_token
            # grab value of 'user_id' key inside first index
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end


