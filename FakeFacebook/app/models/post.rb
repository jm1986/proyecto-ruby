class Post < ActiveRecord::Base
  

  
  attr_accessible :body, :user_id

  #validates_presence_of :body, :user
  validates :body, :user, :presence => true

  has_many :comments #para indicar que un post tiene muchos comentarios
  belongs_to :user


   delegate :name, :to => :user, :prefix => true , :allow_nil => true   #para que nos muestre usuario, en lugar del codigo interno de identificador de usuario, con lo de nil permitimos que no nos de error cn los que tengan ese valor vacio
end
