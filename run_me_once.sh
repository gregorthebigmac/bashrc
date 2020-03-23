#!/bin/bash

apt-get update \
&& apt upgrade -y \
&& apt autoremove -y \
&& apt-get install -y curl \
&& apt-get install -y git \
&& reboot
