require "./lib/deep_freezable"

class Bank
  extend DeepFreezable

  CURRNCIES = deep_freeze({ "japan" => "yen", "US" => "dollar", "India" => "rupee" })
end