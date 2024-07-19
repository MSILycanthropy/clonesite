module MemberHelper
  BADGE_CLASS_MAP = {
    active: "badge-accent",
    inactive: "badge-neutral"
  }.with_indifferent_access.freeze

  def member_status_badge(member)
    badge_class = BADGE_CLASS_MAP[member.status]

    tag.div(class: "badge #{badge_class}") do
      member.status
    end
  end
end
