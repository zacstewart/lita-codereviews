require 'spec_helper'

describe Lita::Handlers::CodeReview, lita_handler: true do
  it { routes(%{Lita: I am on the team "The Junto"}).to(:add_to_team) }
  it { routes(%{Lita: I'm on the team "The Junto"}).to(:add_to_team) }
  it { routes(%{Lita: Brandon Beacher is on the team "The Junto"}).to(:add_to_team) }

  it { routes('Lita: code reviews').to(:list_reviews) }

  it { routes('who am I reviewing?').to(:show_reviewee) }
  it { routes('who is Jordan Killpack code reviewing?').to(:show_reviewee) }

  it { routes('who is code reviewing me?').to(:show_reviewer) }
  it { routes("who's reviewing me?").to(:show_reviewer) }
  it { routes('who is reviewing Kurt Nelson?').to(:show_reviewer) }

  describe '#add_to_team' do
    it 'adds you to a team' do
      send_message "I am on the team The Junto"
      expect(replies.last).to eq('You are now on The Junto')
    end

    it "doesn't mind if you use contractions" do
      send_message "I'm on the team The Junto"
      expect(replies.last).to eq('You are now on The Junto')
    end

    it 'adds others to a team' do
      send_message 'Brandon Beacher is on The Junto'
      expect(replies.last).to eq('Brandon Beacher is now on The Junto')
    end
  end

  describe '#list_reviews' do
    before do
      send_message 'Brandon Beacher is on The Junto'
      send_message 'Daniel Rice is on The Junto'
      send_message 'Don Pottinger is on The Junto'
    end

    it 'lists all the reviews for the week' do
      send_message 'code reviews'
      expect(replies.last).to eq(<<-EOS.chomp)
Brandon Beacher is reviewing Daniel Rice
Daniel Rice is reviewing Don Pottinger
Don Pottinger is reviewing Brandon Beacher
      EOS
    end
  end

  describe '#show_reviewee' do
    before do
      send_message 'Blithe Roacher is on The Junto'
      send_message 'Kurt Nelson is on The Junto'
      send_message 'I am on The Junto'
    end

    it "tells you who you're reviewing" do
      send_message 'who am I reviewing?'
      expect(replies.last).to eq('you are code reviewing Blithe Roacher')
    end

    it 'tells you who someone else is reviewing' do
      send_message 'who is Blithe Roacher reviewing?'
      expect(replies.last).to eq('Blithe Roacher is code reviewing Kurt Nelson')
    end
  end

  describe '#show_reviewer' do
    before do
      send_message 'Don Pottinger is on The Junto'
      send_message 'Jordan Killpack is on The Junto'
      send_message 'I am on The Junto'
    end

    it "tells you who's reviewing you" do
      send_message "who's reviewing me?"
      expect(replies.last).to eq('Don Pottinger is reviewing you')
    end

    it 'tells you who is reviewing anyone' do
      send_message 'who is reviewing Don Pottinger?'
      expect(replies.last).to eq('Jordan Killpack is reviewing Don Pottinger')
    end
  end

end
