require 'rails_helper'

RSpec.describe Message, type: :model do
  current_user = User.first_or_create(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  it 'has a content' do
    message = Message.new(
      content: '',
      user: current_user,
      views: 0
    )
    expect(message).to_not be_valid
    message.content = 'Has a content'
    expect(message).to be_valid
  end
  it 'has a content between 2 and 255 chars' do
    message = Message.new(
      content: '',
      user: current_user,
      views: 0
    )
    expect(message).to_not be_valid
    message.content = 'aa'
    expect(message).to be_valid

    message_255_chars = "ivsJ85tZomsRzANA5Cr0FvCcNQ9TcKnx4W7GKTAeeaJrnxxrZ7XtbuBho2hAaILVrNAHkgCUjpyMZrZDnH0mMRJ5kco2zfZe3uFKlpx7eN5FEJwItmxqRFBgPvP9FiKZJLfF5Ym2YywDM6LveltN7c864oOV86xCtQt6FfG1FFO7eCC0Dsz0CejU5tu83dix86HvuNDeyed8G58P8tIbaMZ5gDX2FcLv11aS6dcHwev1UvjuJeOnoVPVsWRO5gV"
    message.content = message_255_chars
    expect(message).to be_valid

    message.content = message_255_chars + '1'
    expect(message).to_not be_valid
  end

    it 'has numerical views' do
    message = Message.new(
      content: 'A valid content',
      user: current_user,
      views: 0
    )
    expect(message.views).to be_a(Integer)
  end

end
