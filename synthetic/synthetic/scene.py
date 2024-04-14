def build_scene(components, do_background=True):
    template = ""
    for comp, typ in components:
        if typ == 0 or do_background:
            with open(comp, "r") as f:
                template += f.read()

    return template


def save_scene(output_path: str, scene: str):
    with open(output_path, "w") as f:
        f.write(scene)
