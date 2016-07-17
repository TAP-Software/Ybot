#!/bin/bash

erl -remsh ybot@$(hostname) -name ybot_$RANDOM@$(hostname)
