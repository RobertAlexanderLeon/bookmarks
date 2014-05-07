class Link

	include DataMapper::Resource

	property :id, 	Serial
	property :tile, String
	property :url, 	String

end