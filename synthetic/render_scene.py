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

    for sn in range(1):
        params = parameters.Parameters()
        # for frame, angle in enumerate([90]):
        for frame, angle in enumerate(range(30, 151, 30)):
            params_per = parameters.Parameters()
            rang = np.deg2rad(float(angle))
            camera_distance = params_per.camera_distance
            camera_loc = [
                np.cos(rang) * camera_distance,
                1.3,
                -np.sin(rang) * camera_distance,
            ]

            angle = str(angle).zfill(3)
            sl = str(sn).zfill(6)
            output_file = f"output\scene{sl}_{angle}.png"
            scene_str = scene.build_scene(template_file)
            scene_str = template.process_template(
                scene_str, "camera_location", camera_loc
            )
            scene_str = template.process_template(
                scene_str, "depth_output", rf'"output/depth{sl}_{angle}.png"'
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

            left_leg_loc = np.array((-0.3, 1.0, 0.0))
            leg_ang_xy = np.deg2rad(params_per.left_leg_angle_xy)
            left_leg_loc += [np.sin(leg_ang_xy) * 1.0, -np.cos(leg_ang_xy) * 1.0, 0.0]

            scene_str = template.process_template(
                scene_str, "left_leg_end", list(left_leg_loc)
            )

            right_leg_loc = np.array((0.3, 1.0, 0.0))
            leg_ang_xy = np.deg2rad(params_per.right_leg_angle_xy)
            right_leg_loc += [np.sin(leg_ang_xy) * 1.0, -np.cos(leg_ang_xy) * 1.0, 0.0]
            scene_str = template.process_template(
                scene_str, "right_leg_end", list(right_leg_loc)
            )

            scene_str = params.implement_templates(scene_str)

            scene.save_scene(scene_file, scene_str)

            megapov = os.path.join(constants.megapov_path, "megapov")
            opts = options.add(512, 512)
            os.system(
                f"{megapov} +I{scene_file} +O{output_file} +FN"
                f" {opts} +L{constants.include_path}"
            )

            child_height = params.child_height
            with open(f"output/scene{sl}_{angle}.txt", "wt") as f:
                f.write(f"child height (cm) : {child_height * 20.0}")


if __name__ == "__main__":
    fire.Fire(do_scene)
