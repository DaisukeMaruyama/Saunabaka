class Public::ContactsController < ApplicationController
	def new
    @contact = Contact.new
  end

  # newアクションから入力内容を受け取り、
  # 送信ボタンを押されたらcreateアクションを実行
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # 入力内容に誤りがあった場合
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 実際に送信するアクション
  # ここで初めて入力内容を保存
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver_now
      redirect_to root_path, notice: 'お問い合わせ有難う御座います。確認が取れ次第折り返しご連絡致します。'
    else
      render :new
    end
  end
  
  private

  def contact_params
    params.require(:contact)
          .permit(:email,
                  :name,
                  :phone_number,
                  :subject,
                  :message
                 )
  end
end
