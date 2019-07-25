module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = verified_user || guest_user
    end

    private

    def verified_user
      env['warden'].user
    end

    def guest_user
      guest = GuestUser.new

      guest.id = guest.object_id
      guest.name = 'Guest User'
      guest.first_name = 'Guest'
      guest.last_name = 'User'
      guest.email = 'guest@user.com'

      guest
    end
  end
end
