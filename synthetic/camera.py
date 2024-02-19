import vector


def build_camera(location, look_at):
    camera = f" camera {{ location {vector.build_vector3d(*location)}  \n"
    camera += f" look_at {vector.build_vector3d(*look_at)} }} \n"
    return camera
