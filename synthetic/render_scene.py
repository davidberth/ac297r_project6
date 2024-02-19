import sys
import os
import fire
import constants
import scene
import options
import template
import numpy as np


def do_scene():
    """Render a scene of an infant or toddler on a mat
    from multiple view angles, and then renders depth maps

    Args:
    Returns:
    """
    template_file = "templates\scene1.tmp"
    scene_file = "scenes\scene1.pov"

    for frame, angle in enumerate(np.linspace(30, 150, num=6)):
        rang = np.deg2rad(angle)
        camera_loc = [np.cos(rang) * 9.0, 1.3, -np.sin(rang) * 9.0]

        output_file = f"output\scene{frame}.png"
        scene_str = scene.build_scene(template_file)
        scene_str = template.process_template(scene_str, "camera_location", camera_loc)
        scene_str = template.process_template(
            scene_str, "depth_output", rf'"output/depth{frame}.png"'
        )
        scene.save_scene(scene_file, scene_str)

        megapov = os.path.join(constants.megapov_path, "megapov")
        opts = options.add(512, 512)
        os.system(
            f"{megapov} +I{scene_file} +O{output_file} +FN"
            f" {opts} +L{constants.include_path}"
        )


if __name__ == "__main__":
    fire.Fire(do_scene)
