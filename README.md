Soxy - Quick and easy SOCKS proxy managment
===========================================
Created by, [Chris Kankiewicz](http://www.ChrisKankiewicz.com) & [Charles Bock](http://www.blastwavelabs.com)


Installation
------------
Copy or symlink the `soxy` file to /home/<your_user>/bin/soxy and make sure it's
executable by running:

    chmod +x /home/<your_user>/bin/soxy
    
If you haven't already, you will also need to generate an RSA key pair with the
following command:

    ssh-keygen -t rsa -C "<your_hostname>"
    
Once complete copy the contents of `/home/<your_user>/.ssh/id_rsa.pub`.

Now log into your proxy server and paste what you just copied into 
`/home/<server_user>/.ssh/authorized_keys`. Also make sure the `authorized_keys`
file permissions are set to `600`.


Usage
-----

**Start the SOCKS connection**

    soxy start
    
**Stop the SOCKS connection**
    
    soxy stop
    
**Restart the SOCKS connection (stops then starts)**
    
    soxy restart
    
**Get the status of the SOCKS connection**
    
    soxy status
    

Run on startup
--------------

You can configure Soxy to start at boot by adding it to Startup Applications in 
Gnome.  Navigate to `System -> Preferences -> Startup Applications` and click
the Add button.  Give this a name, anything will do, then for Command put
`/home/<your_user>/bin/soxy start` and hit the Add button.

Now, whenever you log in for the first time, Soxy should automatically start a
SOCKS connectiono for you.    


Contact
-------
If you have any questions or comments, please email me at: [Chris@ChrisKankiewicz.com](mailto:Chris@ChrisKankiewicz.com)

To report a bug, visit the issue tracker on Github at: https://github.com/PHLAK/Soxy/issues


License
-------
**Copyright (c) 2011 Chris Kankewicz & Charles Bock**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

