class Module
  ###
  # TODO: remove this after 1.9 support is dropped
  def methods_transplantable? # :nodoc:
    x = Module.new { def foo; end }
    Module.new { define_method :bar, x.instance_method(:foo) }
    true
  rescue TypeError
    false
  end
end

# JJ: ---
# can not transplant a method to another class if they don't have same superclass in 1.9
# like below:
# irb(main):001:0> x = Module.new { def foo; end }
# => #<Module:0x0000000258b6a8>
# irb(main):002:0> Module.new { define_method :bar, x.instance_method(:foo) }
# TypeError: bind argument must be a subclass of #<Module:0x0000000258b6a8>
	# from (irb):2:in `define_method'
	# from (irb):2:in `block in irb_binding'
	# from (irb):2:in `initialize'
	# from (irb):2:in `new'
	# from (irb):2
	# from /usr/bin/irb:12:in `<main>'
