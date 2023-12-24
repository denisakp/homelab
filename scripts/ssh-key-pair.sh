#!/bin/bash

mkdir -p data/key-pair
cd data/key-pair
ssh-keygen -t rsa -N '' -f "$(pwd)/id_rsa"
