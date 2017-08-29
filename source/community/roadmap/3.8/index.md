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

### Mandatory lock support for Multiprotocol environment
POSIX.1 does not specify any scheme for mandatory locking. Whereas Linux kernel
provide support for mandatory locks based on file mode bits which is explained
at <https://www.kernel.org/doc/Documentation/filesystems/mandatory-locking.txt>.
But the proposed feature does not adhere completely to the semantics described
by linux kernel. Instead we enforce core mandatory lock semantics at its byte
range granularity level as detailed below without the help of file mode bits.

* **Status**:
  (12-April-2016) Patches posted by Anoop, need review etc.

* **Owners**:
  Anoop C S, Rajesh Joseph, Poornima G, Raghavendra Talur

* **Feature Page**:
  [Mandatory Locks](https://github.com/gluster/glusterfs-specs/tree/master/done/GlusterFS 3.8/Mandatory Locks.md)

* **Tracker Bug and Patches**:
  * [Patches](https://review.gluster.org/#/q/topic:bug-762184)
  * [Tracker Bug](https://bugzilla.redhat.com/762184)

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**:
  [Admin Guide](http://docs.gluster.org/en/latest/Administrator%20Guide/Mandatory%20Locks/)

* **Integration and Eco-system**
  **TODO**: Samba/NFS-Ganesha patches/proposal

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### Gluster/NFS disabled by default
Gluster/NFS does not compete with more current NFS-servers anymore. Only NFSv3
is available, and other features that are expected from NFS-servers are
difficult to implement. NFS-Ganesha is a good replacement for Gluster/NFS. It
becomes time to announce the deprecation of Gluster/NFS so that users start to
look at other more serious solutions.

* **Status**:
  (14-April-2016) In development.

* **Owners**:
  Kaleb Keithley, Niels de Vos

* **Feature page:**
  [under review in Gerrit](http://review.gluster.org/13740)

* **Tracker Bug and Patches**:
  * [patch](http://review.gluster.org/13738)
  * [Tracker bug](https://bugzilla.redhat.com/1092414)

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
  * [RFC: beginning to phase out legacy Gluster NFS, to be eventually replaces with   
    NFS-Ganesha](http://thread.gmane.org/gmane.comp.file-systems.gluster.devel/14896)


### SEEK
All modern filesystems support `SEEK_DATA` and `SEEK_HOLE` with the `lseek()`
systemcall. This functionality makes it possible to detect holes in files, so
that copies and backups of sparse files do not get the 'holes' allocated with
zero-bytes. Supporting the detection of holes in files reduces the needed
storage and network overhead when copies are made.

* **Status**:
  (20-March-2016) Patches for Gluster merged, Linux kernel FUSE module merged
  (linux-4.5), QEMU merged (2.7), Wireshark merged, NFS-Ganesha unposted POC.

* **Owners**:
  Niels de Vos, Ravishankar N

* **Feature page:**
  [Gerrit review](http://review.gluster.org/13786)

* **Tracker Bug and Patches**:
  * [SEEK_HOLE support (optimization)](https://bugzilla.redhat.com/show_bug.cgi?id=1220173)
  * [Changes in Gerrit](http://review.gluster.org/#/q/topic:bug-1220173)
  * [FUSE module](http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/fs/fuse?id=0b5da8db145bfd44266ac964a2636a0cf8d7c286)
  * [Wireshark dissector](https://code.wireshark.org/review/13780)
  * QEMU block/gluster:
    [mail](http://thread.gmane.org/gmane.comp.emulators.qemu.block/9425/focus=9491),
    [commit](https://github.com/codyprime/qemu-kvm-jtc/commit/611709dc69186c716432708c16a77da0871a3176)

* **Maintainer**
  Existing protocol and xlator maintainers.

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  *(link to the pull request for the [Admin Guide] or other official docs)*

* **Integration and Eco-system**
  * QEMU 2.7 with the Gluster block-driver uses `glfs_lseek()` for sparse files
  * Wireshark can dissect the calls and replies for the `SEEK` procedure

* **Advertisement**
  *(link to emails in gluster-devel archive with blog and video)*


### Compound operations
***TODO***: add summary (Compound operations similar to NFSv4)

* **Status**:
  (12-April-2016) Feature page posted, design under discussion.

* **Owners**:
  Anuradha Talur

* **Feature Page**:
  ***TODO***: merge the two feature pages into one
  * [Composite Operations](https://github.com/gluster/glusterfs-specs/blob/master/under_review/composite-operations.md)
  * [Compound FOPs](https://github.com/gluster/glusterfs-specs/blob/master/under_review/compound-fops.md)

* **Tracker Bug and Patches**:
  * [Tracker bug](https://bugzilla.redhat.com/1303829)
  * [Patches](http://review.gluster.org/#/q/topic:bug-1303829)

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
  [Add design spec for geo-rep support for sharded
  volumes](http://review.gluster.org/#/c/13788/)

* **Tracker Bug and Patches**:
  [Support geo-replication to work with sharding](https://bugzilla.redhat.com/1265148)
  
  1. <http://review.gluster.org/#/c/12438/>
  2. <http://review.gluster.org/#/c/12732/>
  3. <http://review.gluster.org/#/c/12729/>
  4. <http://review.gluster.org/#/c/12721/>
  5. <http://review.gluster.org/#/c/12731/>
  6. <http://review.gluster.org/#/c/13643/>

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
  [Design Doc](http://review.gluster.org/13515/)

* **Tracker Bug and Patches**:
  <http://review.gluster.org/12417> <http://review.gluster.org/12355>
  <http://review.gluster.org/12326> <http://review.gluster.org/12239>

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


## Quota Enhancements

### Enhance Quota enable/disable in glusterd
Previously when quota is enabled, quota crawl was done from the single mount
point, this is very slow process if there are huge number of files in the volume.
This RFE will now spawn crawl process for each brick in the volume, and  files
are checked in parallel independently for each brick. This improves the speed
of crawling process for entire files-system.


* **Status**:
  (12-April-2016) Patches under review.

* **Owners**:
  Vijaikumar, Manikandan

* **Feature Page**:
  [Design Doc](https://github.com/gluster/glusterfs-specs/blob/master/under_review/quota-enhancements.md)

* **Tracker Bug and Patches**:
  [Enhance Quota enable/disable process](http://review.gluster.org/#/q/status:open+project:glusterfs+branch:master+topic:bug-1290766)
  [Design Doc](https://github.com/gluster/glusterfs-specs/blob/master/under_review/quota-enhancements.md)

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

### Granular Entry self-heal for AFR
As of today, entry self-heal and data-selfheal in AFR are network/ CPU
intensive operations. This can lead to clients observing reduced performance/
stalling when accessing a volume when self-heal is in progress. The changes
proposed below make entry-self-heal more granular.

* **Status**:
  (5-May-2016) Development completed, needs documentation, DiSTAF,
  advertisement.

* **Owners**:
  Anuradha, Krutika, Pranith, Ravi

* **Feature page**:
  [Granular Entry self-heal](https://github.com/gluster/glusterfs-specs/tree/master/done/GlusterFS 3.8/granular-entry-self-healing.md)

* **Tracker Bug and Patches**:
  * [Bug 1269461](https://bugzilla.redhat.com/1269461)
  * [cluster/afr: Entry self-heal performance enhancements](http://review.gluster.org/12442)
  * [afr/index: changes for granular entry self-heal](http://review.gluster.org/12482)

* **Maintainer**
  Current AFR maintainer(s).

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
  <http://review.gluster.org/13115>

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
  <http://review.gluster.org/13214>

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


### Glusterfind and Bareos Integration
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

* **Integration and Eco-system**h
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
  <https://github.com/gluster/glustertool/blob/master/README.md>

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
***TODO***: add summary - <https://github.com/heketi/heketi>

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


### Periodic DiSTAF testing
[DiSTAF] is a multi node test framework used for automating the test cases related to gluster.
Any new feature for glusterfs should have correspnding tests written in distaf. These tests
will be run periodically by a Jenkins job. Currently the job will be run inside CentOS CI infra.

* **Status**:
  (7-April-2016) Work in progress, partially posted to the `centos-ci`
  directory in the [patch-acceptance-tests] repository.

* **Owners**:
  M S Vishwanath Bhat, Raghavendra Talur, Kaushal

* **Feature page:**
  [proposal in Gerrit](http://review.gluster.org/12048)

* **Tracker Bug and Patches**:
  * [DiSTAF base in the glusterfs repository](http://review.gluster.org/13853)

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  [Jenkins job in the CentOS CI](https://ci.centos.org/view/Gluster/job/gluster_nightly_distaf/)

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  * [Adding the distaf test cases requirement to Developement Workflow](https://github.com/gluster/glusterdocs/pull/100)
  * [README](https://github.com/gluster/distaf/blob/master/README.md)
  * [HOWTO](https://github.com/gluster/distaf/blob/master/docs/HOWTO.md)

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
  [Review request](https://bugzilla.redhat.com/show_bug.cgi?id=1331704)

* **Maintainer**
  *(patch to additional [`MAINTAINERS`][MAINTAINERS] entry)*

* **DiSTAF Testcase**:
  ...

* **Release Notes**:
  *(link to email in gluster-devel archive with release notes)*

* **User Documentation**
  [Admin Guide](http://docs.gluster.org/en/latest/Administrator%20Guide/GlusterFS%20Coreutils/)

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

### WORM, Retention and Compliance
Add WORM-Retention semantics for files on a Gluster Volume.

* **Status**: (25-May-2016)
  1. tracked by [bz 1334836] (https://bugzilla.redhat.com/show_bug.cgi?id=1334836) [Patch 14367] (http://review.gluster.org/#/c/14367/) merged upstream
  2. tracked by [bz 1326308] (https://bugzilla.redhat.com/show_bug.cgi?id=1326308) [Patch 13429] (http://review.gluster.org/#/c/13429/) merged upstream

* **Owners**:
  Joseph Elwin Fernandes, Karthik Subrahmanya

* **Feature page:**
  <http://review.gluster.org/13538>

* **Tracker Bug and Patches**:
* tracked by [bz 1333263] (https://bugzilla.redhat.com/show_bug.cgi?id=1333263) [Patch 14222] (http://review.gluster.org/#/c/14222/)
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
  (16-March-2016) Some patches under review, full design not settled yet. There
  most likely will be a dependency on the new compound FOPs.

* **Owners**:
  Poornima G, Soumya Koduri, Rajesh Joseph, Raghavendra Talur

* **Feature Page**:
  **TODO**: move [old wiki
  page](http://www.gluster.org/community/documentation/index.php/Features/Upcall-infrastructure#delegations.2Flease-locks)
  to [glusterfs-specs repository].

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

### Lock migration
Lock migration feature will migrate the locks associated with a file during
rebalance. In the current infra the lock state of a file are lost when a file
moves across server as part of rebalance.

* **Status**:
  High Level Design ready. Development in progress.

* **Owners**:
  Susant Palai,	Raghavendra Gowdappa, Pranith Kumar Karampuri

* **Feature page:**
  <https://github.com/gluster/glusterfs-specs/blob/master/accepted/Lock-Migration.md>

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


# At Risk

### Tiering Performance Enhancements
**TODO**: this should probably be split in multiple features? (2) and (3) are
real features that should be called out to users, (1) is close to standard
maintenance of an existing functionality (unless it needs re-design?).

1. Performance enhancements for small files with EC as cold tier.
2. Limit promotion to hot tier based on filesize.
3. Improve responsiveness for promotion/demotion of files ordered list of files
   based on heat (migration limit based on no. files and MB).

* **Status**: (2-April-2016)
  1. tracked by [bz 1292391](https://bugzilla.redhat.com/1292391). Good improvement with [patch 13605](http://review.gluster.org/13605).
  2. tracked by [bz 1313495](https://bugzilla.redhat.com/1313495). [Patch 13570](http://review.gluster.org/13570) merged upstream.
  3. [Patch 13607](http://review.gluster.org/13607) merged upstream.

* **Owners**:
  Dan Lambright, Joseph Fernandes

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


### Samba and NFS-Ganesha support for tiered volumes
Both Samba and NFS-Ganesha require improvements for supporting Tiered Volumes.

* **Status**:
  (2-April-2016) Four known Samba bugs (below). Tiering is not expected to fully support these protocols in 3.8 timeframe.

  * [Bug 1322695](https://bugzilla.redhat.com/1322695) SAMBA+TIER : Wrong message display.On detach tier success the message reflects Tier command failed.
  * [Bug 1322518](https://bugzilla.redhat.com/1322518) SAMBA+TIER : File when created from one windows client over the same volume mount is not accessible from other windows client over same volume mount
  * [Bug 1322247](https://bugzilla.redhat.com/1322247) SAMBA+TIER : File size is not getting updated when created on windows samba share mount
  * [Bug 1323119](https://bugzilla.redhat.com/1323119) SAMBA+TIER : Rafi has RCAed and there is an upstream patch

* **Owners**:
  Dan Lambright, Joseph Fernandes

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


[glusterfs-3.8.0]: https://bugzilla.redhat.com/showdependencytree.cgi?maxdepth=1&id=glusterfs-3.8.0
[glusterfs repository]: https://github.com/gluster/glusterfs
[glusterfs-specs repository]: https://github.com/gluster/glusterfs-specs
[patch-acceptance-tests]: https://github.com/gluster/glusterfs-patch-acceptance-tests/
[MAINTAINERS]: https://github.com/gluster/glusterfs/blob/master/MAINTAINERS
[Guidelines for maintainers]: http://docs.gluster.org/en/latest/Contributors-Guide/Guidelines-For-Maintainers/
[Admin Guide]: ...
[DiSTAF]: https://github.com/gluster/distaf
[ansible]: https://ansible.com/
