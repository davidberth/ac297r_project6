import sys
import os
import fire
import constants
import scene
import options
import template
import parameters

import numpy as np


def do_scene():
    """Render a scene of an infant or toddler on a mat
    from multiple view angles, and then renders depth maps

    Args:
    Returns:
    """
    template_file = "templates\scene1.tmp"
    scene_file = "scenes\scene1.pov"
    params = parameters.Parameters()

    for frame, angle in enumerate(np.linspace(30, 150, num=6)):
        params_per = parameters.Parameters()
        rang = np.deg2rad(angle)
        camera_distance = params.camera_distance
        camera_loc = [
            np.cos(rang) * camera_distance,
            1.3,
            -np.sin(rang) * camera_distance,
        ]

        output_file = f"output\scene{frame}.png"
        scene_str = scene.build_scene(template_file)
        scene_str = template.process_template(scene_str, "camera_location", camera_loc)
        scene_str = template.process_template(
            scene_str, "depth_output", rf'"output/depth{frame}.png"'
        )

        right_arm_loc = np.array((0.0, 2.0, 0))
        arm_ang_xy = np.deg2rad(params_per.right_arm_angle_xy)
        right_arm_loc += [np.cos(arm_ang_xy) * 1.5, np.sin(arm_ang_xy) * 1.5, 0.0]
        scene_str = template.process_template(
            scene_str, "right_arm_end", list(right_arm_loc)
        )

        left_arm_loc = np.array((0.0, 2.0, 0))
        arm_ang_xy = np.deg2rad(params_per.left_arm_angle_xy)
        left_arm_loc += [-np.cos(arm_ang_xy) * 1.5, np.sin(arm_ang_xy) * 1.5, 0.0]
        scene_str = template.process_template(
            scene_str, "left_arm_end", list(left_arm_loc)
        )

        scene_str = params.implement_templates(scene_str)

        scene.save_scene(scene_file, scene_str)

        megapov = os.path.join(constants.megapov_path, "megapov")
        opts = options.add(512, 512)
        os.system(
            f"{megapov} +I{scene_file} +O{output_file} +FN"
            f" {opts} +L{constants.include_path}"
        )


if __name__ == "__main__":
    fire.Fire(do_scene)
