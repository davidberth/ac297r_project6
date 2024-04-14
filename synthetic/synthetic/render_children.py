import fire
import constants
import scene
import options
import template
import parameters
import keypoint
import face
import post_process

import os
import numpy as np


def render_scenes(num_children: int, seed: int, clear_dir: bool = False):
    """Render a scene of an infant or toddler on a mat
    from multiple view angles, and then renders depth maps

    Args:
        num_children (int): Number of children to render
        seed (int): The starting random seed to use for reproducibility
        clear_dir (bool): If true, clear the output directory before rendering
    Returns:
    """
    output_path = constants.output_path
    if not os.path.exists(output_path):
        os.makedirs(output_path)
    if clear_dir:
        files = os.listdir(output_path)
        for file in files:
            if file.endswith(".png") or file.endswith(".txt"):
                os.remove(os.path.join(output_path, file))

    components = [
        ("header", 0),
        ("camera", 0),
        ("lights", 0),
        ("head", 0),
        ("body", 0),
        ("arms", 0),
        ("legs", 0),
        ("feet", 0),
        ("hands", 0),
        ("mat", 1),
        ("background", 1),
    ]
    components = [
        ("templates/" + comp + ".tmp", typ) for comp, typ in components
    ]

    scene_file = constants.output_scene
    hair_strand = """cylinder {
    <0, head_height, 0>, $, @
    texture {
    pigment { color rgb< haircolor1 , haircolor2 , haircolor3 > } // Skin color
    }
    }"""

    for sn in range(num_children):

        if seed >= 0:
            np.random.seed(seed)
            seed += 1
        params = parameters.Parameters()

        # generate the face texture
        face.render_face(
            *params.skin_color, params.eye_color_index, params.smile_factor
        )

        # define the mat texture
        mat_index = params.mat_texture
        mat_texture = f'"textures/mat/461223{mat_index:03d}.jpg"'

        for frame, angle in enumerate(range(30, 151, 30)):
            # for frame, angle in enumerate(
            #    [
            #        90,
            #    ]
            # ):
            params_per = parameters.Parameters()
            rang = np.deg2rad(float(angle + np.random.uniform(-3.0, 3.0)))
            for do_background in [True, False]:
                scene_str = scene.build_scene(
                    components, do_background=do_background
                )

                camera_distance = params_per.camera_distance
                camera_loc = [
                    np.cos(rang) * camera_distance,
                    1.3,
                    -np.sin(rang) * camera_distance,
                ]

                angle = str(angle).zfill(3)
                sl = str(sn).zfill(6)
                if do_background:
                    output_file = f"output\child_{sl}_rgb_{angle}.png"
                    scene_str = template.process_template(
                        scene_str, "face_texture", '"textures/faces/face.png"'
                    )
                else:
                    output_file = f"output\child_{sl}_seg_{angle}.png"
                    scene_str = template.process_template(
                        scene_str, "face_texture", '"textures/faces/mask.png"'
                    )

                scene_str = template.process_template(
                    scene_str, "mat_tex", mat_texture
                )

                scene_str = template.process_template(
                    scene_str, "child_rotate_y", str(params_per.child_rotate_y)
                )
                scene_str = template.process_template(
                    scene_str, "child_rotate_z", str(params_per.child_rotate_z)
                )

                scene_str = template.process_template(
                    scene_str, "camera_location", camera_loc
                )
                scene_str = template.process_template(
                    scene_str,
                    "depth_output",
                    rf'"output/child_{sl}_dpt_{angle}.png"',
                )

                right_arm_loc = np.array((0.0, 2.0, 0))
                arm_ang_xy = np.deg2rad(params_per.right_arm_angle_xy)
                right_arm_loc += [
                    np.cos(arm_ang_xy) * 1.5,
                    np.sin(arm_ang_xy) * 1.5,
                    0.0,
                ]
                scene_str = template.process_template(
                    scene_str, "right_arm_end", list(right_arm_loc)
                )

                left_arm_loc = np.array((0.0, 2.0, 0))
                arm_ang_xy = np.deg2rad(params_per.left_arm_angle_xy)
                left_arm_loc += [
                    -np.cos(arm_ang_xy) * 1.5,
                    np.sin(arm_ang_xy) * 1.5,
                    0.0,
                ]
                scene_str = template.process_template(
                    scene_str, "left_arm_end", list(left_arm_loc)
                )

                left_leg_loc = np.array((-0.3, 1.0, 0.0))
                leg_ang_xy = np.deg2rad(params_per.left_leg_angle_xy)
                left_leg_loc += [
                    np.sin(leg_ang_xy) * 1.0,
                    -np.cos(leg_ang_xy) * 1.0,
                    0.0,
                ]

                scene_str = template.process_template(
                    scene_str, "left_leg_end", list(left_leg_loc)
                )

                right_leg_loc = np.array((0.3, 1.0, 0.0))
                leg_ang_xy = np.deg2rad(params_per.right_leg_angle_xy)
                right_leg_loc += [
                    np.sin(leg_ang_xy) * 1.0,
                    -np.cos(leg_ang_xy) * 1.0,
                    0.0,
                ]
                scene_str = template.process_template(
                    scene_str, "right_leg_end", list(right_leg_loc)
                )

                scene_str = params.implement_templates(scene_str)

                hair_str = ""

                # add the hair
                for i in range(np.random.randint(250, 4000)):

                    theta = np.random.uniform(
                        0, np.pi / 3
                    )  # Polar angle, restricted to the top half
                    phi = np.random.uniform(
                        0, 2 * np.pi
                    )  # Azimuthal angle, full range
                    radius = np.random.uniform(0.10, 0.18) + params.head_size
                    hair_width = np.random.normal(loc=0.016, scale=0.003)
                    # Convert spherical coordinates to Cartesian coordinates for plotting
                    x = radius * np.sin(theta) * np.cos(phi)
                    z = radius * np.sin(theta) * np.sin(phi)
                    y = radius * np.cos(theta) + params.head_height
                    hf = hair_strand.replace("$", f"<{x},{y},{z}>")
                    hf = hf.replace("@", str(hair_width))
                    hair_str = hair_str + "\n" + hf + "\n"

                scene_str = scene_str.replace("<<<HAIR>>>", hair_str)

                scene.save_scene(scene_file, scene_str)

                megapov = os.path.join(constants.megapov_path, "megapov")
                opts = options.add(224, 224)
                os.system(
                    f"{megapov} +I{scene_file} +O{output_file} +FN"
                    f" {opts} +L{constants.include_path}"
                )

                if do_background:

                    child_height = params.child_height
                    with open(f"output/child_{sl}_lbl_{angle}.txt", "wt") as f:
                        f.write(f"child height (cm): {child_height * 20.0} \n")
                        f.write(f"seed: {seed}")
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
                            0,
                        )

                        keypoint.write(f, "right_hand", right_arm_loc, 1)

                        keypoint.write(f, "left_hand", left_arm_loc, 1)

                        keypoint.write(
                            f,
                            "right_foot",
                            (
                                right_leg_loc[0],
                                right_leg_loc[1] - 0.16,
                                right_leg_loc[2],
                            ),
                            2,
                        )

                        keypoint.write(
                            f,
                            "left_foot",
                            (
                                left_leg_loc[0],
                                left_leg_loc[1] - 0.16,
                                left_leg_loc[2],
                            ),
                            2,
                        )

                        keypoint.write(
                            f,
                            "neck",
                            (0, params.head_height - params.head_size, -0.31),
                            0,
                        )

                        keypoint.write(f, "hip", (0.0, 1.0, -0.31), 0)

                        f.write("\n")
                else:
                    sf = f"output/child_{sl}_seg_{angle}"
                    post_process.apply_mask(sf)

            # apply the postprocessing
            sf = f"output/child_{sl}_rgb_{angle}"
            post_process.apply_noise(sf, np.random.uniform(0.0, 8.0))
            # post_process.apply_box(sf)
            # keypoint.apply_to_image(sf, 5)
            sf = f"output\child_{sl}_dpt_{angle}"
            post_process.apply_noise(sf, np.random.uniform(0.0, 8.0))
            # post_process.apply_box(sf)
            # keypoint.apply_to_image(sf, 5)
            sf = f"output\child_{sl}_seg_{angle}"
            # keypoint.apply_to_image(sf, 5)
            keypoint.keypoints = []


if __name__ == "__main__":
    fire.Fire(render_scenes)