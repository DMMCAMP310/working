class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_liker
         
         has_many :timelogs, dependent: :destroy
         has_many :reviews
         has_one_attached :profile_image
         
        def get_profile_image
          (profile_image.attached?) ? profile_image : 'no_image.jpg'
        end
        
        def update_password(params, *options)
          if params[:password].blank?
            params.delete(:password)
            params.delete(:password_confirmation) if params[:password_confirmation].blank?
          end
       
          result = update(params, *options)
          clean_up_passwords
          result
        end
end
