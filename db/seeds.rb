# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.all.exists?
  %w[A B C D E].each do |character|
    user = User.create!(name: "User #{character}", email: Faker::Internet.email)
    md5 = Digest::MD5.new
    md5 << "#{user.name}-#{user.email}"
    hash_address = md5.hexdigest
    Wallet.create!(hash_address: hash_address, attachable: user)
  end
end

unless Team.all.exists?
  %w[A B C D E].each do |character|
    team = Team.create!(name: "Team #{character}", address: Faker::Address.street_address)
    md5 = Digest::MD5.new
    md5 << "#{team.name}-#{team.address}"
    hash_address = md5.hexdigest
    Wallet.create!(hash_address: hash_address, attachable: team)
  end
end

unless Stock.all.exists?
  %w[A B C D E].each do |character|
    stock = Stock.create!(name: "Stock #{character}", address: Faker::Address.street_address)
    md5 = Digest::MD5.new
    md5 << "#{stock.name}-#{stock.address}"
    hash_address = md5.hexdigest
    Wallet.create!(hash_address: hash_address, attachable: stock)
  end
end

unless TransactionType.all.exists?
  TransactionType.create!(transaction_type: TransactionType.transaction_types[:deposit], description: 'Deposit Transaction Type')
  TransactionType.create!(transaction_type: TransactionType.transaction_types[:withdraw], description: 'Withdraw Transaction Type')
  TransactionType.create!(transaction_type: TransactionType.transaction_types[:transfer], description: 'Transfer Transaction Type')
end

unless TransactionStatus.all.exists?
  TransactionStatus.create!(status: TransactionStatus.statuses[:failed], description: 'Failed Transaction')
  TransactionStatus.create!(status: TransactionStatus.statuses[:successfull], description: 'Sucessfull Transaction')
end
