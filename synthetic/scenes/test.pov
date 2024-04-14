#include "colors.inc"

camera {
  location <5, .5, -5>
  look_at <0, 2, 5>
}

light_source {
  <0, 50, -50>
  color rgb <1, .7, .7>
}

background { color rgb <0, 0, 0> }  // white background

union{
blob {
    threshold 0.6
    sphere { <-0.3, 0.1, 0>, 0.7, 1 }
    sphere { <0.3, 0.1, 0>, 0.7, 1 }
    sphere { <-0.7, 0.5, 0>, 0.7, 1 }
    sphere { <0.0, 0.5, 0>, 0.7, 1 }
    sphere { <0.7, 0.5, 0>, 0.7, 1 }
    sphere { <-0.5, 1.0, 0>, 0.7, 0.9 }
    sphere { <0.0, 1.0, 0>, 0.65, 0.95}
    sphere { <0.5, 1.0, 0>, 0.7, 1}

    // thumb
    sphere { <-0.9, 0.4, 0>, 0.3, 1}

    // individual fingers
    sphere { <-0.7, 1.2, 0>, 0.3, 1}
    sphere { <-0.3, 1.2, 0>, 0.3, 1}
    sphere { <0.3, 1.2, 0>, 0.28, 1}
    sphere { <0.8, 1.2, 0>, 0.27, 1}

    pigment {color rgb <0.8, 0.8, 0.4>}
}

// thumb
blob
{
   threshold 0.6
   sphere { <-1.1, 0.55, 0>, 0.3, 1}
   sphere { <-1.2, 0.73, 0>, 0.32, 0.95}
   sphere { <-1.3, 0.98, 0>, 0.33, 0.95}
   pigment {color rgb <0.82, 0.82, 0.4>}
}

// finger 1
blob
{
   threshold 0.6
   sphere { <-0.75, 1.4, 0>, 0.30, 0.9}
   sphere { <-0.90, 1.62, 0>, 0.32, 0.95}
   sphere { <-0.98, 1.88, 0>, 0.30, 0.95}
   pigment {color rgb <0.82, 0.82, 0.4>}

}

// finger 2
blob
{
   threshold 0.6
   sphere { <-0.3, 1.4, 0>, 0.35, 0.95}
   sphere { <-0.35, 1.72, 0>, 0.32, 0.95}
   sphere { <-0.4, 1.99, 0>, 0.32, 1}
   pigment {color rgb <0.82, 0.82, 0.4>}

}
// finger 3
blob
{
   threshold 0.6
   sphere { <0.35, 1.4, 0>, 0.35, 0.9}
   sphere { <0.37, 1.67, 0>, 0.32, 0.95}
   sphere { <0.39, 1.95, 0>, 0.32, 1}
   pigment {color rgb <0.82, 0.82, 0.4>}

}

// little finger
blob
{
   threshold 0.6
   sphere { <0.85, 1.4, 0>, 0.29, 0.9}
   sphere { <0.9, 1.59, 0>, 0.26, 0.95}
   sphere { <0.95, 1.72, -0.05>, 0.22, 1}
   pigment {color rgb <0.82, 0.82, 0.4>}

}
rotate <0,0,0>
translate <0, 0, 0>
}