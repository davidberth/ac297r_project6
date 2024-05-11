import numpy as np
import matplotlib.pyplot as plt
from PIL import Image
import fire
import warnings


def plot_child(child_number: int, show=False):
    """Generate a plot for the given child numer

    Args:
        child_number (int): the child number to plot
        show (bool, optional): whether to show the plot. Defaults to False to save it to a file.
    Returns:
        None

    """
    warnings.filterwarnings(
        "ignore",
        message="This figure includes Axes that are not compatible with tight_layout, "
        "so results might be incorrect.",
    )
    warnings.filterwarnings(
        "ignore",
        message="set_ticklabels() should only be used with a fixed number of ticks",
    )

    base_path = f"output/child_{child_number:06d}_"

    # load the rgb images
    angles = range(30, 151, 30)
    rgb_images = [base_path + f"rgb_{angle:03d}.png" for angle in angles]
    rgb_images = [np.array(Image.open(ig)) for ig in rgb_images]

    dpt_images = [base_path + f"dpt_{angle:03d}.png" for angle in angles]
    dpt_images = [np.array(Image.open(ig)) for ig in dpt_images]

    seg_images = [base_path + f"seg_{angle:03d}.png" for angle in angles]
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

    # enable for dark mode

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
        im = axs[1, i].imshow(dpt_images[i][:, :, 0], cmap="copper")

    # add a horizontal colorbar at the bottom of the middle row plots
    cbar_ax = fig.add_axes(
        [0.15, 0.04, 0.7, 0.02]
    )  # adjust the position and size as needed
    im.set_clim(0, 200)
    cb = fig.colorbar(im, cax=cbar_ax, orientation="horizontal")

    current_labels = cbar_ax.get_xticks()

    # calculate new labels with custom scale and offset
    new_labels = 0.4 * current_labels + 100

    # set new labels to the colorbar
    cbar_ax.set_xticks(current_labels)  # set original tick locations
    cbar_ax.set_xticklabels(
        [f"{x:.2f}" for x in new_labels]
    )  # apply custom formatted labels
    cb.set_label("scene depth (cm)")
    for i in range(0, len(seg_images)):
        axs[2, i].imshow(seg_images[i], cmap="winter")
    child_height = float(labels[0]["child height (cm)"])
    plt.suptitle(
        f"Child Seed: {labels[0]['seed']} - Height: {child_height:.4f} cm"
    )
    plt.tight_layout(
        rect=[0, 0.1, 1, 0.96]
    )  # adjust layout to accommodate colorbar and suptitle

    if show:
        plt.show()
    else:
        plt.savefig(f"plots/child_{child_number}.png")


if __name__ == "__main__":
    fire.Fire(plot_child)
