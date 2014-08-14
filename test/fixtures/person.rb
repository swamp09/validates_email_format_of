require 'validates_email_format_of'

module ValidatesEmailFormatOf
  class Base
    include ActiveModel::Model
    attr_accessor :email
  end
end

class Person < ValidatesEmailFormatOf::Base
  validates_email_format_of :email,
                            :on => :create,
                            :message => 'fails with custom message',
                            :allow_nil => true
end

class PersonForbidNil < ValidatesEmailFormatOf::Base
  validates_email_format_of :email,
                            :on => :create,
                            :allow_nil => false
end

class MxRecord < ValidatesEmailFormatOf::Base
  validates_email_format_of :email,
                            :on => :create,
                            :check_mx => true
end

class Shorthand < ValidatesEmailFormatOf::Base
  validates :email, :email_format => { :message => 'fails with shorthand message' },
                    :length => { :maximum => 1 }
end
