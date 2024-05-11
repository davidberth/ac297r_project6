import color


def build_builtin(texture_name: str):
    """Return a texture component for the given texture name

    Args:
        texture_name: the name of the texture
    Returns:
        a scene component
    """
    return f" texture {{ {texture_name} }} \n"


def build_pigment(red, green, blue):
    """Return a pigment component for the given texture name

    Args:
        red (float): the red component
        green (float): the green component
        blue (float): the blue component
    Returns:
        a scene component
    """

    return f" texture {{ pigment {{ {color.add(red, green, blue) } }} }} \n"
