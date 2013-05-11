class Source

  LIST = Dir.open('public/sources').reject { |t| t =~ /\A\.+\z/ }

  class << self
    def all
      LIST.dup
    end
  end
end