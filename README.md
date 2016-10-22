# nsone
A stupid simple API client for NS1

It implements a simple HTTParty-based wrapper around the reading the zone
endpoints for now.

# Usage
```ruby
require 'nsone'

c = Nsone::Client.new(API_KEY)
c.zones
```

# Command Line
`bin/zone_exporter` exists to provide a thin wrapper around exporting ns1 zones
into the format GoogleDNS requires, and outputting the appropriate `gcloud`
commands for you to manually run.

## TODO
* Implement the rest of the API as the itch strikes us.
* Tests