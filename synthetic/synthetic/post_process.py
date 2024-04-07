import numpy as np
from PIL import Image, ImageDraw


def apply_noise(img_path: str, scale: float):

    image = Image.open(img_path + ".png")
    image = np.array(image)

    noise = np.random.normal(0, scale, image.shape)
    noisy_img = Image.fromarray((image + noise).clip(0, 255).astype(np.uint8))

    # Save the modified image
    noisy_img.save(img_path + ".png")


def apply_box(img_path: str, scale: float = 25):

    image = Image.open(img_path + ".png")
    image = np.array(image)

    for i in range(20):
        x = np.random.randint(0, 502)
        y = np.random.randint(0, 502)
        image[x : x + scale, y : y + scale, :] = 0
    image = Image.fromarray(image)

    # Save the modified image
    image.save(img_path + ".png")
