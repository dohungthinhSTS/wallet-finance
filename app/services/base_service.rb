class BaseService
  def execute
    raise ImplementedError
  end

  def self.execute(params = {})
    new(params).execute
  end
end
