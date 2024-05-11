import vector


def build_camera(location, look_at):
    """Returns a camera with a location and look_at vector

    Args:
        location (tuple): a 3d vector for the camera location
        look_at (tuple): a 3d vector for the camera look_at

    Returns:
        a scene description string for the camera
    """
    camera = f" camera {{ location {vector.build_vector3d(*location)}  \n"
    camera += f" look_at {vector.build_vector3d(*look_at)} }} \n"
    return camera
