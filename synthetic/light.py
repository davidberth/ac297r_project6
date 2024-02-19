import vector
import color


def add(location, col):
    return f"light_source {{ {vector.build_vector3d(*location)} {color.add(*col)} }} \n"
