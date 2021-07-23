#########################################################################
# File Name:    stress_test_start.sh
#> Author:        hengzhu
#> Created Time:  2021/4/21
#########################################################################
#!/bin/bash
g++ stress-test/stress_test.cpp -o ./bin/stress  --std=c++11 -pthread  
./bin/stress
