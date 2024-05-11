import color


def add(col):
    """Returns a background with an RGB color

    Args:
        col (tuple): the RGB color to use for the background

    Returns:
        a scene description string
    """
    return f"background {{ {color.add(*col)} }}"
