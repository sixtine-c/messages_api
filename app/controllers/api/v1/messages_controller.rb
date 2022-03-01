class Api::V1::MessagesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_messages, only: [:show, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @message.update(message_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @message.destroy
    head :no_content
  end

  private

  def set_messages
    @message = Message.find(params[:id])
    # @user = User.find(params[:user_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def render_error
    render json: { errors: @message.errors.full_messages },
      status: :unprocessable_entity
  end
end
