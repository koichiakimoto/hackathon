class User < ActiveRecord::Base

  before_create :create_remember_token

  has_many:my_box, dependent: :destroy

  # has_secure_password

  # 論理削除されていないレコードを1件取得
  def self.find_by_twitter_token(twitter_token)
    User.where(:twitter_token => twitter_token, :deleted => false).first
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def update_twitter(auth)
    update_attributes(:twitter_token => auth.credentials.token,
                      :name => auth.info.nickname,
                      :twitter_name => auth.uid)
  end

  def self.save_twitter(auth)
    user = User.new
    user.twitter_token = auth.credentials.token
    user.name = auth.info.nickname
    user.twitter_name = auth.uid
    user.save
    user
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
