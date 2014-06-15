require './bundle'

def load_bundles
	Dir["#{File.dirname(__FILE__)}/bundles/**/*.rb"].each { |f| require f }

	ObjectSpace.each_object(Class).select { |klass| klass < ScriptBundle }
end
