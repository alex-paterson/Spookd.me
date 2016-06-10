# require 'elasticsearch'
#
# if Rails.env.production?
# 	config = {
# 	  host: "http://search-snapfame-ixv4k3i22kxdxyh7idlssmxyui.us-west-2.es.amazonaws.com/",
# 	  transport_options: {
# 	    request: { timeout: 5 }
# 	  },
# 	}
#
# 	if File.exists?("config/elasticsearch.yml")
# 	  config.merge!(YAML.load_file("config/elasticsearch.yml").symbolize_keys)
# 	end
#
# 	Elasticsearch::Model.client = Elasticsearch::Client.new(config)
# else
# 	config = {
# 	  host: "http://localhost:9200/",
# 	  transport_options: {
# 	    request: { timeout: 5 }
# 	  },
# 	}
#
# 	if File.exists?("config/elasticsearch.yml")
# 	  config.merge!(YAML.load_file("config/elasticsearch.yml").symbolize_keys)
# 	end
#
# 	Elasticsearch::Model.client = Elasticsearch::Client.new(config)
# end
