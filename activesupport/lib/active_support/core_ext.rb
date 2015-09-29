Dir["#{File.dirname(__FILE__)}/core_ext/*.rb"].each do |path|
  require path
end

# JJ ---
# Attn: Dir[] is equivalent to calling Dir.glob([string,...],0).
#       "~" in path is not recognized.
