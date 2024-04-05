import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
import fire


def plot_child(child_number: int):

    base_path = f"output/child_{child_number:06d}_"

    # load the rgb images
    angles = range(30, 151, 30)
    rgb_images = [base_path + f"rgb_{angle:03d}_kp.png" for angle in angles]
    rgb_images = [Image.open(image) for image in rgb_images]

    dpt_images


if __name__ == "__main__":
    fire.Fire(plot_child)
