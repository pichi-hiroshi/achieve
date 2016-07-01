class ContactsController < ApplicationController
  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end

  def create
    # Contact.create(contacts_params)
    @contact = Contact.create(contacts_params)
    if @contact.save
      # redirect_to :action => "new", notice: "お問い合わせを送信しました"
      redirect_to root_path, notice: "お問い合わせが完了しました！"
    else
      render action: 'new', notice: "空白になっている箇所があります"
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
