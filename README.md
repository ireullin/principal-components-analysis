# principal-components-analysis

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'principal-components-analysis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install principal-components-analysis

## Usage

A simple example:

```ruby
require 'principal-components-analysis'

data = [[2,   0,   -1.4],
        [2.2, 0.2, -1.5],
        [2.4, 0.1, -1],
        [1.9, 0,   -1.2]]

# create a pca object within data
pca = PCA.new(data)

# show the eigen values & eigen vectors for the data
puts "#{pca.eigen}\n\n"

# reduce to 2 dimensions
reduced_data, distortion_rate = pca.reduce(2)
p reduced_data
puts "distortion_rate=#{distortion_rate}\n\n"

# reduce to 1 dimensions
reduced_data, distortion_rate = pca.reduce(1)
p reduced_data
puts "distortion_rate=#{distortion_rate}\n\n"
```
