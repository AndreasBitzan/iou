class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

    def index
      users = User.all
   
      render json: UserSerializer.new(users).serialized_json
    end
   
    def show
      user = User.find(params[:id])
   
      render json: UserSerializer.new(user).serialized_json
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render status: 201, json: UserSerializer.new(@user).serializable_hash.to_json
      else
        render json: { errors: [{title: "Did not work", detail: "Creating the user did not work"}] }, status: 422
      end
  
    end

    def set_user
      @user = User.find(params[:id])
    end
  

    def update
      set_user
      if @user.update(user_params)
        render status: :ok, json: UserSerializer.new(@user).serializable_hash.to_json
      else
        render json: @user.errors, status: 422  # einfacher error
        render json: { errors: ErrorSerializer.new(@user).serialized_json }, status: 422
      end
    end

    def destroy
      set_user
      begin
        @user.destroy
      rescue ActiveRecord::RecordNotFound
        render json: { errors: [{title: "Not found", detail: "Did not find the user"}] }, status: 404
        return
      rescue ActiveRecord::InvalidForeignKey
        render json: { errors: [{title: "Not found", detail: "User cannot be deleted through various reasons."}] }, status: 403
        return
      rescue StandardError
        raise
      rescue Exception
        raise
      end 

      render json: { head: :no_content }, status: 204
    end

    def user_params
      p = params.require(:data).permit(:type, attributes: %i[name email password])
      
      if p[:type] == 'user'
         p[:attributes] 
      else
        nil
      end
    end

    
  
  
  end