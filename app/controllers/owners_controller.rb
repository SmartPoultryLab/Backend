class OwnersController < ApplicationController
    before_action :set_owner, only:[:get_owner_by_id,:update_owner,:delete_owner]

    def get_owners
        render json: Owner.all ,status:200
    end

    def get_owner_by_id
        render json: @current_owner,status:200
    end

    def add_owner
        @new_owner = Owner.create(name: owner_params[:name],address: owner_params[:address],number: owner_params[:number],user_id:logged_in_user['id'])
        if @new_owner.save
            render json: {msg: "Owner Added" }, status:200
        else
            render json:@new_owner.errors
        end
    end

    def update_owner
        temp_owner = @current_owner
        temp_owner.name = owner_params[:name]
        temp_owner.address = owner_params[:address]
        temp_owner.number = owner_params[:number]
        if temp_owner.save
            render json:{msg:"Owner Updated"},status:200
        else
            render json:temp_owner.errors,status:304
        end
    end

    def delete_owner
        Owner.destroy_by(id: params[:id])
        render json:{msg: "Owner Deleted" },status:200
    end

    # Announcing Controller Parameters
    private
    def owner_params
        params.permit(:name, :address,:number,:id)
    end

    private
    def set_owner
        @current_owner = Owner.find(params[:id])
    end
end
