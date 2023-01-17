class ClientMembershipSerializer < ActiveModel::Serializer
  attributes :name, :age, :sum


  def sum
    object.memberships.sum(:charge)
  end
end
