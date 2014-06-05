require './bundle'

def loadBundles
	Dir["#{File.dirname(__FILE__)}/bundles/**/*.rb"].each { |f| require f }

	ObjectSpace.each_object(Class).select { |klass| klass < ScriptHouse::ScriptBundle }
end
