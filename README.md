# BitcoinPrice
Keep track of your cryptos!

My first app, BitcoinPrice, pulls from Coin Market Cap's API to display cryptocurrenct price data.  
One big change that I need to make is to use structs for each coin instead of separate arrays of strings to hold their name and price.  
This would fix the issue I have when a new coin is added and the 1 hour and 24 hour prices return null (this is why no coins currently have 24 hour data).

Update-- I have fixed this and added a search feature in the repository "AlamofireStructs"
