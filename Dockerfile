FROM cromefire/pytorch-gfx1100:latest

RUN mkdir /SD

# Clone SD
WORKDIR /SD
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
WORKDIR /SD/stable-diffusion-webui
RUN git reset --hard 22bcc7be428c94e9408f589966c2040187245d81

RUN apt update && apt install python3.8-venv

# Activate VENV
ENV VIRTUAL_ENV=/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3 -m pip install --upgrade pip wheel
WORKDIR /SD/stable-diffusion-webui

EXPOSE 7860/tcp

# Fix for "detected dubious ownership in repository" by rom1win.
RUN git config --global --add safe.directory '*'
CMD python3 launch.py --no-half-vae --listen
