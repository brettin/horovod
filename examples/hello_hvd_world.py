from __future__ import print_function
import keras
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D
from keras import backend as K
import tensorflow as tf
import horovod.tensorflow as hvd



# Initialize hovorod
hvd.init()

# Pin GPU to be used to process local rank (one GPU per process)
config=tf.ConfigProto()
config.gpu_options.allow_growth = True
config.gpu_options.visible_device_list = str(hvd.local_rank())
K.set_session(tf.Session(config=config))

# Adjust learning rate based on number of GPUs (naive approach).
opt = tf.train.AdadeltaOptimizer(1.0 * hvd.size())

# Add Horovod Distributed Optimizer.
opt = hvd.DistributedOptimizer(opt)

# Compile the model

# Broadcast variables from rank 0 to all other processes.
K.get_session().run(hvd.broadcast_global_variables(0))

# Fit the model

