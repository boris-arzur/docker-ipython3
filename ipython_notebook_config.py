c = get_config()
# Kernel config
c.IPKernelApp.pylab = 'inline'  # if you want plotting support always

# Notebook config
c.NotebookApp.certfile = "/home/ipy/cert.pem"
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.password = 'sha1:4473daa0b927:30500fb5e8b8fe08113793b4086f188da128bf63'
c.NotebookApp.port = 8888
