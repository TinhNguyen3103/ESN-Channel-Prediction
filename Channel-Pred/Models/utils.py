import numpy as np

def load_data(data_type=None):
    # data_type: 'high'/'low': 
    if data_type == 'high':
        h_a = np.loadtxt('../../Data/data_39_highSI.txt', dtype=float)
    elif type == 'low':
        h_a = np.loadtxt('../../Data/data_39_lowSI.txt', dtype=float)

    h_a = h_a[h_a>0]
    h_a = h_a[1::20]

    avr = np.average(h_a)
    h_a = h_a/avr

    return h_a