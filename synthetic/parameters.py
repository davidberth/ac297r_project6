"""This module contians the global parameters for the synthetic data
generator. Parameters are sampled from various random distributions"""

import numpy as np
from numpy.random import randn
import template


class Parameters:
    def __init__(self):
        # direct parameters
        self.head_size = self.normal(0.7, 0.1)
        self.skin_color = self.color((1, 0.8, 0.6), (0.1, 0.1, 0.1))
        self.shorts_color = self.color((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))
        self.mat_texture = self.choose(
            [
                "Dark_Wood",
                "New_Brass",
                "White_Wood",
                "Tom_Wood",
                "Aluminum",
                "EBMWood1",
                "SilverFinish",
            ]
        )
        # meta parameters
        self.camera_distance = self.normal(9.0, 1.0)
        self.rotation_adj = self.normal(0.0, 4.0)

        self.right_arm_angle_xy = self.normal(0.0, 10.0)
        self.left_arm_angle_xy = self.normal(0.0, 10.0)
        self.right_arm_angle_z = self.normal(0.0, 5.0)
        self.left_arm_angle_z = self.normal(0.0, 5.0)

        self.left_leg_angle_xy = self.normal(0.0, 10.0)
        self.right_leg_angle_xy = self.normal(0.0, 10.0)
        self.right_leg_angle_z = self.normal(0.0, 5.0)
        self.left_leg_angle_z = self.normal(0.0, 5.0)

    def normal(self, mu, sigma):
        return randn() * sigma + mu

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
