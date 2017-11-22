TCP is a very essential yet complex and hidden part of network communication. Understanding how it works can be tricky especially for the uninitiated.
I aim to create a TCP implementation in user-space, for Unix-like systems (linux, BSD..) that performs fully functional end-to-end communication with other existing TCP implementations which can be used as a full replacement for the default networking in userland applications.

The main aim for this project is to teach myself the inner workings of Unix networking, TCP and related topics, as well as being a valuable learning tool for those who use this to also learn about TCP and networking by giving an accessible interface to access and retrieve information from the communication layers that is normally inaccessible and hidden within the kernel.

One goal I would like to achieve from this implementation is to be able to use the stack to replace standard networking and make complete communication with a server in a simple task such as retrieving a webpage, for example using curl: `LD_PRELOAD=/usr/lib/libnetstack.so curl google.com`.

The first problem to address will be implementing a basic TCP stack implementation to make connections to other devices, using the most common branches that TCP uses, possibly over the existing IP/ethernet layers from the operating system.
As an extension to this I'd like to add UDP, ICMP, IP+routing, ARP and ethernet processing in to this to allow the capture of raw sockets as well as standard TCP connections.
From the implementation I aim to add hooks for users to be able to intercept connection data before and after processing which when paired with the (openly available) source code can be used to learn about TCP.
