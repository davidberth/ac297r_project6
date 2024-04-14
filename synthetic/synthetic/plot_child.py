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

    seg_images = [base_path + f"seg_{angle:03d}_kp.png" for angle in angles]
    seg_images = [np.array(Image.open(ig)) for ig in seg_images]

    text_files = [base_path + f"lbl_{angle:03d}.txt" for angle in angles]
    labels = []
    for tfile in text_files:
        with open(tfile, "rt") as file:
            data = {}
            for line in file:
                parsed_line = line.strip().split(":")
                if len(parsed_line) == 2:
                    tag, value = parsed_line
                    data[tag.strip()] = value.strip()
        labels.append(data)

    plt.rcParams["axes.facecolor"] = "black"
    plt.rcParams["figure.facecolor"] = "black"
    plt.rcParams["text.color"] = "white"
    plt.rcParams["axes.labelcolor"] = "gray"
    plt.rcParams["xtick.color"] = "gray"
    plt.rcParams["ytick.color"] = "gray"

    fig, axs = plt.subplots(3, 5, figsize=(20, 11), sharey=True)
    # Set the axes background color

    for i in range(0, len(rgb_images)):
        axs[0, i].imshow(rgb_images[i])

    for i in range(0, len(dpt_images)):
        axs[1, i].imshow(dpt_images[i], cmap="hot")

    for i in range(0, len(seg_images)):
        axs[2, i].imshow(seg_images[i], cmap="winter")
    child_height = float(labels[0]["child height (cm)"])
    plt.suptitle(
        f"Child Seed: {labels[0]['seed']} - Height: {child_height:.4f} cm"
    )
    plt.tight_layout()
    plt.savefig(f"plots/child_{child_number}.png")


if __name__ == "__main__":
    fire.Fire(plot_child)
