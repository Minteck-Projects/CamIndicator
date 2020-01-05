# CamIndicator, parce que vous devez savoir QUI utilise votre webcam
## Installation
```
git clone https://gitlab.com/minteck-projects/miscellanous/camindicator.git
sudo ./config.sh
sudo ./init.sh start
```
Vous ne pouvez pas exécuter CamIndicator en tant qu'utilisateur normal, il est destiné à être exécuté en tant que `root`.

Le processus d'installation (`config.sh`) crééra un nouvel utilisateur `camindicator` (UID 800) sur votre système. Si un utilisateur avec le même UID est déjà présent, veuillez le supprimer ou en changer l'UID avant d'installer CamIndicator.
