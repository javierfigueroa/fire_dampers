class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    # if user.role? :tech
      # can :manage, Inspection, :user_id => user.id
    # end
    if user.role? :admin
      can :manage, :all
    elsif user.role? :regular
      can :manage, [Job, Inspection, Report, Technician], :user_id => user.id
      can :manage, Inspection, :company_id => user.company_id
    elsif user.role? :technician
      tech = Technician.where(:email => user.email).first
      client = User.find(tech.user_id)
      
      can :read, Job, :user_id => client.id
      can :manage, Inspection, :user_id => client.id
      can :manage, Inspection, :user_id => user.id
      can :manage, Inspection, :company_id => user.company_id
      cannot :read, Report
      cannot :read, User
      cannot :read, Technician
    end
  end
end
