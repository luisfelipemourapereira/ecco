require 'json'
source "https://rubygems.org"

# Specify your gem's dependencies in ecco.gemspec
gemspec

# manage local jar dependency
def jar(name, **opts)

  opts                  = {} if opts.nil?
  opts                  = JSON[JSON[opts], symbolize_names: true]
  opts[:vendor_path]    = 'vendor/checkouts'
  opts[:checkout_path]  = File.join(opts[:vendor_path], name)

  raise ArgumentError, "can't use path and git together" if opts[:git] && opts[:path]

  system "mkdir -p #{opts[:vendor_path]}" unless Dir.exist?(opts[:vendor_path])

  if opts[:git]
    system "git clone #{opts[:git]} #{opts[:checkout_path]}" unless Dir.exist?(
      opts[:checkout_path]
    )
  end
end

jar 'mysql-binlog-connector-java',
    git: 'git@github.com:luisfelipemourapereira/mysql-binlog-connector-java.git'
