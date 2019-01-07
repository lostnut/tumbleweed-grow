#!/bin/bash
if [ $CC = "gcc" ]
then
        make cov
        bash <(curl -s https://codecov.io/bash)
fi

