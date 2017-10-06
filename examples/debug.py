from __future__ import print_function
import horovod.tensorflow as hvd
hvd.init()
print('local_rank=%d, rank=%d, size=%d' % (hvd.local_rank(), hvd.rank(), hvd.size()))
