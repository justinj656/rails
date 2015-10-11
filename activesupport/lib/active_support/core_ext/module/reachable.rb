require 'active_support/core_ext/module/anonymous'
require 'active_support/core_ext/string/inflections'

class Module
  def reachable? #:nodoc: JJ: what is reachable for a module, see test
    !anonymous? && name.safe_constantize.equal?(self)
  end
end
