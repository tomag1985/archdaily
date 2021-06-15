require 'json'

def recommend(json)
	json = JSON.parse(json) # parsing json to have a hash to handle
	arr = [logs = [], content = [], myad = []] # creating an array of arrays (each index represents each algorithm)
	i = 0
	keys = ["logs", "content", "myad"] # possible keys of the hash, if we change the suggestions, this is the line we need to change

	keys.each do |key| # iterating over keys
		json[key].each do |token|
			arr[i] << token["token"]
		end
		i += 1
	end

	header, *rows = arr # extracting head and tail of the list
	header.zip(*rows).flatten.compact[0...4] # ziping everything together and returning first 4 values
end
