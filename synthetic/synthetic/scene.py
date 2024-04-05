import header
import camera
import light
import sphere


def build_scene(template_path):
    with open(template_path, "r") as f:
        template = f.read()

    return template


def save_scene(output_path: str, scene: str):
    with open(output_path, "w") as f:
        f.write(scene)
