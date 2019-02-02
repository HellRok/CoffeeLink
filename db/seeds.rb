(1..5).each do |i|
  team = Team.create(
    slack_id: SecureRandom.hex(4),
    domain: Faker::Company.name.downcase
  )

  puts "#{team.domain} - #{team.obfuscated_id}"

  (1..10).each { |j|
    Bean.create(
      team: team,
      name: Faker::Coffee.blend_name
    )
  }

  (1..10).each { |j|
    User.create(
      team: team,
      slack_id: SecureRandom.hex(4),
      name: Faker::Internet.email.split('@').first
    )
  }

  (1..10).each { |j|
    Purchase.create(
      user: User.all.sample,
      bean: Bean.all.sample,
      weight: [100, 250, 500].sample,
      price_cents: [2000, 2500, 3000].sample,
      created_at: (1..10).map(&:days).map(&:from_now).sample
    )
  }
end
