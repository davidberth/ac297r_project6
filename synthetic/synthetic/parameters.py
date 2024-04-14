"""This module contians the global parameters for the synthetic data
generator. Parameters are sampled from various random distributions"""

import numpy as np
from numpy.random import randn, uniform
import template


class Parameters:
    def __init__(self):
        # direct parameters
        self.head_size = self.normal(0.65, 0.05)
        self.skin_color = self.color((1, 0.8, 0.6), (0.1, 0.1, 0.1))
        self.shorts_color = self.color((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))
        self.mat_texture = self.integer(101, 200)

        # meta parameters
        self.camera_distance = self.normal(6.2, 0.2)
        self.rotation_adj = self.normal(0.0, 4.0)

        self.right_arm_angle_xy = self.normal(0.0, 10.0)
        self.left_arm_angle_xy = self.normal(0.0, 10.0)
        self.right_arm_angle_z = self.normal(0.0, 5.0)
        self.left_arm_angle_z = self.normal(0.0, 5.0)

        self.left_leg_angle_xy = self.normal(0.0, 10.0)
        self.right_leg_angle_xy = self.normal(0.0, 10.0)
        self.right_leg_angle_z = self.normal(0.0, 5.0)
        self.left_leg_angle_z = self.normal(0.0, 5.0)
        self.body_height = self.normal(2.48, 0.16)
        self.head_height = self.body_height + self.head_size * 0.75

        self.light_x = self.unif(-5.0, 5.0)
        self.light_y = self.unif(-5.0, 5.0)

        self.light1 = self.unif(0.3, 1.0)
        self.light2 = self.unif(0.3, 1.0)
        self.light3 = self.unif(0.2, 1.0)
        self.light4 = self.unif(0.3, 1.0)

        self.backcolor1 = self.unif(0.0, 1.0)
        self.backcolor2 = self.unif(0.0, 1.0)
        self.backcolor3 = self.unif(0.0, 1.0)

        self.haircolor1 = self.unif(0.0, 1.0)
        self.haircolor2 = self.unif(0.0, 1.0)
        self.haircolor3 = self.unif(0.0, 1.0)

        self.eye_color_index = self.integer(0, 9)
        self.smile_factor = self.unif(-40.0, 100.0)

        self.mat_rotate_y = self.unif(-2.0, 2.0)
        self.mat_rotate_z = self.unif(-3.0, 3.0)

        self.child_rotate_y = self.normal(0.0, 4.0)
        self.child_rotate_z = self.normal(0.0, 4.0)

        self.child_height = self.body_height + self.head_size * 1.75

    def normal(self, mu, sigma):
        return randn() * sigma + mu

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
