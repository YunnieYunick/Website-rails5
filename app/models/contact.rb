class Contact < ApplicationRecord
  attr_accessor :name, :email, :message

  validates :name, :presence => {:message => "お名前を入力してください"}
  validates :email, :presence => {:message => "メールアドレスを入力してください"}
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ ,:message => "メールアドレスをご確認ください"
  validates :message, :presence => {:message => "お問い合わせ内容を入力してください"}
end
