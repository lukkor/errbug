module TestHelpers
  module_function

  def app
    Errbug::Application.app
  end

  def rom
    Errbug::Container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
