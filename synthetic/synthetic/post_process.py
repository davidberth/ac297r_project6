import numpy as np
from PIL import Image, ImageDraw


def apply_noise(img_path: str, scale: float):
    """
    Applies Gaussian noise to an image and saves it.

    Args:
        img_path (str): The path to the image file without the extension.
        scale (float): The standard deviation of the Gaussian noise.

    """

    image = Image.open(img_path + ".png")
    image = np.array(image)

    noise = np.random.normal(0, scale, image.shape)
    noisy_img = Image.fromarray((image + noise).clip(0, 255).astype(np.uint8))

    # Save the modified image
    noisy_img.save(img_path + ".png")


def apply_box(img_path: str, scale: float = 25):
    """
    Draws black boxes at random locations on an image and saves it.

    Args:
        img_path (str): The path to the image file without the extension.
        scale (float): The size of the sides of the square boxes.

    """

    image = Image.open(img_path + ".png")
    image = np.array(image)

    for i in range(20):
        x = np.random.randint(0, 502)
        y = np.random.randint(0, 502)
        image[x : x + scale, y : y + scale, :] = 0
    image = Image.fromarray(image)

    # Save the modified image
    image.save(img_path + ".png")


def apply_mask(img_path: str, scale: float = 25):
    """
    Applies a mask to an image that sets pixels to white if any of their RGB values are non-zero, then saves it.

    Args:
        img_path (str): The path to the image file without the extension.
        scale (float): Unused parameter, included for function signature consistency.

    """
    imgp = img_path + ".png"
    image = Image.open(imgp)
    image = np.array(image)

    mask = image[:, :, 0] // 3 + image[:, :, 1] // 3 + image[:, :, 2] // 3
    image[mask > 0, :] = 255

    image = Image.fromarray(image)

    # Save the modified image
    image.save(imgp)
