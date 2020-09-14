#!/bin/bash

echo "$*" | awk '{print length}'

exit 0
