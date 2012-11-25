class Database

  def Database.connect
    ActiveRecord::Base
      .establish_connection(YAML.load(ARGV.join(" ").gsub(/:/, ': ')))
  end

end
