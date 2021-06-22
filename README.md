# Effective3D-based-frontalization

Official MATLAB implementation of the paper "Effective 3D based frontalization for unconstrained face recognition", appeared at IEEE 23rd International Conference on Pattern Recognition (ICPR) 2016.

![alt text](https://github.com/clferrari/Effective3D-based-frontalization/blob/master/image/front.png)


### Usage

This demo code is self contained for standard MATLAB installation. To run the code on your data, you first need to detect the landmarks on the face images. The code provides a 3D landmark configuration in the 68 points I-Bug mark-up (https://ibug.doc.ic.ac.uk/resources/facial-point-annotations/). A different configuration can be used for the 3D model, but you will need to manually label the corresponding 3D points on the average face model.

### Citation

If you find the code useful, please cite the following papers:

```
@inproceedings{ferrari2016effective,
  title={Effective 3D based frontalization for unconstrained face recognition},
  author={Ferrari, Claudio and Lisanti, Giuseppe and Berretti, Stefano and Del Bimbo, Alberto},
  booktitle={2016 23rd International Conference on Pattern Recognition (ICPR)},
  pages={1047--1052},
  year={2016},
  organization={IEEE}
}

@article{ferrari2017dictionary,
  title={A dictionary learning-based 3D morphable shape model},
  author={Ferrari, Claudio and Lisanti, Giuseppe and Berretti, Stefano and Del Bimbo, Alberto},
  journal={IEEE Transactions on Multimedia},
  volume={19},
  number={12},
  pages={2666--2679},
  year={2017},
  publisher={IEEE}
}
``` 


