# frozen_string_literal: true

module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, sort: column, direction: direction
  end

  def avatar_url(user)
    if user.image
      user.image
    else
      gravatar_id = Digest::MD5.hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end
  end
end
