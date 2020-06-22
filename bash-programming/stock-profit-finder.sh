#!/bin/bash

: '
A stock price is measured hourly from 9 AM to 6 PM and the prices for each hour is listed in stock_prices array.
This bash script derives maximum possible profit.

run the script as:
sh stock-profit-finder.sh
set the below stock_prices variable to the value you need.
'

stock_prices=(10 8 7 9 5 7 10 11 10 8)

# populate associated array for stock price at time.
time=9
count=0
while [ $time -le 18 ]
do
	stock_prices_at_time[$time]=${stock_prices[$count]}
    count=$(( $count + 1 ))
    time=$(( $time + 1 ))
done

#Sort the stock prices.
declare -a sorted_stock_prices
sorted_stock_prices=($(tr ' ' '\n' <<<"${stock_prices[@]}" | sort -n))
echo "Sorted stock prices:"
echo ${sorted_stock_prices[@]}
echo "############"

min_time=0
max_time=0
max_profit=0
start_price=0
end_price=0


sorted_array_count=0
while [ $sorted_array_count -le 8 ]
do
	# nested while loop from reverse
	from_end_count=9
	while [ $from_end_count -gt $sorted_array_count ]
		do
			#count possible profit ( sell - buy )
			possible_profit=$(( ${sorted_stock_prices[$from_end_count]} - ${sorted_stock_prices[$sorted_array_count]} ))
			
			# move forward if possibleprofit > max profit else continue:
			if [ $possible_profit -gt $max_profit ]
			then
				#initialize
				buy_price=${sorted_stock_prices[$sorted_array_count]}
				sell_price=${sorted_stock_prices[$from_end_count]}
 
				for i in "${!stock_prices_at_time[@]}"
				do
					if [ ${stock_prices_at_time[$i]} -eq $buy_price ]; then
						for j in "${!stock_prices_at_time[@]}"
						do
							if [ ${stock_prices_at_time[$j]} -eq $sell_price ]; then
								if (( j > i )); then # buy time should be less then sell.
									profit_counter=$(( ${stock_prices_at_time[$j]} - ${stock_prices_at_time[$i]} ))
									if (( profit_counter == possible_profit )); then
										#set the min max
										min_time=$i
										max_time=$j
										max_profit=$possible_profit
									fi
								fi
							fi
						done
					fi
				done

				# reset
				buy_price=0
				sell_price=0
			fi
			from_end_count=$(( $from_end_count - 1 ))
		done
	sorted_array_count=$(( $sorted_array_count + 1 ))
done
echo "\n"
echo "Buy time: "$min_time
echo "Sell time: "$max_time
echo "Max profit: "$max_profit
echo "Maximum possible profit, buying at: "$min_time":00 and selling at: "$max_time":00 is , : "$max_profit



