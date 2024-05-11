import vector
import color


def add(location, col):
    """Adds a light source to the scene

    Args:
        location (tuple): the location of the light source
        col (tuple): the color (RGB 0 to 1) of the light source
    Returns:
        the scene description string for the light source
    """
    return f"light_source {{ {vector.build_vector3d(*location)} {color.add(*col)} }} \n"
