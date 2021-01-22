# Install

if you need to specify a install directory, set the `INSTALL_DIR` variable.

```shell
INSTALL_DIR=/root/.nsloop(this path should not exist!)
export INSTALL_DIR
```

or just run:

```shell
wget https://github.com/tanganke/nsloop_install/releases/download/0.1/nsloop_install.sh -O /tmp/nsloop_install.sh
sudo bash /tmp/nsloop_install.sh 'xxxx-xxxx-xxxx-xxxx(your token)'
```

## Check

```shell
sudo systemctl status nsloop
```
