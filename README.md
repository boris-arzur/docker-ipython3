docker-ipython3
===============

ipython3 like I want it with an example d3.js visualization / interact

How to get it working ?
1. edit `openssl.cnf` and `ipython\_notebook\_config.py`
2. `sh build.sh`
3. `sh launch.sh` or go to step 5
4. you can connect to 0.0.0.0:4443, your password is in `new\_password.sh`
5. I encourage you to generate a new password with `sh new\_password.sh` and to put it in `ipython\_notebook\_config.py`. If you wish to do so, change the line with `c.NotebookApp.password` and rebuild the image.
