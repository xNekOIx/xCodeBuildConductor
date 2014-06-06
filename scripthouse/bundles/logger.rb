class Logger < ScriptBundle

	def self.handle_hook(hook_name, scheme_name)
		puts "hook name is #{hook_name} and scheme name is #{scheme_name}"
		puts ENV.to_hash
	end
end
