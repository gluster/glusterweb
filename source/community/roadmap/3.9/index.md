# GlusterFS 3.9 Planning

3.9 release should get branched on 31-Aug-2016, with its General Availability release 15 days later.


### Throttling xlator
* **Owners**:
  Ravishankar N

* **Feature page:**
  <https://github.com/gluster/glusterfs-specs/blob/master/accepted/throttling.md>

* **Tracker Bug and Patches**:
...

### Trash Improvements
* **Owners**:
  Anoop C S, Jiffin Tony Thottan

* **Feature page**:
  [Trash feature
  improvements](https://github.com/gluster/glusterfs-specs/blob/master/accepted/Trash-Improvements.md)

* **Tracker Bug and Patches**:
  * [Patches](http://review.gluster.org/#/q/topic:bug-1264849+OR+topic:bug-1264847+OR+topic:bug-1264853+OR+topic:bug-1264857)


### Kerberos for Gluster protocols
* **Owners**:
  Niels de Vos, Csaba Henk

* **Feature page:**
  <https://github.com/gluster/glusterfs-specs/blob/master/under_review/Kerberos.md>

* **Tracker Bug and Patches**:
  <https://bugzilla.redhat.com/show_bug.cgi?id=1326230>


### SELinux on Gluster Volumes
SELinux should be completely supported on a Gluster Volume. Clients that access
contents on a Gluster Volume should be able to get and set the SELinux context.
This needs to be done in such a way, that the brick processes can keep running
with their restricted context.

* **Owners**:
  Niels de Vos, Manikandan

* **Feature page:**
  [Support SELinux extended attributes on Gluster
  Volumes](https://github.com/gluster/glusterfs-specs/blob/master/accepted/SELinux-client-support.md)

* **Tracker Bug and Patches**:
  [SELinux translator to support setting SELinux contexts on files in a glusterfs
  volume](https://bugzilla.redhat.com/1318100)


### Native sub-directory mounts
Native support for sub-directory mounts for GlusterFS volumes, just like how
NFS does it.

* **Owners**:
  Kaushal M, Pranith K

* **Feature page:**
  <https://github.com/gluster/glusterfs-specs/blob/master/under_review/subdirectory-mounts.md>
  - _To be moved to accepted after more cleaning_

* **Tracker Bug and Patches**:
  [Bug 892808](https://bugzilla.redhat.com/show_bug.cgi?id=892808)


### RichACL support for GlusterFS
[Richacls] are an implementation of NFSv4 ACLs which has been extended by file
masks to better fit the standard POSIX file permission model. The main goal is
to provide a consistent file permission model locally as well as over various
remote file system protocols like NFSv4 and CIFS; this is expected to
significantly improve interoperability in mixed operating system environments,
both when Linux is used as a client and as a server.

* **Owners**:
  Rajesh Joseph + Volunteers

* **Feature Page**:
  * [Feature page in Gerrit](http://review.gluster.org/13791)

* **Tracker Bug and Patches**:
  [Tracker bug](https://bugzilla.redhat.com/1326233)


### Share modes / Share reservations
* **Owners**:
  Raghavendra Talur + Poornima G, Soumya Koduri, Rajesh Joseph, Anoop C S

* **Feature Page**:
  * [Feature page in Gerrit](http://review.gluster.org/13780)
  * [Design](http://review.gluster.org/13779)

* **Tracker Bug and Patches**:
  [Gluster should provide "share mode"/"share reservation" support](https://bugzilla.redhat.com/1263231)


### Integrate with external resource management software
Gluster should have an operating mode whereby it does not do any management or
configuration of external services like NFS-Ganesha or Samba. This is to
facilitate integration with things like [storhaug], a Pacemaker-based HA
solution for clustered storage platforms.

* **Owners**:
  Kaleb Keithley, Jose Rivera

* **Feature Page**:
  * [Feature page in Gerrit](http://review.gluster.org/13888)

* **Tracker Bug and Patches**:
  ...


### Python Wrappers for Gluster CLI Commands
* **Owners**:
  Aravinda VK

* **Feature Page**:
...

* **Tracker Bug and Patches**:
http://review.gluster.org/#/c/14951/

### Management REST APIs
* **Owners**:
Aravinda VK

* **Feature Page**:
http://review.gluster.org/13214

* **Tracker Bug and Patches**:
...

### Events APIs
* **Owners**:
Aravinda VK

* **Feature Page**:
http://review.gluster.org/13115

* **Tracker Bug and Patches**:
http://review.gluster.org/14248

### CLI to get state representation of a cluster from the local glusterd pov
* **Owners**:
Samikshan Bairagya

* **Feature Page**:
http://review.gluster.org/14962

* **Tracker Bug and Patches**:
  * [CLI to get local state representation for a cluster](https://bugzilla.redhat.com/show_bug.cgi?id=1353156)
  * [Patch on gerrit](http://review.gluster.org/14873)

[Admin Guide]: ...
[Richacls]: http://www.bestbits.at/richacl/
[Storhaug]: https://github.com/linux-ha-storage/storhaug
