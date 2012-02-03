Soxy - Quick and easy SOCKS proxy managment
===========================================
Created by, [Chris Kankiewicz](http://www.ChrisKankiewicz.com)
& [Charles Bock](http://www.blastwavelabs.com)


Installation
------------
Download Soxy and extract the `soxy` file to your machine.

Open the `soxy` file and edit the following lines for your configuration:

    REMOTE_USER='USER'
    REMOTE_HOST='HOSTNAME'
    REMOTE_PORT='22'
    
    LOCAL_PORT='1080'

Make the `soxy` file executable by running:

    chmod +x /path/to/soxy

Add a bash alias by adding the following to `~/.bash_aliases`:

    alias soxy='/path/to/soxy'
    
If you haven't already, you will also need to generate an RSA key pair with the
following command:

    ssh-keygen -t rsa -C "<your_hostname>"

Now copy your public key to the remote host with the following command:

    ssh-copy-id user@example.com


Client Setup
------------
After completing the "Installation" steps, start the SOCKS connectsion with the
following command:

    soxy start
    
### Gnome

From a Gnome environment, navigate to System -> Preferences -> Network Proxy.
From here, select _Manual proxy configuration_. For _Socks host_ enter
`localhost`, and enter the port you used (default is `1080`).

### Firefox

From the Firefox menu navigate to Preferences -> Advanced -> Network (tab) then
under the Connection heading click on the Settings button. In the menu that pops
up select _Manual proxy configuration_. Now set the _SOCKS Host_ to `localhost`
and the coresponding _Port_ to the port you specified (default is `1080`).

### Chrome

Chrome does not currently have a way to configure specific proxy setting but
will use the system proxy settings instead.


Run on Start Up (Gnome)
----------------------
You can configure Soxy to start at boot by adding it to Startup Applications in 
Gnome.  Navigate to `System -> Preferences -> Startup Applications` and click
the Add button.  Give this a name, anything will do, then for Command put
`/path/to/soxy start` and hit the Add button.

Now, whenever you log in for the first time, Soxy should automatically start a
SOCKS connection for you.


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


Contact
-------
If you have any questions or comments, please email me at:
[Chris@ChrisKankiewicz.com](mailto:Chris@ChrisKankiewicz.com)

To report a bug, visit the issue tracker on Github at:
https://github.com/PHLAK/Soxy/issues


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

