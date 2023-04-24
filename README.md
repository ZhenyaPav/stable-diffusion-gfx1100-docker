# stable-diffusion-gfx1100-docker
A way to use Stable Diffusion without having to compile Torch

This solution is based on the file provided here https://gist.github.com/In-line/c1225f05d5164a4be9b39de68e99ee2b

Before running `docker-compose up --build`, you have to clone the SD repo on the host:

`git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui` 

or change the docker-compose.yml to only share the subfolders:
```
    volumes:
      - ./models:/SD/stable-diffusion-webui/models/  
      - ./repositories:/SD/stable-diffusion-webui/repositories/ 
      - ./extensions:/SD/stable-diffusion-webui/extensions/
      - ./outputs:/SD/stable-diffusion-webui/outputs/
```
