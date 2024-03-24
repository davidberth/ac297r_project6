import sys
import os
import fire
import constants
import scene
import options
import template
import parameters
import keypoint

import numpy as np


def do_scene():
    """Render a scene of an infant or toddler on a mat
    from multiple view angles, and then renders depth maps

    Args:
    Returns:
    """
    template_file = "templates\scene1.tmp"
    scene_file = "scenes\scene1.pov"
    hair_strand = """cylinder {
    <0, head_height, 0>, $, 0.012 
    texture {
    pigment { color Yellow } // Skin color
    }
    }"""

    for sn in range(10):
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

            # add the hair
            for i in range(1900):

                theta = np.random.uniform(
                    0, np.pi / 3
                )  # Polar angle, restricted to the top half
                phi = np.random.uniform(0, 2 * np.pi)  # Azimuthal angle, full range
                radius = np.random.uniform(0.12, 0.18) + params.head_size
                # Convert spherical coordinates to Cartesian coordinates for plotting
                x = radius * np.sin(theta) * np.cos(phi)
                z = radius * np.sin(theta) * np.sin(phi)
                y = radius * np.cos(theta) + params.head_height
                hf = hair_strand.replace("$", f"<{x},{y},{z}>")
                scene_str = scene_str + "\n" + hf + "\n"
                scene.save_scene(scene_file, scene_str)

            megapov = os.path.join(constants.megapov_path, "megapov")
            opts = options.add(512, 512)
            os.system(
                f"{megapov} +I{scene_file} +O{output_file} +FN"
                f" {opts} +L{constants.include_path}"
            )

            child_height = params.child_height
            with open(f"output/scene{sl}_{angle}.txt", "wt") as f:
                f.write(f"child height (cm) : {child_height * 20.0} \n")
                f.write("\n")
                pm = params.__dict__
                for key, value in pm.items():
                    f.write(f"{key}: {value}\n")

                f.write("\n\n")
                # implement the keypoints

                keypoint.set_camera(camera_loc, (0, 1.3, 0))
                keypoint.write(
                    f,
                    "head_top",
                    (0, params.head_height + params.head_size, 0),
                )

                keypoint.write(
                    f,
                    "right_hand",
                    right_arm_loc,
                )

                keypoint.write(
                    f,
                    "left_hand",
                    left_arm_loc,
                )

                keypoint.write(
                    f,
                    "right_foot",
                    (right_leg_loc[0], right_leg_loc[1] - 0.16, right_leg_loc[2]),
                )

                keypoint.write(
                    f,
                    "left_foot",
                    (left_leg_loc[0], left_leg_loc[1] - 0.16, left_leg_loc[2]),
                )

                keypoint.write(
                    f,
                    "neck",
                    (0, params.head_height - params.head_size, -0.31),
                )

                keypoint.write(f, "hip", (0.0, 1.0, -0.31))

                f.write("\n")

            sf = f"output\scene{sl}_{angle}"
            keypoint.apply_to_image(sf, 7)
            sf = f"output\depth{sl}_{angle}"
            keypoint.apply_to_image(sf, 7)
            keypoint.keypoints = []


if __name__ == "__main__":
    fire.Fire(do_scene)
