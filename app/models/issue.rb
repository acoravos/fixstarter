class Issue < ActiveRecord::Base
  has_many :issues_watches
  has_many :fixes
  has_many :fix_comments, through: :fixes
  has_many :issue_comments
  has_many :users_bumps
  belongs_to :user
  belongs_to :community
  has_many   :categories_issues
  has_many   :categories, through: :categories_issues

  def self.package_stream_issues
    stream_items = []
    self.last(4).each do |issue|
      stream_items << {title: issue.title,
                      description: issue.description,
                      username: issue.user.full_name,
                      imageUrl: issue.image_url }
    end
    stream_items
  end

  # def package_info
  #   {id: self.id, user_id: self.user_id, fix_id: self.fix_id, content: self.content, user: self.user.first_name}
  # end

end
