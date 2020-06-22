#!/bin/bash

declare -A stock_prices_time

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

function profit_time_finder {
	
	buy_price=$1
	sell_price=$2
	profit=$3
 
	for i in "${!stock_prices_at_time[@]}"
	do
		if [ ${stock_prices_at_time[$i]} -eq $buy_price ]; then
			for j in "${!stock_prices_at_time[@]}"
			do
				if [ ${stock_prices_at_time[$j]} -eq $sell_price ]; then
					profit_counter=$(( ${stock_prices_at_time[$j]} - ${stock_prices_at_time[$i]} ))
                    if (( profit_counter == profit )); then
						#set the min max
						min_time=$i
						max_time=$j
                        echo "max min time "$min_time" "$max_time 
 		                echo 1
	                fi
				fi
			done
		fi
	done
}

find_time=$(profit_time_finder 5 11 6)

echo "max min time "$min_time" "$max_time 