import color
import texture
import vector


def add_color(location, radius, col):
    return (
        f"sphere {{ {vector.build_vector3d(*location)} , {radius} \n"
        f" {texture.build_pigment(*col)} }}\n"
    )


def add_texture(location, radius, tex):
    return (
        f"sphere {{ {vector.build_vector3d(*location)} , {radius} \n"
        f" {texture.build_builtin(tex)} }}\n"
    )
