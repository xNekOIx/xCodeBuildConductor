module ScriptHouse

	class Logger < ScriptBundle

		def Logger.handleHook(hookName, schemeName)
			puts "hook name is #{hookName} and scheme name is #{schemeName}"
			puts ENV.to_hash
		end
	end
end
