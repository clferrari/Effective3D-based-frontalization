# Effective 3D Based Frontalization

Official MATLAB implementation of the paper "Effective 3D based frontalization for unconstrained face recognition", appeared at IEEE 23rd International Conference on Pattern Recognition (ICPR) 2016.

![alt text](https://github.com/clferrari/Effective3D-based-frontalization/blob/master/image/front.png)


### Usage

This demo code is self contained for standard MATLAB installation. To run the code on your data, you first need to detect the landmarks on the face images. The code provides a 3D landmark configuration in the 68 points I-Bug mark-up (https://ibug.doc.ic.ac.uk/resources/facial-point-annotations/). A different configuration can be used for the 3D model, but you will need to manually label the corresponding 3D points on the average face model.

Please note that, among the 68 landmarks, two redundant landmarks were removed in our implementation. Those are the #65 and #61 (1-based indexing).


### Frontalized LFW Dataset

We used the method to frontalize the face images of the Labeled Faces in the Wild (LFW) dataset. It can be dowloaded from the Media Integration and Communication Center (MICC) website [[here](https://www.micc.unifi.it/resources/datasets/frontalized-faces-in-the-wild/)]

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

### Contacts

For troubleshooting, feel free to drop an email to ferrari.claudio88@gmail.com

