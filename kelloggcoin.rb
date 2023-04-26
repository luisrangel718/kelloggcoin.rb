blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

def calculate_balances(blockchain)
    balances = {}

    blockchain.each do |transaction|
        from_user = transaction["from_user"]
        to_user = transaction["to_user"]
        amount = transaction["amount"]

        if !from_user.nil?
            balances[from_user] = 0 unless balances.key?(from_user)
            balances[from_user] -= amount
        end

        balances[to_user] = 0 unless balances.key?(to_user)
        balances[to_user] += amount
    end

    balances
end

balances = calculate_balances(blockchain)

balances.each do |user, balance|
    puts "#{user.capitalize}'s KelloggCoin balance is #{balance}"
end
