require './loader'

def handle_hook(hook_name)
	load_bundles().each { |bundle| bundle.handle_hook(hook_name) }
end
