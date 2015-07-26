Soxy - Quick and easy SOCKS proxy management
===========================================
Created by, [Chris Kankiewicz](http://www.ChrisKankiewicz.com)
& [Charles Bock](http://www.blastwavelabs.com)


Configuration
-------------

Download Soxy and extract the `soxy` file to your machine.

Copy the provided `config.sample` file to `~/.soxy/config` and edit it for your configuration:

    REMOTE_USER=your_username
    REMOTE_HOST=target_hostname
    REMOTE_PORT=22

    LOCAL_PORT=1080

    AUTO_RECONNECT=false

Make the `soxy` file executable by running:

    chmod +x /path/to/soxy


Installation
------------

Add a bash alias by adding the following to `~/.bash_aliases`:

    alias soxy='/path/to/soxy'

If you haven't already, you will also need to generate an RSA key pair with the
following command:

    ssh-keygen -t rsa -C "<your_hostname>"

Now copy your public key to the remote host with the following command:

    ssh-copy-id user@example.com

You can now start the SOCKS proxy connection with the following command:

    soxy start


Client Setup
------------

### Ubuntu

Navigate to [Gear Icon] -> System Settings -> Network. Select _Network proxy_ from
the left hand menu.  Under the _Method_ drop-down box, select `Manual`.  For
_Socks Host_ enter `localhost`, and enter the port you used (default is `1080`).


### Firefox

From the Firefox menu navigate to Preferences -> Advanced -> Network (tab) then
under the _Connection_ heading click on the _Settings_ button. In the menu that pops
up select _Manual proxy configuration_. Now set the _SOCKS Host_ to `localhost`
and the corresponding _Port_ to the port you specified (default is `1080`).

Additionally, you can enable DNS request proxying in Firefox as well.  To do so
enter `about:config` into the address bar and hit go.  If you get a warning
about voiding your warranty don't panic, simply hit the _I'll be careful, I
promise!_ button to continue.  Now enter `network.proxy.socks_remote_dns` into
the _Filter_ input box and double click the corresponding result to change the
_Value_ from `false` to `true`.


### Chrome

You can use this great Plugin: [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif)

It's also possible to define black/white lists based on URL patterns and
control exactly which route should be used (multiple proxies possible + direct).


Run on Start Up (Ubuntu)
------------------------
You can configure Soxy to start at boot by adding it to Startup Applications in
Ubuntu.  Navigate to [Gear Icon] -> Startup Applications and click the Add
button.  For name enter "Soxy", then for Command put `/your/path/to/soxy start`
and hit the Add button.

Now, whenever you first log into your system, Soxy will automatically start a
SOCKS connection for you.


Cron job to check the connection periodically and re-connect
-----------------------------------------------------------
User cron jobs can be defined with `crontab -e` on most linux distributions. A
possible setup could look like this:
````
  ## run every 10 minutes
  */10 * * * * soxy status
````
Make sure the script is in your `$PATH` or specify the path in the cron job.

If you want the script to attempt a re-connect as soon as the `soxy status`
tells you that the connection is gone, you can set `AUTO_RECONNECT=true` in
your `~/.soxy/config`.


Usage
-----
**Start the SOCKS connection**

    soxy start

**Stop the SOCKS connection**

    soxy stop

**Restart the SOCKS connection (stops then starts)**

    soxy restart

**Get the status of the SOCKS connection (and try to re-connect if `AUTO_RECONNECT=true`)**

    soxy status


Contact
-------
If you have any questions or comments, please email me at:
[Chris@ChrisKankiewicz.com](mailto:Chris@ChrisKankiewicz.com)

To report a bug, visit the issue tracker on Github at:
https://github.com/PHLAK/Soxy/issues


License
-------
**Copyright (c) 2013 Chris Kankewicz & Charles Bock**

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
