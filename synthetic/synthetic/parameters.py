"""This module contains the global parameters for the synthetic data
generator. Parameters are sampled from various random distributions"""

import numpy as np
from numpy.random import randn, uniform
import template


class Parameters:
    def __init__(self, params=None):
        # initialize with default values
        defaults = {
            "head_size": ("normal", 0.65, 0.05),
            "skin_color": ("color", (1, 0.8, 0.6), (0.1, 0.1, 0.1)),
            "shorts_color": ("color", (0.5, 0.5, 0.5), (0.5, 0.5, 0.5)),
            "mat_texture": ("integer", 101, 200),
            "camera_distance": ("normal", 6.2, 0.2),
            "rotation_adj": ("normal", 0.0, 4.0),
            "right_arm_angle_xy": ("normal", 0.0, 10.0),
            "left_arm_angle_xy": ("normal", 0.0, 10.0),
            "right_arm_angle_z": ("normal", 0.0, 5.0),
            "left_arm_angle_z": ("normal", 0.0, 5.0),
            "left_leg_angle_xy": ("normal", 0.0, 10.0),
            "right_leg_angle_xy": ("normal", 0.0, 10.0),
            "right_leg_angle_z": ("normal", 0.0, 5.0),
            "left_leg_angle_z": ("normal", 0.0, 5.0),
            "body_height": ("normal", 2.48, 0.16),
            "light_x": ("unif", -5.0, 5.0),
            "light_y": ("unif", -5.0, 5.0),
            "light1": ("unif", 0.3, 1.0),
            "light2": ("unif", 0.3, 1.0),
            "light3": ("unif", 0.2, 1.0),
            "light4": ("unif", 0.3, 1.0),
            "backcolor1": ("unif", 0.0, 1.0),
            "backcolor2": ("unif", 0.0, 1.0),
            "backcolor3": ("unif", 0.0, 1.0),
            "haircolor_red": ("unif", 0.0, 1.0),
            "haircolor_green": ("unif", 0.0, 1.0),
            "haircolor_blue": ("unif", 0.0, 1.0),
            "eye_color_index": ("integer", 0, 9),
            "smile_factor": ("unif", -40.0, 100.0),
            "mat_rotate_y": ("unif", -2.0, 2.0),
            "mat_rotate_z": ("unif", -3.0, 3.0),
            "child_rotate_y": ("normal", 0.0, 6.0),
            "child_rotate_z": ("normal", 0.0, 6.0),
            "hair_count": ("unif", 250, 4000),
            "hair_length": ("unif", 0.10, 0.18),
            "image_noise_level": ("unif", 0.0, 8.0),
        }

        if params is not None:
            for key, value in params.items():
                if key in defaults:
                    dist, *args = defaults[key]
                    if isinstance(value, str):
                        vals = value.split(":")
                        if len(vals) == 2:
                            dist_type, *dist_args = vals

                        args = [float(arg) for arg in dist_args[0].split(",")]
                    defaults[key] = (dist_type, *args)

        # set parameters using potentially overridden defaults
        for key, (dist, *args) in defaults.items():
            try:
                setattr(self, key, getattr(self, dist)(*args))
            except:
                raise ValueError(f"Invalid distribution type provided: {dist}")

        # calculate dependent parameters
        self.head_height = self.body_height + self.head_size * 0.75
        self.child_height = self.body_height + self.head_size * 1.75

    def normal(self, mu, sigma):
        return randn() * sigma + mu

    def bern(self, p):
        pc = np.random.random()
        return pc < p

    def unif(self, a, b):
        return uniform(a, b)

    def integer(self, a, b):
        return np.random.randint(a, b)

    def color(self, center, sigma):
        cent = np.array(center)
        sig = np.array(sigma)
        col = randn(3) * sigma + cent
        col = np.clip(col, (0.0, 0.0, 0.0), (1.0, 1.0, 1.0))
        return col

    def constant(self, value):
        return value

    def implement_templates(self, script):
        params = self.__dict__
        for key, value in params.items():
            if isinstance(value, np.ndarray):
                script = template.process_template(script, key, list(value))
            else:
                script = template.process_template(script, key, str(value))
        return script

    def choose(self, choices):
        return np.random.choice(choices)
