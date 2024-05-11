import vector


def add(red: float, green: float, blue: float):
    """Returns an RGB color scene component

    Args:
        red (float): the red channel component
        green (float): the green channel component
        blue (float): the blue channel component

    Returns:
        a scene description string for the color
    """
    return f" color rgb {vector.build_vector3d(red, green, blue)} "
