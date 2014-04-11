# a bunch of methods to work with objects that have a name
class Collection < Array
  def find_by_name(name)
    detect { |item| item.name == name }
  end

  def select_by_name(name)
    select { |item| item.name == name }
  end

  def reject_by_name(name)
    reject { |item| item.name == name }
  end

end