# GlusterFS 3.9 Planning

It is not decided yet if there will be a GlusterFS 3.9, or if Gluster 4.0 will
be ready in time. The current (as of 5-May-2016) release cadence of 6 months
suggests that the next major release should get branched on 31-October-2016,
with its General Availability release one month later.

This page contains details of features that are attempted to get included in
the next major release. The format is taken from the [3.8 roadmap](../3.8/).


### Throttling xlator
***TODO***: add summary

* **Status**:
  (14-April-2016) High Level Design ready.

* **Owners**:
  Ravishankar N

* **Feature page:**
  <https://github.com/gluster/glusterfs-specs/blob/master/accepted/throttling.md>

* **Tracker Bug and Patches**:
  ...

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  ...

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### Trash Improvements
***TODO***: add summary

* **Status**:
  (5-May-2016) Patches posted, under review (TODO: all of them?).

* **Owners**:
  Anoop C S, Jiffin Tony Thottan

* **Feature page**:
  [Trash feature
  improvements](https://github.com/gluster/glusterfs-specs/blob/master/accepted/Trash-Improvements.md)

* **Tracker Bug and Patches**:
  * [Patches](http://review.gluster.org/#/q/topic:bug-1264849+OR+topic:bug-1264847+OR+topic:bug-1264853+OR+topic:bug-1264857)

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  ...

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### Kerberos for Gluster protocols
***TODO***: add summary

* **Status**:
  (12-April-2016) Design ready.

* **Owners**:
  Niels de Vos, Csaba Henk

* **Feature page:**
  <https://github.com/gluster/glusterfs-specs/blob/master/under_review/Kerberos.md>

* **Tracker Bug and Patches**:
  <https://bugzilla.redhat.com/show_bug.cgi?id=1326230>

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  ...

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


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

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  ...

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### DHT2
***TODO***: add summary

* **Status**:
  POC is done(?), ready to test(?)

* **Owners**:
  Shyamsundar Ranganathan, Venky Shankar

* **Feature page:**
  <http://review.gluster.org/#/c/13395/>

* **Tracker Bug and Patches**:
  ...

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  ...

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### Native sub-directory mounts
Native support for sub-directory mounts for GlusterFS volumes, just like how
NFS does it.

* **Status**:
  Design being finalized. Existing patches present.

* **Owners**:
  Kaushal M, Pranith K

* **Feature page:**
  <https://github.com/gluster/glusterfs-specs/blob/master/under_review/subdirectory-mounts.md>
  - _To be moved to accepted after more cleaning_

* **Tracker Bug and Patches**:
  [Bug 892808](https://bugzilla.redhat.com/show_bug.cgi?id=892808)

* **Maintainer**
  TBD

* **DiSTAF Testcase**:
  TODO

* **Release Notes**:
  TODO

* **User Documentation**
  TODO

* **Integration and Eco-system**
  ...

* **Advertisement**
  TODO


### RichACL support for GlusterFS
[Richacls] are an implementation of NFSv4 ACLs which has been extended by file
masks to better fit the standard POSIX file permission model. The main goal is
to provide a consistent file permission model locally as well as over various
remote file system protocols like NFSv4 and CIFS; this is expected to
significantly improve interoperability in mixed operating system environments,
both when Linux is used as a client and as a server.

* **Status**:
  (12-April-2016) Userspace `richacl` package is in Fedora, Rajesh has POC
  xlator, needs heavy cleanup and further development.

* **Owners**:
  Rajesh Joseph + Volunteers

* **Feature Page**:
  * [Feature page in Gerrit](http://review.gluster.org/13791)

* **Tracker Bug and Patches**:
  [Tracker bug](https://bugzilla.redhat.com/1326233)

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  **TODO**: Samba/NFS-Ganesha patches/proposal

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### Share modes / Share reservations
***TODO***: add summary

* **Status**:
  (20-March-2016) Raghavendra Talur has proof on concept patches, need cleanup
  and posting.

* **Owners**:
  Raghavendra Talur + Poornima G, Soumya Koduri, Rajesh Joseph, Anoop C S

* **Feature Page**:
  * [Feature page in Gerrit](http://review.gluster.org/13780)
  * [Design](http://review.gluster.org/13779)

* **Tracker Bug and Patches**:
  [Gluster should provide "share mode"/"share reservation" support](https://bugzilla.redhat.com/1263231)

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  **TODO**: Samba/NFS-Ganesha patches/proposal

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### Integrate with external resource management software
Gluster should have an operating mode whereby it does not do any management or
configuration of external services like NFS-Ganesha or Samba. This is to
facilitate integration with things like [storhaug], a Pacemaker-based HA
solution for clustered storage platforms.

* **Status**:
  (12-April-2016) New proposal

* **Owners**:
  Kaleb Keithley, Jose Rivera

* **Feature Page**:
  * [Feature page in Gerrit](http://review.gluster.org/13888)

* **Tracker Bug and Patches**:
  ...

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  **TODO**: Samba/NFS-Ganesha patches/proposal

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### Integrate with external resource management software
Gluster should have an operating mode whereby it does not do any management or
configuration of external services like NFS-Ganesha or Samba. This is to
facilitate integration with things like [storhaug], a Pacemaker-based HA
solution for clustered storage platforms.

* **Status**:
  (12-April-2016) New proposal

* **Owners**:
  Kaleb Keithley, Jose Rivera

* **Feature Page**:
  * [Feature page in Gerrit](http://review.gluster.org/13888)

* **Tracker Bug and Patches**:
  ...

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  **TODO**: Samba/NFS-Ganesha patches/proposal

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


# Miscellaneous Features

These features were proposed at one point, and developers would like to see
them implemented soonish.

Feature                                     | Owner(s)                           | Feature Page |
--------------------------------------------|------------------------------------|--------------|
Inotify                                     | Soumya Koduri                      | TBD          |
pNFS Layout Recall                          | Jiffin Tony Thottan, Soumya Koduri | <http://review.gluster.org/#/c/12367/3/wip/pNFS-Layout-Recall.md> |
iSCSI access for Gluster                    | Raghavendra Bhat, Vijay Bellur     | TBD          |
Directory/Files filters for Geo-replication | Kotresh, Aravinda                  | TBD          |
Add + Remove brick with Volume Tiering      | Dan Lambright                      | TBD          |
Volume Tiering                              | Dan Lambright                      | TBD          |
User and Group Quotas                       | Vijaikumar M, Manikandan           | TBD          |


[Admin Guide]: ...
[MAINTAINERS]: https://github.com/gluster/glusterfs/blob/master/MAINTAINERS
[Richacls]: http://www.bestbits.at/richacl/
[Storhaug]: https://github.com/linux-ha-storage/storhaug
