module ScriptHouse

	class TODO < ScriptBundle

		attr_reader :hook_name, :scheme_name, :config

		def self.handle_hook(hook_name, scheme_name)
			hook = self.new(hook_name, scheme_name)
			hook.handle
		end

		def initialize(hook_name, scheme_name)
			@hook_name = hook_name
			@scheme_name = scheme_name
			@config = YAML::load_file()
		end

		def handle
		end

		def pre_source_build_hook
		end

		def execute
			source_files = Dir['**/*'].reject do |fn| 
				File.directory?(fn) || !([".h", ".m", ".mm"].include? File.extname(fn)) 
			end

			keywords = /^.*((TODO:|FIXME:|\?\?\?:|\!\!\!:).*)/

			warning_lines = source_files.flat_map do |fn|
				File.read(fn, :encoding => 'utf-8').each_line.with_index(1).select { |line| 
					keywords.match(line)
				}.map { |line, index| 
					"#{File.realpath(fn)}:#{index}: warning: #{line.gsub(keywords, '\1')}"
				}
			end

			puts warning_lines
		end
	end
end
