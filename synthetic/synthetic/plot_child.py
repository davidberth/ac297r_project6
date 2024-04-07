import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
import fire


def plot_child(child_number: int):

    base_path = f"output/child_{child_number:06d}_"

    # load the rgb images
    angles = range(30, 151, 30)
    rgb_images = [base_path + f"rgb_{angle:03d}_kp.png" for angle in angles]
    rgb_images = [np.array(Image.open(ig)) for ig in rgb_images]

    dpt_images = [base_path + f"dpt_{angle:03d}_kp.png" for angle in angles]
    dpt_images = [np.array(Image.open(ig)) for ig in dpt_images]

    plt.rcParams["axes.facecolor"] = "black"
    plt.rcParams["figure.facecolor"] = "black"
    plt.rcParams["text.color"] = "white"
    plt.rcParams["axes.labelcolor"] = "gray"
    plt.rcParams["xtick.color"] = "gray"
    plt.rcParams["ytick.color"] = "gray"

    fig, axs = plt.subplots(2, 5, figsize=(16, 7), sharey=True)
    # Set the axes background color

    for i in range(0, len(rgb_images)):
        axs[0, i].imshow(rgb_images[i])

    for i in range(0, len(dpt_images)):
        axs[1, i].imshow(dpt_images[i], cmap="hot")
    plt.suptitle(f"Child number: {child_number} - Seed: 12")
    plt.tight_layout()
    plt.savefig(f"plots/child_{child_number}.png")


if __name__ == "__main__":
    fire.Fire(plot_child)
