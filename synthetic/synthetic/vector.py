def build_vector3d(x, y, z):
    """Returns a 3D vector from components

    Args:
        x (float): x component
        y (float): y component
        z (float): z component
    Returns:
        Scene description fragment for the 3D vector
    """
    return f"<{x}, {y}, {z}>"
