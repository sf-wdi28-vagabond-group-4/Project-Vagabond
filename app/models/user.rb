class User < ActiveRecord::Base
  validates :email, uniqueness: true

  has_many :posts
  has_secure_password

  has_attached_file :image, styles: { medium: "600x600>", thumb: "600x600#" },
  default_url: "default_image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
