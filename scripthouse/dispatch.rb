require './loader'

module ScriptHouse

	def handleHook(hookName, schemeName)
		loadBundles().each { |bundle| bundle.handleHook(hookName, schemeName) }
	end
end
