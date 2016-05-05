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
