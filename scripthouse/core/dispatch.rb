require './loader'

module ScriptHouse

	def handle_hook(hook_name, scheme_name)
		load_bundles().each { |bundle| bundle.handle_hook(hook_name, scheme_name) }
	end
end
