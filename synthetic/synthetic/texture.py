import color


def build_builtin(texture_name: str):
    return f" texture {{ {texture_name} }} \n"


def build_pigment(red, green, blue):
    return f" texture {{ pigment {{ {color.add(red, green, blue) } }} }} \n"
