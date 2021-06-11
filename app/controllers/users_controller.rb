class UsersController < ApplicationController
  before_action :authorized, only: [:summary]

  # LOGGING IN ROUTE
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: user_json, access_token: token}
    else
      render json: "Invalid email or password" ,status: :unauthorized
    end
  end
  # REGISTER ROUTE
  def register
    if User.exists?(email: params[:email])
      render json: "This email is already registered please login"  , status: :conflict
    else
    @user = User.create(user_params)
    @user.avatarUrl = "https://i.ibb.co/1K6h85n/avatar5.png"
    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: user_json, access_token: token} , status: 200
    else
      p @user.errors
      render json: "Unexpected error: Please contact the developer",status:400
    end
  end
  end

  # SUMMARY ROUTE
  def summary
    t_owners = SummaryObj.new("totalOwners","account_circle","Total Owners",Owner.where(user_id: @user.id).length)
    t_farms = SummaryObj.new("totalFarms","view_module","Total Farms", Farm.where(user_id: @user.id).length)
    t_inspections = SummaryObj.new("totalInspections","biotech","Total Inspections",Inspection.where(user_id: @user.id).length)
    t_scans = SummaryObj.new("totalScans","search","Total Scans",Inspection.where(user_id: @user.id).length)
    summary_arr = [t_owners,t_farms,t_inspections,t_scans]
    render json: summary_arr, status:200
  end

  # Refactoring User Object to remove password field
  private
  def user_json
    { id:@user.id,fullName:@user.fullName,email:@user.email,avatarUrl:@user.avatarUrl }
  end

  # Announcing Controller Parameters
  private
  def user_params
    params.permit(:email, :password,:password_confirmation, :fullName,:avatarUrl)
  end


end



# Defining Summary Class
class SummaryObj
  #constructor
  def initialize(bg,ico,tit,sub)
    #inner variables
    @bgClass = bg
    @icon = ico
    @title = tit
    @subtitle = sub
  end
  #functions
  def GetJSON
    return { bgClass: @bgClass,icon:@icon,title:@title,subtitle:@subtitle }
  end
end