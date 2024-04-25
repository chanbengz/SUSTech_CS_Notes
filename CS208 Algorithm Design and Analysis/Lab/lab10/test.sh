g++ Practice1.cpp -o a --std=c++11
g++ BruteForce.cpp -o b --std=c++11
while true; do
    python3 GenerateData.py > input
    echo "Divide: "
    time ./a < input > output1
    echo "Brute: "
    time ./b < input > output2
    # ./a < input > output1
    # ./b < input > output2
    echo ""
    if diff output1 output2; then
        echo "Result: AC"
    else
        echo "Result: WA"
        break
    fi
done

rm a b input output*