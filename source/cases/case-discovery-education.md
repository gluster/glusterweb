# Case Study: Discovery Education

<img src="/cases/discovery-education.png" style="background: rgba(14,98,158, 0.9); padding: 20px; margin: 30px" class="pull-right img-responsive img-rounded">

The classroom of the 21st Century is no longer just about freshly sharpened pencils, chalkboard erasers, and textbooks. The classroom of today is also about student engagement, through interactive lessons and the presentation of rich multimedia content that captures students' imaginations, even as it educates them about the world in which they live.

A logical choice to provide such content is Discovery Communications, a leading non-fiction media company dedicated to satisfying curiosity, engaging and entertaining viewers with high-quality content on worldwide television networks including Discovery Channel, Animal Planet and Science Channel. Through its [Discovery Education division](http://www.discoveryeducation.com/who-we-are/about-discovery-education.cfm), it does precisely that.

Discovery Education services are available in over half of all U.S. schools and primary schools in England, as well as 50 countries around the world. The technical challenges to deliver thousands of videos to classrooms across the globe is nowhere near a trivial task. But by using [GlusterFS](http://www.gluster.org/), Discovery Education is excelling at this job.

According to Matt Blaha, Sr. Systems Engineer at Discovery Education, the use of GlusterFS was a natural extension of looking at their legacy systems, a mix of storage area network (SAN) and other data storage systems, and wanting to pull them into a more cohesive, unified system.

"We were looking for something that would provide high availability, scale horizontally, and run on commodity hardware," Blaha said in a recent discussion about GlusterFS. The commodity hardware, and its attendant cost savings, was of particular interest to the team.

Today Discovery Education has a lot of media content to manage: 80 Tb of media files, geo-replicated across two data centers. They are running distributed-replica volumes across four servers, and each physical server is a 12-disk RAID 6 array. Their hardware is Dell R720 machines, Blaha added.

Even with this configuration in place, consolidation of media storage systems is still ongoing. This summer saw the migration of IIS and HP PolyServe systems to GlusterFS running with Nginx. This migration, Blaha emphasized, was very smooth, citing only a few glitches along the way.

## On Their Own

For the most part, Blaha explained, he and his team has not had a great deal of interaction with the GlusterFS community. This is not a deliberate snub, of course, but more of a result of how well GlusterFS has been built, as well as the availability of resources that have enabled Discovery Education to take care of their issues pretty much themselves.

Take those glitches Blaha mentioned in last summer's migration. Their most difficult problem was when GlusterFS updated from 3.3 to 3.4, which introduced some surprising changes to their system's firewall. Blaha said that even though GlusterFS' documentation status is "a little loose," they were able to track down the issue and implement a fix.

The quality of GlusterFS itself has also made it easier for Discover Education to go it on their own.

"We trust it more and more, because we have found [GlusterFS] to be very robust," Blaha explained. Even throughout system failures, he added, GlusterFS has proven to be very resilient.

## Into the Future

As dependable as GlusterFS has been, Discovery Education is also exploring other solutions for the near future. As they scale their operating system machines, the team may start using GlusterFS less. For truly fast storage needs, Blaha outlined, they may start deploying local SSDs, and shift to block-oriented storage with tools like Ceph for files that don't need as fast access.

"As a group we like to experiment with different technologies that will solve business problems," said Ramin Surya, Director of Systems and Development Operations.

Media files, the heart of Discovery Education's content, will remain within GlusterFS, however. Its flexibility and ease of use make it a vital part of Discovery Education's mission to educate the students of this new century.
