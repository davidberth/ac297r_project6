// Scene template

#include "colors.inc"
#include "stones.inc"
#include "textures.inc"
#include "shapes.inc"
#include "woods.inc"
#include "pprocess.inc"


#declare mat_texture = New_Brass;
#declare camera_location = <-7.794617273097908, 1.3, -4.500224380853183>;
#declare depth_output = "output/depth000000_150.png";
#declare head_size = 0.6709047960128699;
#declare skin_color = <1.0, 0.8640579327411996, 0.7023377400213866>;
#declare shorts_color = <0.6029825864111154, 0.0, 0.5895677771654216>;
#declare right_arm_end = <1.46403755554068, 2.3264874208395634, 0.0>;
#declare left_arm_end = <-1.4950989046118015, 1.8788419815753366, 0.0>;
#declare left_leg_end = <-0.09494001532290192, 0.021250592498657905, 0.0>;
#declare right_leg_end = <0.21528609413101168, 0.003594683799599485, 0.0>;
#declare body_height = 2.7734636895229734;
#declare light1 = 0.8308269572254565;
#declare light2 = 0.16307964360135874;
#declare backcolor1 = 0.35968042774622333;
#declare backcolor2 = 0.3849859709897535;
#declare backcolor3 = 0.6991520927539552;
#declare background_texture = pigment {color rgb <backcolor1, backcolor2, backcolor3>};
#declare head_height = 3.276642286532626;

#version unofficial MegaPov 1.21;

global_settings{
  post_process { PP_Depth(6.0, 9.2)
  save_file depth_output }
}

// Camera setup
camera {
  location camera_location
  look_at  <0, 1.3,  0>
}

// Lights
light_source { <0, 10, -10> color rgb <light1, light1, light1> }
 light_source { <5, 10, 5> color rgb <light2, light2, light2> }
 light_source {
    <0, 6, -6>
    color Yellow
    spotlight
    radius 3
    falloff 20
    tightness 12
    point_at <0, 2, 0>
  }

// Ground
plane {
  z, 0.55
  texture {
    background_texture
    scale 0.3
  }
}

// Head (Sphere)
sphere {
  <0, head_height, 0>, head_size // Center and radius
  texture {
    pigment { color skin_color } // Skin color
  }
}

// left eye
sphere {
  <-0.2, head_height + 0.1, -head_size + 0.03>, 0.06
  texture {
   pigment { color rgb <0.2, 0.2, 0.2> }
  }
}

// right eye
sphere {
  <0.2, head_height + 0.1, -head_size + 0.03>, 0.06
  texture {
   pigment { color rgb <0.2, 0.2, 0.2> }
  }
}

// mouth
cylinder
{
    <-0.05, head_height - 0.2, -head_size + 0.01>, <0.05, head_height - 0.2, -head_size + 0.01>, 0.01
 texture {
   pigment { color rgb <0.2, 0.2, 0.2> }
  }
}


// Body (Box)
box {
  <-0.5, 1.6, -0.3>, <0.5, body_height, 0.3> // Corners
  texture {
    pigment { color skin_color } // Skin color
  }
}

// shorts part
box {
  <-0.51, 1.0, -0.31>, <0.51, 1.6, 0.31> // Corners
  texture {
    pigment { color shorts_color } // Shorts color
  }
}


// Right Arm (Cylinder)
cylinder {
  <0.5, 2, 0>, right_arm_end, 0.16 // Base, cap, and radius
  texture {
    pigment { color rgb skin_color } // Skin color
  }
}

// Left Arm (Cylinder)
cylinder {
  <-0.5, 2, 0>, left_arm_end, 0.16 // Base, cap, and radius
  texture {
    pigment { color rgb skin_color } // Skin color
  }
}

// Right Leg (Cylinder) Shorts
cylinder {
  <0.3, 1.0, 0>, <0.3, 0.7, 0>, 0.23 // Base, cap, and radius
  texture {
    pigment { color shorts_color } // Shorts
  }
}

// Right Leg Skin
cylinder {
  <0.3, 0.7, 0>, right_leg_end, 0.20 // Base, cap, and radius
  texture {
    pigment { color skin_color } // Skin color
  }
}


// Left Leg (Cylinder) Shorts
cylinder {
  <-0.3, 1.0, 0>, <-0.35, 0.7, 0>, 0.23 // Base, cap, and radius
  texture {
    pigment { color shorts_color } // Skin color
  }
}

// Left Leg Skin
cylinder {
  <-0.35, 0.7, .2>, left_leg_end, 0.20 // Base, cap, and radius
  texture {
    pigment { color skin_color } // Skin color
  }
}

// Mat
box {
  <-3, -2, 0.31>, <3, 5, 0.5> // Corners
  texture {
    mat_texture
    scale 0.2  // Adjust the scale to control the size of the checkers
  }
}

