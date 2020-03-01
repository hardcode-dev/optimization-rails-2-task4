# == Schema Information
#
# Table name: tag_adjustments
#
#  id                    :bigint(8)        not null, primary key
#  adjustment_type       :string
#  article_id            :integer
#  created_at            :datetime         not null
#  reason_for_adjustment :string
#  status                :string
#  tag_id                :integer
#  tag_name              :string
#  updated_at            :datetime         not null
#  user_id               :integer
#
class TagAdjustment < ApplicationRecord
  validates :user_id, presence: true
  validates :article_id, presence: true
  validates :tag_id, presence: true
  validates :tag_name, presence: true, uniqueness: { scope: :article_id }
  validates :reason_for_adjustment, presence: true
  validates :adjustment_type, inclusion: { in: %w[removal addition] }, presence: true
  validates :status, inclusion: { in: %w[committed pending committed_and_resolvable resolved] }, presence: true
  validate  :user_permissions

  belongs_to :user
  belongs_to :tag
  belongs_to :article

  private

  def user_permissions
    errors.add(:user_id, "does not have privilege to adjust these tags") unless user&.has_role?(:tag_moderator, tag) || user&.has_role?(:admin) || user&.has_role?(:super_admin)
  end
end
