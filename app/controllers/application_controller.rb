class ApplicationController < ActionController::API
    
    def encode_token(payload)
        JWT.encode(payload, ENV[JWT])
    end

    # Anticipate JWT sent along in request headers
    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            # headers: { 'Authorization': 'Bearer <token>' }
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, ENV[JWT], true, algorithm: 'HS256')
            # return nil if we receive an invalid token so that we can keep going and the server doesn't crash
            # instead of returning a 500 internal server error
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            # get the 'user_id' from decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

end
