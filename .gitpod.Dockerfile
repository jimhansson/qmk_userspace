# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
FROM gitpod/workspace-full:2024-07-14-17-19-51

# Install custom tools, runtime, etc.
RUN sudo install-packages gcc-arm-none-eabi \
                          gcc-avr \
                          avr-libc \
                          avrdude \
                          dfu-programmer \
                          dfu-util
RUN python3 -m pip install --user qmk && pyenv rehash
RUN pyenv shims
RUN qmk config user.qmk_home=/workspace/qmk_firmware
RUN qmk config user.qmk_overlay=/workspace/qmk_userspace

