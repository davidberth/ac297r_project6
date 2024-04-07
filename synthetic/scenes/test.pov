// Example to texture a sphere with a simple face in POV-Ray, with rotation
#include "colors.inc"

camera {
  location <0, 0, -2>
  look_at <0, 0, 0>
}

light_source { <0, 10, -10> color White }

sphere {
  <0, 0, 0>, .2 // Center and radius of the sphere
  texture {
    pigment {
      image_map {
        png "textures/faces/test.png" // Assuming you have a PNG image of a face
        map_type 1 // Spherical mapping
        once // Use the image once (no tiling)
        interpolate 2 // Smooth interpolation
      }
    }
    finish {
      phong 0.9
      phong_size 300
    }
    rotate <0, -90, 0> // Rotation vector: <X, Y, Z>
  }
  translate <0, 0.8, 0>
}