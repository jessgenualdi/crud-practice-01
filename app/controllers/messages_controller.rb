class MessagesController < ApplicationController
  def index
    @messages = Message.all # Why is this singular if its rooted in the Messages Controller??
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    message = Message.new(
      name: params["name"],
      body: params["body"]
      )
    message.save
    redirect_to "/messages"
  end

  def show
    message_id = params[:id]
    @message = Message.find_by(id: message_id)
    render 'show.html.erb'
  end

  def edit
    message_id = params[:id]
    @message = Message.find_by(id: message_id)
    render 'edit.html.erb'
  end

  def update
    message_id = params[:id]
    message = Message.find_by(id: message_id)
    message.name = params[:name]
    message.body = params[:body]
    message.save
    redirect_to '/messages'
  end

  def destroy

  end
end
