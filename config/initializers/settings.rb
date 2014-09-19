require 'settingslogic'

class Settings < Settingslogic
	source File.expand_path('../../config.yml',__FILE__)
	load!
end