describe MovieInfoMailer do
  let!(:movie) { create :movie }
  let!(:user) { create :user }
  it "adds up to deliveries" do
    expect do
      described_class.send_info(user, movie).deliver_now
    end.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end
