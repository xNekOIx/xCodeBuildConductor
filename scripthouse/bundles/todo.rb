class TODO < ScriptBundle
	
	private

	def pre_source_compile_build_path_hook
		self.execute
	end

	def execute
		if self.config.?
			raise "Config not set"
		end

		files_to_look = self.config['default']['files']

		source_files = Dir['**/*'].reject do |fn| 
			File.directory?(fn) || !(files_to_look.include? File.extname(fn)) 
		end

		keywords = self.config['default']['keywords']
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
