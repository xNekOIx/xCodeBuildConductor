class ScriptBundle

	private

	attr_reader :hook_name, :config, :hooks_hash_map


	public

	def self.handle_hook(hook_name, config)
		hook = self.new(hook_name, config)
		self.send(self.hook_name)
	end

	def initialize(hook_name, config)
		if hook_name.nil?
			raise "hook_name is nil"
		end

		@hook_name = hook_name
		@config = config
		@hooks_hash_map = {
			"Pre Source Compile Build Path Hook" => :pre_source_compile_build_path_hook,
			"Post Source Compile Build Path Hook" => :post_source_compile_build_path_hook,
			"Pre Build Action Hook" => :pre_build_action_hook,
			"Post Build Action Hook" => :post_build_action_hook,
			"Pre Test Action Hook" => :pre_test_action_hook,
			"Post Test Action Hook" => :post_test_action_hook,
			"Pre Launch Action Hook" => :pre_launch_action_hook,
			"Post Launch Action Hook" => :post_launch_action_hook,
			"Pre Profile Action Hook" => :pre_profile_action_hook,
			"Post Profile Action Hook" => :post_profile_action_hook,
			"Pre Analyze Action Hook" => :pre_analyze_action_hook,
			"Post Analyze Action Hook" => :post_analyze_action_hook,
			"Pre Archive Action Hook" => :pre_archive_action_hook,
			"Post Archive Action Hook" => :post_archive_action_hook
		}
	end
end
