// POV-Ray script for rendering a blob with two overlapping spheres


camera {
    location <3, 5, -8>
    look_at <0, 0, 0>
    angle 30
}

light_source {
    <0, 4, -7.1>
    color <1, 1, 0.4>
    spotlight
    radius 2
    falloff 20
    tightness 13
    point_at <0.5, 0, 0>
  }

background {
    color rgb <1.0, 1.0, 1.0>
}

// Define the blob
blob {
    threshold 0.4

    // Sphere 1
    sphere {
        <0, 0, 0>, 1
        strength 1.5
    }

    // Sphere 2
    sphere {
        <1, 0, 0>, 1
        strength 1.5
    }

    texture {
        pigment { color rgb <0, 0, 1> }  // Red color
    }
    finish {
        ambient 0.1
        diffuse 0.8
        specular 0.4
    }
}
