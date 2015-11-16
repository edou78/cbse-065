#Computer Networking



&lt;hr/&gt;



| **Content** |  Computer Networking Network Topologies, TCP/IP addressing, MAC, Switched Network, Packet Networks |
|:------------|:---------------------------------------------------------------------------------------------------|
| **Team**    | Abhishek Gangwar                                                                                   |
| **Discussion Page** | http://groups.google.com/group/cbse065/browse_thread/thread/f87259640b4b0edd#                      |
| **Changes** | http://code.google.com/p/cbse-065/source/diff?path=/wiki/module16.wiki&format=side&r=-1            |



&lt;hr/&gt;





# Computer Networking and Network Topologies #


Computer networking is basically connecting computer devices for the purpose of data transmission among them. The devices can be linked to each other in many different ways. The layout of connected devices is called Network Topology. Here we will learn the different standard ways (topologies) to connect the computers.
Basic types of topologies:


  * Bus
  * Ring
  * Star
  * Tree
  * Mesh



## Bus Topology (Linear Bus Topology) ##



All the computers are connected to a single cable through some connector.  The cable is terminated at both the ends with some special terminators whose job is to absorb the electrical signal so it won't reflect back to where it came from. During the data transmission, the source computer adds the intended recipient's address with the data. The data travels in both the directions of cable to all the connected machines but it is only accepted by machine whose address matches the intended address for the data.

![http://farm3.static.flickr.com/2788/4267626111_4c21b3aed8.jpg](http://farm3.static.flickr.com/2788/4267626111_4c21b3aed8.jpg)


**Advantages**

  * Bus topology requires only one cable hence it is easy to install and requires less cable.
  * Easy to connect a computer or peripheral to a linear bus.

**Disadvantages**
  * Good for small network of 2-5 devices. More computers decrease the performance and available bandwidth of the network.
  * If the cable damages anywhere in its path the entire network shuts down.
  * Terminators are required at both ends of the backbone cable.
  * Difficult to identify the problem if the entire network shuts down.



## Ring Topology ##

Every computer is connected to two other neighboring computers. Hence all the computers are connected to single circle of cable (ring) and there are no terminating ends like in bus topology. The data travels through ring in one direction either clockwise or anticlockwise and passes through each computer, which also acts as a repeater and forwards it to next.

![http://farm5.static.flickr.com/4071/4268392576_0780bee0f6.jpg](http://farm5.static.flickr.com/4071/4268392576_0780bee0f6.jpg)

**Advantages-**
  * The signals pass through all the intermediate nodes. There is no need of any kind of central server to manage.

**Disadvantages-**
  * A node failure or cable break can cause the entire network to fail.
  * Network performance is affected if there is change in nodes.


## Star Topology ##

All the computers are connected to the central device that may be hub, switch or router. All the data transfer happens through this central device only. This central device also works as repeater for the data flow.

![http://farm5.static.flickr.com/4007/4268392574_1c4c987f3a.jpg](http://farm5.static.flickr.com/4007/4268392574_1c4c987f3a.jpg)

**Advantages-**
  * Easy to install and wire.
  * No disruptions to the network then connecting or removing devices.
  * Easy to detect faults and to remove parts.
  * Due to its centralized nature, the topology offers simplicity of operation.

**Disadvantages-**
  * If the central device fails, the entire network goes down.
  * Requires more cable length than a linear topology.
  * Additional cost of central device.



## Tree Topology ##

Tree topology is the combination of bus topology and star topology. In it hub devices are connected to the bus cable and computers are connected to these hubs. It is very easy to expand the network in this approach.

![http://farm5.static.flickr.com/4057/4268392572_648498509b.jpg](http://farm5.static.flickr.com/4057/4268392572_648498509b.jpg)

**Advantages-**
  * Point-to-point wiring for individual segments.
  * Supported by several hardware and software venders.

**Disadvantages-**

  * Overall length of each segment is limited by the type of cabling used.  If the backbone line breaks, the entire segment goes down.
  * More difficult to configure and wire than other topologies.



## Mesh Topology ##

In mesh topology each computer on the network connects to every other, creating a point-to-point connection between every device on the network. This approach provides redundancy, if one link is down; there is always an alternative path between the computers.

![http://farm5.static.flickr.com/4050/4268392578_0851e93828.jpg](http://farm5.static.flickr.com/4050/4268392578_0851e93828.jpg)

**Advantages-**

  * Transmission of data from one node to many other nodes at the same time.
  * High level of privacy and security


**Disadvantages-**
  * Huge amount of cable required.
  * Many redundant connections




## Summary ##

Understanding the concept of Topology is very useful in understanding and troubleshooting network problems. There are many things which can be considered while designing network. Some of them are-


**Money-** A bus network may be the cheapest way to create a network because there is only one cable and no added cost of central hub etc.


**Cable Length-** The bus network requires shorter lengths of cable.

**Scalability-** Star network is very easy to extend by adding more central hubs.

**Cable type-** The most common cable in homes/schools is unshielded twisted pair (UTP).