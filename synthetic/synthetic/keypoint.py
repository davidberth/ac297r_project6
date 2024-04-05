from pyrr import Matrix44, Vector3, Vector4
import numpy as np
from PIL import Image, ImageDraw


kcamera_pos = None
klook_at = None

keypoints = []


def set_camera(camera, look_at):
    global kcamera_pos, klook_at
    kcamera_pos = camera
    klook_at = look_at


def write(file, label: str, coord: tuple):
    """Project and write a given keypoint to a file

    Args:
        file: the open file
        label: the label of the keypoint
        coord: the coordinates of the keypoint
    """
    global kcamera_pos, klook_at
    file.write(f"keypoint_{label}_3d: {coord}\n")
    coord2d = project_to_2d(
        kcamera_pos, klook_at, (0, 1, 0), coord, 65, 1.2, 0.1, 10
    )
    file.write(f"keypoint_{label}_2d: {coord2d}\n")
    keypoints.append(coord2d)


def project_to_2d(
    camera_pos, look_at, up_vector, point_3d, fov, aspect_ratio, near, far
):
    """
    Projects a 3D point to 2D using pyrr for matrix operations.

    Args:
        camera_pos: Camera position as a list or numpy array [x, y, z].
        look_at: The point the camera is looking at [x, y, z].
        up_vector: The up direction for the camera [x, y, z].
        point_3d: The 3D point to project [x, y, z].
        fov: Field of view in degrees.
        aspect_ratio: The aspect ratio of the image (width / height).
        near: Near clipping plane distance.
        far: Far clipping plane distance.

    Returns:
        A numpy array [x, y] representing the projected 2D point in normalized device coordinates.
    """
    # Create view and projection matrices
    view_matrix = Matrix44.look_at(
        eye=Vector3(camera_pos), target=Vector3(look_at), up=Vector3(up_vector)
    )
    proj_matrix = Matrix44.perspective_projection(fov, aspect_ratio, near, far)

    # Convert the 3D point to a 4D vector with a homogeneous coordinate
    point_4d = Vector4([*point_3d, 1.0])

    # Apply view and projection transformations
    point_transformed = proj_matrix * (view_matrix * point_4d)
    # Perform perspective divide to get normalized device coordinates
    tpoint = np.array(point_transformed.xyz)
    w = point_transformed.w
    tpoint /= w
    tpoint = tpoint / 2 + 0.5
    tpoint = 1.0 - tpoint
    return tpoint[:2]


def apply_to_image(img_path: str, square_size: int):
    """Renders a square to an image. This is a generic function
    but currently is used for rendering keypoints

    Args:
        img_path (str): Path to the image to render
        square_size (int): Size of the square to render
    Returns:
        Saves a copy of the rendered image with keypoints rendered
    """
    image = Image.open(img_path + ".png")
    draw = ImageDraw.Draw(image)

    img_width, img_height = image.size

    # Convert normalized coordinates to pixel coordinates and draw squares
    for coord in keypoints:
        x_pixel = int(coord[0] * img_width)
        y_pixel = int(coord[1] * img_height)

        # Calculate the square's bounding box
        left = x_pixel - square_size // 2
        top = y_pixel - square_size // 2
        right = x_pixel + square_size // 2
        bottom = y_pixel + square_size // 2

        # Draw the square
        draw.rectangle([left, top, right, bottom], outline="red", width=2)

    # Save the modified image
    image.save(img_path + "_kp.png")
