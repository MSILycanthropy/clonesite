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

  def member_avatar(member)
    tag.div(class: "avatar placeholder") do
      tag.div(class: "bg-neutral text-neutral-content w-28 rounded-full") do
        tag.span(class: "text-xl") { member.initials }
      end
    end
  end
end
