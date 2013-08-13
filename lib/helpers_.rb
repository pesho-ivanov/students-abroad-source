# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

#require 'open-uri'
#require 'feed-normalizer'  # for parsing feeds
#require 'truffle-hog'      # for finding feeds
#require 'sanitize'         # sanitizing HTML
require 'feedzirra'        # for parsing and aggregating feeds

include Nanoc::Helpers::Rendering
include Utils 

