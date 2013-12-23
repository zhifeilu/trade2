class Product < ActiveRecord::Base
  mount_uploader :logo, AvatarUploader
end
