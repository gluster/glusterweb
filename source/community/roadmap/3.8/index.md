# Release Schedule

Date             | Task/event
-----------------|------------------------------------------------------------
...              | get requirements addressed, see below for details
30 April 2016    | branch release-3.8, start disabling/removing incomplete features
beginning of May | first beta release
weekly(?) in May | more beta releases, fix bugs, documents known issues
end of May, June | GA (General Availability) release of 3.8
monthly after GA | bugfix releases, improvements to experimental features


# Feature Requirements

All of these requirements need to be done at the point of the branching for 3.8
(see schedule above). When a feature does not address all requirements, it will
be removed from the `release-3.8` branch immediately after branching. This also
counts for features that are proposed as **experimental**.

* **Feature page and technical design**

  Documents merged and moved to the `accepted/release-3.8` directory in the
  [glusterfs-specs repository].

  Source code documentation and implementation details (structures, code-flow,
  ...) should be in the main [glusterfs repository].

* **Source code changes**

  Code changes need to be reviewed and merged. Also a tracker bug that contains
  links to related changes is highly recommended. Tracker bugs for a feature
  should block the [3.8.0 release tracker][glusterfs-3.8.0].

* **Maintainer**

  One or two maintainers for this change need to be listed in the
  [`MAINTAINERS`][MAINTAINERS] file in the sources. This requires least one
  experienced maintainer, possibly one additional 'new' maintainer. All
  maintainers accept the responsibilities that are documented in the
  [Guidelines for maintainers].

* **DiSTAF testcases**

  New features should add testcases for distributed testing with [DiSTAF]. Our
  regresion-tests are running on a single server environment only, DiSTAF makes
  it possible to coordinate testing over multiple systems. Periodic testing
  with DiSTAF is a feature by itself, the developers working on this can be
  contacted for assistance.

* **Release notes**

  Once branched, the included features will need to provide one or more
  paragraphs for the release notes. These can be prepared in advance, there is
  no need to wait for the last minute.

  **Experimental features** should have additional descriptions in the release
  notes about the reason for being in this state and current limitations. Extra
  steps that a user needs to do for enabling need to be included as well (or
  point to the [documentation][Admin Guide]).

* **User Documentation**

  Each feature will need to add contents to the [Admin Guide]. This should
  explain in a user understandable way what the feature should be used for, and
  how admins and users need to configure it.

* **Integration and Eco-system**

  Some features add functionality on top of the Gluster filesystem and/or
  management framework itself. These features are expected to provide usable
  example applications as part of their project.

  Developers for add-on projects should do their best to get packages in
  different Operating System distributions. Inclusion in Fedora, EPEL and/or
  the CentOS Storage SIG are strongly recommended.

* **Advertisement**

  Informing users about the upcoming features is important for the uptake. Blog
  posts and videos should explain how a feature work and how users can configure
  and benefit from it.


# Features in Gluster 3.8

## Protocol improvements for integration with Samba, NFS and others

### Leases Support for Gluster
A file lease provides a mechanism whereby the process holding the lease (the
"lease holder") is notified when a process (the "lease breaker") tries to
perform a fop with conflicting access on the same file.

NFS Delegation (similar to lease_locks) is a technique by which the server
delegates the management of a file to a client which guarantees that no client
can open the file in a conflicting mode.

Advantages of these locks is that it greatly reduces the interactions between
the server and the client for delegated files.

This feature now also provides the support to grant or process these
leases/delegations for the files.

* **Status**:
  (11-March-2016) Patches under review.

* **Owners**:
  Poornima G, Soumya Koduri, Rajesh Joseph, Raghavendra Talur

* **Feature Page**:
  **TODO**: move [old wiki
  page](http://www.gluster.org/community/documentation/index.php/Features/Upcall-infrastructure#delegations.2Flease-locks)
  to [glusterfs-specs].

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


### Converged HA for NFS-Ganesha and Samba
Integration with [Storhaug], a Pacemaker-based HA solution for clustered
storage platforms.

* **Status**:
  (13-March-2016) New upstream project, needs integration, packaging and testing.

* **Owners**:
  Kaleb Keithley, Jose Rivera

* **Feature Page**:
  ...

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


### Mandatory lock support for Multiprotocol environment
POSIX.1 does not specify any scheme for mandatory locking. Whereas Linux kernel
provide support for mandatory locks based on file mode bits which is explained
at [https://www.kernel.org/doc/Documentation/filesystems/mandatory-locking.txt].
But the proposed feature does not adhere completely to the semantics described
by linux kernel. Instead we enforce core mandatory lock semantics at its byte
range granularity level as detailed below without the help of file mode bits.

* **Status**:
  (11-March-2016) Patches posted by Anoop, need review etc.

* **Owners**:
  Anoop C S, Rajesh Joseph, Poornima G, Raghavendra Talur

* **Feature Page**:
  https://review.gluster.org/#/c/12014/

* **Tracker Bug and Patches**:
  https://review.gluster.org/#/q/topic:bug-762184

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


### RichACL support for GlusterFS
[Richacls] are an implementation of NFSv4 ACLs which has been extended by file
masks to better fit the standard POSIX file permission model. The main goal is
to provide a consistent file permission model locally as well as over various
remote file system protocols like NFSv4 and CIFS; this is expected to
significantly improve interoperability in mixed operating system environments,
both when Linux is used as a client and as a server.

* **Status**:
  (8-March-2016) Userspace `richacl` package is in Fedora, Rajesh has POC
  xlator, needs heavy cleanup and further development.

* **Owners**:
  Rajesh Joseph + Volunteers

* **Feature Page**:
  http://www.gluster.org/community/documentation/index.php/Features/RichACL

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


### Share modes / Share reservations
***TODO***: add summary

* **Status**:
  (11-March-2016) Raghavendra Talur has proof on concept patches, need cleanup
  and posting.

* **Owners**:
  Raghavendra Talur + Poornima G, Soumya Koduri, Rajesh Joseph, Anoop C S

* **Feature Page**:
  ...

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


### Samba and NFS-Ganesha support for tiered volumes
Both Samba and NFS-Ganesha require improvements for supporting Tiered Volumes.

* **Status**:
  (13-March-2016) *unknown*

* **Owners**:
  Dan Lambright

* **Feature Page**:
  ...

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


### Gluster/NFS disabled by default
Gluster/NFS does not compete with more current NFS-servers anymore. Only NFSv3
is available, and other features that are expected from NFS-servers are
difficult to implement. NFS-Ganesha is a good replacement for Gluster/NFS. It
becomes time to announce the deprecation of Gluster/NFS so that users start to
look at other more serious solutions.

* **Status**:
  (13-March-2016) Planned.

* **Owners**:
  Kaleb Keithley, Niels de Vos

* **Feature page:**
  ...

* **Tracker Bug and Patches**:
  ...

* **Maintainer**
  Existing maintainer for Gluster/NFS.

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


### SEEK
***TODO***: add summary

* **Status**:
  (13-March-2016) Patches for Gluster merged, Linux kernel FUSE module merged
  (linux-4.5), QEMU under review, NFS-Ganesha unposted POC.

* **Owners**:
  Niels de Vos, Ravishankar

* **Feature page:**
  ...

* **Tracker Bug and Patches**:
  [SEEK_HOLE support
  (optimization)](https://bugzilla.redhat.com/show_bug.cgi?id=1220173)
  [Changes in Gerrit](http://review.gluster.org/#/q/topic:bug-1220173)
  [FUSE module](http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/fs/fuse?id=0b5da8db145bfd44266ac964a2636a0cf8d7c286)

* **Maintainer**
  Existing protocol and xlator maintainers.

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


## Quota Enhancements

### Enhance Quota enable/disable in glusterd
***TODO***: add summary

* **Status**:
  (8-March-2016) Patches under review.

* **Owners**:
  Vijaikumar, Manikandan

* **Feature Page**:
  ...

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


## Geo-replication

### Geo-replication for Sharded Volumes
***TODO***: add summary

* **Status**:
  (8-March-2016) Most patches merged. Needs runtime check and documentation
  improvements.

* **Owners**:
  Aravinda, Kotresh

* **Feature Page**:
  ...

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


### Tiering aware Geo-replication
***TODO***: add summary

* **Status**:
  (8-March-2016) Functionality merged, could use performance improvements.

* **Owners**:
  Saravanakumar

* **Feature Page**:
  http://review.gluster.org/13515/

* **Tracker Bug and Patches**:
  http://review.gluster.org/12417 http://review.gluster.org/12355
  http://review.gluster.org/12326 http://review.gluster.org/12239

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


## Miscellaneous Enhancements

### AFR self-heal performance improvements
***TODO***: add summary

* **Status**:
  (10-March-2016) Patches posted.

* **Owners**:
  Anuradha, Krutika, Pranith, Ravi

* **Feature page**:
  http://review.gluster.org/#/c/12257

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
  (13-March-2016) Patches posted (TODO: all of them?).

* **Owners**:
  Anoop C S, Jiffin Tony Thottan

* **Feature page**:
  https://review.gluster.org/#/c/13399/

* **Tracker Bug and Patches**:
  http://review.gluster.org/#/q/topic:bug-1264849+OR+topic:bug-1264847+OR+topic:bug-1264853+OR+topic:bug-1264857

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


### Gluster Eventing
***TODO***: add summary

* **Status**:
  (8-March-2016) Patches for basic events merged.

* **Owners**:
  Aravinda VK, Samikshan

* **Feature page:**
  http://review.gluster.org/13115

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


### Periodic DiSTAF testing
***TODO***: add summary

* **Status**:
  (10-March-2016) Work in progress, partially posted to the `centos-ci`
  directory in the [patch-acceptance-tests] repository.

* **Owners**:
  MS V Bhat, Kaushal

* **Feature page:**
  ...

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


### Versioned Documentation
***TODO***: add summary

* **Status**:
  (11-March-2016) Under investigation.

* **Owners**:
  Prasanth Pai, Amye Scavarda

* **Feature page:**
  ...

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


# Eco-system

***TODO***: this paragraph needs rewriting like the features.

### Management REST APIs
***TODO***: add summary

* **Status**:
  (8-March-2016) Minimal implementation ready, docs are TODO.

* **Owners**:
  Aravinda VK

* **Feature page:**
  http://review.gluster.org/13214

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


### Glusterfind and Bareos Integration | Milind Changire | TBD | TBD | TBD |
***TODO***: add summary

* **Status**:
  (8-March-2016) Implementation ready, needs communication and testing by
  Bareos developers.

* **Owners**:
  Milind Changire

* **Feature page:**
  ...

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


### Gluster Tools
***TODO***: add summary

* **Status**:
  (8-March-2016) Implementation ready, needs docs and packaging.

* **Owners**:
  Aravinda VK

* **Feature page:**
  https://github.com/gluster/glustertool/blob/master/README.md

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


### Heketi
***TODO***: add summary - https://github.com/heketi/heketi

* **Status**:
  (11-March-2016) Under investigation.

* **Owners**:
  Luis Pabon

* **Feature page:**
  ...

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


### gdeploy packaged for Fedora and EPEL
Tool to set-up and deploy GlusterFS using ansible over multiple hosts.

gdeploy can be used to set-up the backend, create a GlusterFS volume and mount
it on one or more clients from an [ansible] installed machine. The framework
reads a configuration file and applies on the hosts listed in the configuration
file.

* **Status**:
  (7-March-2016) Under investigation.

* **Owners**:
  Sachidananda Urs, Nandaja Varma

* **Feature page:**
  ...

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


### glusterfs-coreutils packaged for Fedora and CentOS Storage SIG
***TODO***: add summary

* **Status**:
  (11-March-2016) Planning, research, learning.

* **Owners**:
  Anoop C S

* **Feature page:**
  ...

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


### Apache/mod_proxy_gluster packaged for Fedora and CentOS Storage SIG
***TODO***: add summary

* **Status**:
  (14-March-2016) Planning.

* **Owners**:
  ...

* **Feature page:**
  ...

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


# Experimental

### Kerberos for Gluster protocols
***TODO***: add summary

* **Status**:
  (12-March-2016) Design ready.

* **Owners**:
  Niels de Vos, Csaba Henk

* **Feature page:**
  http://review.gluster.org/12118

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


### Sub-directory export for native protocol
***TODO***: add summary

* **Status**:
  (10-March-2016) Proof of concept patches under review.

* **Owners**:
  Pranith Karampuri

* **Feature page:**
  ...

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


### WORM, Retention and Compliance
***TODO***: add summary

* **Status**:
  (9-March-2016) Design ready, partial proof of concept code.

* **Owners**:
  Karthik Subrahmanya

* **Feature page:**
  http://review.gluster.org/13538

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


### Throttling xlator
***TODO***: add summary

* **Status**:
  (10-March-2016) Design (mostly?) ready.

* **Owners**:
  Ravishankar

* **Feature page:**
  ...

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


### SELinux on Gluster Volumes
***TODO***: add summary

* **Owners**:
  Niels de Vos, Manikandan

* **Feature page:**
  ...

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


# Moved out to the next minor or major release

***TODO***: these features need to be moved to Gluster.next planning page.

Feature                                     | Owner(s)                           | Feature Page |
--------------------------------------------|------------------------------------|--------------|
Inotify                                     | Soumya Koduri                      | TBD          |
pNFS Layout Recall                          | Jiffin Tony Thottan, Soumya Koduri | http://review.gluster.org/#/c/12367/3/wip/pNFS-Layout-Recall.md |
iSCSI access for Gluster                    | Raghavendra Bhat, Vijay Bellur     | TBD          |
Directory/Files filters for Geo-replication | Kotresh, Aravinda                  | TBD          |
Add + Remove brick with Volume Tiering      | Dan Lambright                      | TBD          |
Volume Tiering                              | Dan Lambright                      | TBD          |
User and Group Quotas                       | Vijaikumar M, Manikandan           | TBD          |

[glusterfs-3.8.0]: https://bugzilla.redhat.com/show_bug.cgi?id=glusterfs-3.8.0
[glusterfs repository]: https://github.com/gluster/glusterfs
[glusterfs-specs repository]: https://github.com/gluster/glusterfs-specs
[patch-acceptance-tests]: https://github.com/gluster/glusterfs-patch-acceptance-tests/
[MAINTAINERS]: https://github.com/gluster/glusterfs/blob/master/MAINTAINERS
[Guidelines for maintainers]: http://gluster.readthedocs.org/en/latest/Contributors-Guide/Guidelines-For-Maintainers/
[Admin Guide]: ...
[DiSTAF]: https://github.com/gluster/distaf
[Richacls]: http://www.bestbits.at/richacl/
[Storhaug]: https://github.com/linux-ha-storage/storhaug
[ansible]: https://ansible.com/
