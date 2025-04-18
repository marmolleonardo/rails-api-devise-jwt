module RackSessionFix
  extend ActiveSupport::Concern
  
  class FakeSession < Hash
    def enabled?
      false
    end

    def destroy; end

    def clear; end

    def loaded?
      true
    end

    def id
      nil
    end

    def options
      { id: nil }
    end
  end
  
  included do
    before_action :set_fake_session
    
    private
    
    def set_fake_session
      request.env['rack.session'] = FakeSession.new
      request.env['rack.session.options'] = { skip: true }
    end
  end
end
