import texture
import vector


def add_color(location, radius, col):
    """
    Constructs a POV-Ray sphere definition string with a specified color.

    Args:
        location (tuple): A tuple of three floats representing the XYZ coordinates of the sphere's center.
        radius (float): The radius of the sphere.
        col (tuple): A tuple of three floats representing the RGB color values of the sphere.

    Returns:
        str: A POV-Ray language string defining a colored sphere.
    """

    return (
        f"sphere {{ {vector.build_vector3d(*location)} , {radius} \n"
        f" {texture.build_pigment(*col)} }}\n"
    )


def add_texture(location, radius, tex):
    """
    Constructs a POV-Ray sphere definition string with a specified texture.

    Args:
        location (tuple): A tuple of three floats representing the XYZ coordinates of the sphere's center.
        radius (float): The radius of the sphere.
        tex (str): The name of the built-in texture to apply to the sphere.

    Returns:
        str: A POV-Ray language string defining a textured sphere.
    """

    return (
        f"sphere {{ {vector.build_vector3d(*location)} , {radius} \n"
        f" {texture.build_builtin(tex)} }}\n"
    )
