# Adaptive Rate/Power Control with ML-based Channel Prediction for Optical Satellite Systems

This repository is the implementation of an efficient rate/power adaptation scheme with channel prediction for optical satellite systems, proposed in the paper [__"Adaptive Rate/Power Control with ML-based Channel Prediction for Optical Satellite Systems,"__](https://ieeexplore.ieee.org/document/10535712) 
in _IEEE Transactions on Aerospace and Electronic Systems (May 2024)_ [[Preprint](https://drive.google.com/file/d/1rJs94e-JsBBUu6LtZSY0PR4Mflv01PuZ/view)]. 

The adaptation scheme is developed to maximize the energy efficiency of a satellite-to-UAV system by continuously adapting the transmitted power and data rate according to the current channel conditions.
Due to the long transmission link, the feedback of the channel state information (CSI) tends to be outdated, which highly deteriorates the system's performance. Therefore, we implement several ML-based regression models to predict the CSI in advance, aiming to achieve accurate CSI and counteract the induced feedback delay. 

### Repository structure 
- Adaptive-Scheme: MATLAB codes that implement the rate/power adaptation scheme and analyze the overall performance.
- Channel-Pred: Python codes that implement ML-based channel prediction schemes, including ESN, SVM, LSTM, and GRU.
- Note that data for simulation is obtained from a measurement, available at [LINK](http://focal.mcmaster.ca/)

### Cite this work 
```
@ARTICLE{10535712,
  author={Nguyen, Tinh V. and Le, Hoang D. and Pham, Anh T.},
  journal={IEEE Transactions on Aerospace and Electronic Systems}, 
  title={Adaptive Rate/Power Control with ML-based Channel Prediction for Optical Satellite Systems}, 
  year={2024},
  volume={},
  number={},
  pages={1-12},
  doi={10.1109/TAES.2024.3403809}}
```

### About the authors 
- Tinh V. NGUYEN, m5272016@u-aizu.ac.jp
- [Hoang D. LE](https://u-aizu.ac.jp/~hoangle/), hoangle@u-aizu.ac.jp
- [Anh T. PHAM](https://scholar.google.com/citations?user=u_36lx4AAAAJ&hl=en), pham@u-aizu.ac.jp
